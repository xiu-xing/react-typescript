import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/account/account.data.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.req.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.var.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.data.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.req.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/404/404.dart';
import 'package:rime_app/widgets/common/chip/chip_gird.dart';
import 'package:rime_app/widgets/common/flat_text_button/flat_text_button.dart';
import 'package:rime_app/widgets/common/loading/loading.dart';
import 'package:rime_app/widgets/common/scroll_behavior.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key, required this.place}) : super(key: key);

  final String place;
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int currentStep = 0;
  bool canPop = false;
  List<GUserProfileData_userProfile_fields> fields = [];
  Map<String, List<GUserProfileFieldOptionInput>> selectedMap = new Map();
  StreamSubscription? updateUserProfileLinsener;
  bool fetching = true;

  bool checkFieldSelected() {
    if (fields.isEmpty) return false;
    if (!(fields[currentStep].isRequired ?? true)) return true;
    String mapKey = fields[currentStep].name;
    return selectedMap.containsKey(mapKey) && selectedMap[mapKey]!.isNotEmpty;
  }

  void onTap() {
    if (currentStep != fields.length - 1) {
      setState(() => currentStep += 1);
      return;
    }
    GUpdateUserProfileInputBuilder builder = GUpdateUserProfileInputBuilder();
    List<GUserProfileFieldInput> newFields = [];
    selectedMap.forEach((k, v) {
      GUserProfileFieldInputBuilder bTemp = GUserProfileFieldInputBuilder();
      bTemp.name = k;
      bTemp.selectedOptions.replace(v);
      newFields.add(bTemp.build());
    });
    builder.fields.replace(newFields);
    GUpdateUserProfileReq request = GUpdateUserProfileReq((b) => b
      ..requestId = "UpdateUserProfile"
      ..vars.input = builder);
    if (updateUserProfileLinsener == null)
      updateUserProfile(request);
    else
      GQL.ferryClient.requestController.add(request);
  }

  void getUserProfile() {
    setState(() => fetching = true);
    GUserProfileReq request = GUserProfileReq((b) => b);
    GQL.executeQuery<GUserProfileData, GUserProfileVars>(
      request,
      onData: (s, r) {
        setState(() => fetching = false);
        s.cancel();
        if (r.data?.userProfile?.fields == null) return;
        setState(() => fields = r.data!.userProfile!.fields!.toList());
      },
      onError: (s, e) {
        setState(() => fetching = false);
        s.cancel();
      },
    );
  }

  void updateUserProfile(GUpdateUserProfileReq request) {
    updateUserProfileLinsener =
        GQL.executeQuery<GUpdateUserProfileData, GUpdateUserProfileVars>(
      request,
      onData: (s, r) {
        if (r.data?.updateUserProfile?.fields == null) return;
        r.data!.updateUserProfile!.fields!.forEach((e) {
          if (e.selectedOptions != null && e.selectedOptions!.length > 0) {
            setState(() => canPop = true);
          }
          if (!canPop) return;
        });

        router.navigateTo(context, Routes.home, replace: true);
      },
      onError: (s, e) {
        GQL.showErrorToast(e);
      },
    );
  }

  Widget content() {
    if (fetching)
      return SizedBox(
        height: 300,
        child: Center(child: Loading(scale: .4)),
      );
    if (fields.isEmpty) return Empty404(reload: getUserProfile);
    GUserProfileData_userProfile_fields field = fields[currentStep];

    Widget _grid = SingleChildScrollView(
      child: ChipGridView(
        list: field.options?.toList() ?? [],
        onValueChange: (v) {
          selectedMap[field.name] = v;
          setState(() {});
        },
        isMultiple: field.isMultiple ?? false,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field.title,
          style: TextStyle(
            fontFamily: notoSansSC,
            fontWeight: FontWeight.w500,
            color: Pigment.fromString("#333"),
            fontSize: 26.sp,
          ),
        ),
        SizedBox(height: 24.h),
        Container(
          constraints: BoxConstraints(maxHeight: 428.h),
          child: Platform.isAndroid
              ? ScrollConfiguration(
                  behavior: CustomScrollBehavior(),
                  child: _grid,
                )
              : _grid,
        ),
      ],
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      getUserProfile();
    });
    super.initState();
  }

  @override
  void dispose() {
    updateUserProfileLinsener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 72.h),
              content(),
              Spacer(),
              FlatTextButton(
                text: currentStep == fields.length - 1 ? "完成" : "下一步",
                onTap: checkFieldSelected() ? onTap : null,
                width: 311.w,
                textStyle:
                    headline2.copyWith(color: Pigment.fromString("#FFF")),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
