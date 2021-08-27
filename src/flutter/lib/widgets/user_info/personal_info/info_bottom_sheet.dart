import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/account/account.data.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.req.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.var.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.data.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/realm/condition_list/inputs/selection.dart';

class InfoBottomSheet extends StatefulWidget {
  InfoBottomSheet({Key? key, required this.item}) : super(key: key);
  final GUserProfileData_userProfile_fields item;

  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<InfoBottomSheet> {
  GUserProfileFieldOptionInputBuilder builder =
      GUserProfileFieldOptionInputBuilder();
  StreamSubscription? updateUserProfileLinsener;
  List<GUserProfileFieldOptionInput> mulSelected = [];

  @override
  void initState() {
    widget.item.selectedOptions!.forEach((item) {
      builder.name = item.name;
      builder.value = item.value;
      mulSelected.add(builder.build());
    });
    super.initState();
  }

  @override
  void dispose() {
    updateUserProfileLinsener?.cancel();
    super.dispose();
  }

  Widget tagWidget(
      MapEntry<int, GUserProfileData_userProfile_fields_options> option) {
    bool select =
        mulSelected.any((element) => element.name == option.value.name);
    return Container(
      width: MediaQuery.of(context).size.width * 0.27,
      margin: EdgeInsets.only(bottom: 12.h),
      child: Selection(
        text: option.value.name,
        select: select,
        index: option.key,
        callback: (int index) {
          bool isHaveElement = false;
          mulSelected.forEach((element) {
            if (element.name == widget.item.options![index].name) {
              isHaveElement = true;
            }
          });
          builder.name = widget.item.options![index].name;
          builder.value = widget.item.options![index].value;
          bool isMultiple = widget.item.isMultiple ?? false;
          if (isHaveElement) {
            setState(() {
              mulSelected.removeWhere((element) =>
                  element.name == widget.item.options![index].name);
            });
          } else {
            if (!isMultiple) {
              mulSelected.clear();
              setState(() {
                mulSelected.add(builder.build());
              });
            } else {
              setState(() {
                mulSelected.add(builder.build());
              });
            }
          }
        },
      ),
    );
  }

  void applyBufferdFilterInputs() {
    MuseEventUtil.sendEvent(
      eventId: MuseEventUtil.PersonalInfoUpdateId,
      value: {
        "submit": {"value": widget.item.name}
      },
    );
    if (mulSelected.isEmpty) {
      showToast("亲，至少需要选择一条哦！");
      return;
    }
    GUpdateUserProfileInputBuilder bUpdate = GUpdateUserProfileInputBuilder();
    List<GUserProfileFieldInput> newFields = [];
    GUserProfileFieldInputBuilder bTemp = GUserProfileFieldInputBuilder();
    bTemp.name = widget.item.name;
    bTemp.selectedOptions.replace(mulSelected);
    newFields.add(bTemp.build());
    bUpdate.fields.replace(newFields);
    GUpdateUserProfileReq request = GUpdateUserProfileReq((b) => b
      ..requestId = "UpdateUserProfile"
      ..vars.input = bUpdate);
    if (updateUserProfileLinsener == null) {
      updateUserProfile(request);
    } else {
      GQL.ferryClient.requestController.add(request);
    }
  }

  void updateUserProfile(GUpdateUserProfileReq request) {
    updateUserProfileLinsener =
        GQL.executeQuery<GUpdateUserProfileData, GUpdateUserProfileVars>(
      request,
      onData: (s, r) {
        if (r.data?.updateUserProfile?.fields == null) return;
        if (mulSelected.isNotEmpty) {
          String content = mulSelected.map((i) => i.name).toList().join("、");
          Navigator.pop(context, content);
        }
      },
      onError: (s, e) {
        GQL.showErrorToast(e);
      },
    );
  }

  void resetBufferedFilterInputs() {
    setState(() {
      mulSelected.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: MediaQuery.of(context).size.height * 0.70,
      child: Wrap(
        direction: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              top: 24,
              bottom: 32,
            ),
            child: Text(
              widget.item.name,
              style: TextStyle(
                color: regularColor,
                fontFamily: notoSansSC,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.60,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(right: 20.h, left: 20.h),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: widget.item.options!
                    .asMap()
                    .entries
                    .map((option) => tagWidget(option))
                    .toList(),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 1, color: greyEE)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: resetBufferedFilterInputs,
                      child: Container(
                        constraints: BoxConstraints(
                          minWidth: 88.0.w,
                          maxHeight: 46.0.h,
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "重置",
                          style: headline2.copyWith(
                            color: greyA6,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    color: primaryColor,
                    child: InkWell(
                      onTap: applyBufferdFilterInputs,
                      child: Container(
                        constraints: BoxConstraints(
                          minWidth: 88.0.w,
                          maxHeight: 46.0.h,
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "确定",
                          style: headline2.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
