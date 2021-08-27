import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluwx/fluwx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/account/account.data.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.req.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.var.gql.dart';
import 'package:rime_app/graphql/mutations/updateUserInfo/updateUserInfo.data.gql.dart';
import 'package:rime_app/graphql/mutations/updateUserInfo/updateUserInfo.req.gql.dart';
import 'package:rime_app/graphql/mutations/updateUserInfo/updateUserInfo.var.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.data.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.req.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/appbar/primary_appbar.dart';
import 'package:rime_app/widgets/user_info/personal_info/personal_info_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/user_info/personal_info/info_bottom_sheet.dart';
import 'package:rime_app/widgets/verification/widgets/cropImage.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  List<GUserProfileData_userProfile_fields> fields = [];
  ScrollController scrollController = ScrollController();
  StreamSubscription? _wechatCallbackStream;
  Map<String, String> contentMap = Map();
  UniqueKey resetKey = UniqueKey();
  String userName = "";
  String avatarUrl = "";
  String phone = "";
  bool bindWechat = false;

  void getUserProfile() {
    GUserProfileReq request = GUserProfileReq((b) => b);
    GQL.executeQuery<GUserProfileData, GUserProfileVars>(
      request,
      onData: (s, r) {
        if (r.data?.userProfile?.fields == null) return;
        setState(() {
          fields = r.data!.userProfile!.fields!.toList();
        });
        s.cancel();
      },
      onError: (s, e) {
        s.cancel();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    userName = Global.userProvider.user!.userName!;
    avatarUrl = Global.userProvider.user!.avatarURL!;
    phone = Global.userProvider.user!.phone!;
    bindWechat = Global.userProvider.user!.hasBoundWechat!;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      getUserProfile();
    });
    _listenWechatCallback();
  }

  @override
  void dispose() {
    super.dispose();
    _wechatCallbackStream?.cancel();
  }

  List<Widget> getUserInfoItem() {
    List<PersonalInfoItem> list = [];
    if (fields.isNotEmpty) {
      fields.forEach((item) {
        if (item.selectedOptions != null) {
          String _title = item.name;
          String _content =
              item.selectedOptions!.map((i) => i.name).toList().join("、");
          list.add(PersonalInfoItem(
            title: _title,
            content: contentMap[_title] ?? _content,
            onPress: () => _updateInfo(item, _title),
            showIcon: true,
            isAvatar: false,
          ));
        }
      });
    }
    return list;
  }

  void _updateInfo(GUserProfileData_userProfile_fields item, String title) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return Container(
            child: InfoBottomSheet(item: item),
          );
        }).then((value) {
      if (value == null) return;
      setState(() {
        contentMap[title] = value;
      });
      getUserProfile();
    });
  }

  // 更换头像
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.24),
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "更换头像",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: normalColor,
                  fontFamily: notoSansSC,
                ),
              ),
              SizedBox(
                height: 12.w,
              ),
              InkWell(
                  onTap: chooseImage,
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.w, bottom: 10.w),
                    child: Row(
                      children: [
                        Text(
                          "从相册中选择",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: grey66,
                            fontFamily: notoSansSC,
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 4.w,
              ),
              InkWell(
                onTap: takePhoto,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.w, bottom: 12.w),
                  child: Row(
                    children: [
                      Text(
                        "拍照",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: grey66,
                          fontFamily: notoSansSC,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future chooseImage() async {
    router.pop(context);
    await ImagePicker().pickImage(source: ImageSource.gallery).then((image) {
      if (image != null) {
        cropImage(File(image.path));
      }
    });
  }

  Future takePhoto() async {
    router.pop(context);
    await ImagePicker().pickImage(source: ImageSource.camera).then((image) {
      if (image != null) {
        cropImage(File(image.path));
      }
    });
  }

  void cropImage(File image) async {
    File result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CropImage(image, aspectRatio: 1.0)));
    if (result.lengthSync() > 8 * 1024 * 1024) {
      showToast("图片太大");
      return;
    }
    if (result.path != '') {
      String url = await GQL.dioUpload(result).catchError((e) {
        showToast("上传头像失败,请检查图片格式。", position: ToastPosition.center);
      });
      if (url == "") {
        showToast("上传头像失败,请检查图片格式。", position: ToastPosition.center);
        return;
      }
      _uploadAvatar(url);
      setState(() {
        avatarUrl = url;
      });
    }
  }

  void _uploadAvatar(String url) {
    GQL.executeQuery<GUpdateUserInfoData, GUpdateUserInfoVars>(
      GUpdateUserInfoReq(
        (b) => b..vars.input.avatarURL = url,
      ),
      onData: (stream, data) {
        stream.cancel();
        if (data.hasErrors) {
          showToast("请求错误");
        }
        if (data.data?.updateUserInfo != null) {
          Global.userProvider
              .setUser(avatarURL: data.data?.updateUserInfo?.avatarURL);
        }
      },
      onError: (stream, err) {
        stream.cancel();
        showToast("请求错误");
      },
    );
  }

  //绑定微信
  void weChatsignIn() async {
    if (bindWechat) return;
    bool isInstalled = await isWeChatInstalled;
    if (isInstalled) {
      sendWeChatAuth(scope: "snsapi_userinfo", state: "rime").catchError((e) {
        showToast(e);
      });
    } else {
      showToast("请先安装微信");
    }
  }

  void _listenWechatCallback() {
    _wechatCallbackStream =
        weChatResponseEventHandler.distinct((a, b) => a == b).listen((res) {
      if (res is WeChatAuthResponse) {
        if (res.errCode == 0 && res.state == "rime" && res.code != null) {
          weChatBindGraphQL(res.code!);
        } else if (res.errCode == -4) {
          showToast("退出绑定");
        } else if (res.errCode == -2) {
          showToast("取消授权");
        }
      }
    });
  }

  void weChatBindGraphQL(String code) {
    GQL.executeQuery<GBindWechatData, GBindWechatVars>(
      GBindWechatReq((b) => b
        ..vars.code = code
        ..vars.platform = GNextPlatform.PLATFORM_MOBILE),
      onData: (stream, data) {
        stream.cancel();
        if (data.hasErrors) {
          showToast("账号已被使用");
        }
        if (data.data!.bindWechat == true) {
          setState(() {
            bindWechat = data.data!.bindWechat!;
          });
          Global.userProvider.setUser(hasBoundWechat: data.data!.bindWechat);
        }
      },
      onError: (stream, err) {
        stream.cancel();
        showToast("绑定失败");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonAppbar(
        titleCenter: true,
        title: Text("个人信息", style: headline1),
        actions: [SizedBox(width: 40.w)],
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 14.h, left: 24.w, right: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            PersonalInfoItem(
              title: "头像",
              content: avatarUrl,
              onPress: _showBottomSheet,
              showIcon: true,
              isAvatar: true,
            ),
            PersonalInfoItem(
                title: "昵称",
                content: userName,
                onPress: () {
                  String name = Uri.encodeComponent(userName);
                  router
                      .navigateTo(context, "${Routes.nickName}?name=$name")
                      .then((value) {
                    setState(() {
                      userName = value;
                    });
                  });
                },
                showIcon: true),
            PersonalInfoItem(
              title: "手机号",
              content: phone,
              showIcon: false,
            ),
            PersonalInfoItem(
              title: "微信",
              content: bindWechat ? "已绑定" : "未绑定",
              showIcon: !bindWechat,
              onPress: weChatsignIn,
            ),
            ...getUserInfoItem().toList()
          ],
        ),
      ),
    );
  }
}
