import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/updateUserInfo/updateUserInfo.data.gql.dart';
import 'package:rime_app/graphql/mutations/updateUserInfo/updateUserInfo.req.gql.dart';
import 'package:rime_app/graphql/mutations/updateUserInfo/updateUserInfo.var.gql.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/appbar/primary_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NickName extends StatefulWidget {
  const NickName({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  _NickNameState createState() => _NickNameState();
}

class _NickNameState extends State<NickName> {
  String nickname = "";
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    nickname = widget.name;
    _controller.text = nickname;
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    _controller.dispose();
  }

  void handleSave() {
    MuseEventUtil.sendEvent(
      eventId: MuseEventUtil.PersonalInfoNickname,
      value: {
        "nickname": {"value": "nicknameUpdate"}
      },
    );
    GQL.executeQuery<GUpdateUserInfoData, GUpdateUserInfoVars>(
      GUpdateUserInfoReq(
        (b) => b..vars.input.userName = nickname,
      ),
      onData: (stream, data) {
        stream.cancel();
        if (data.hasErrors) {
          showToast("请求错误");
        }
        if (data.data?.updateUserInfo != null) {
          Global.userProvider
              .setUser(userName: data.data?.updateUserInfo?.userName);
          router.pop(context, data.data?.updateUserInfo?.userName);
        }
      },
      onError: (stream, err) {
        stream.cancel();
        showToast("请求错误");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        titleCenter: true,
        title: Text("昵称", style: headline1),
        actions: [
          InkWell(
            onTap: handleSave,
            child: Text("保存", style: headline2),
          ),
          SizedBox(width: 16.w)
        ],
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 14.w, left: 24.w, right: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "昵称",
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'NotoSansSC',
                color: grey73,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Pigment.fromString("#eee"),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8),
                    child: TextField(
                      controller: _controller,
                      onChanged: (text) {
                        setState(() {
                          nickname = text;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.clear();
                      setState(() {
                        nickname = "";
                      });
                    },
                    child: Icon(
                      MdiIcons.closeCircle,
                      size: 24.sp,
                      color: Pigment.fromString('#A6A6A6'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
