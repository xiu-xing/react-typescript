import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/widgets/common/network_image.dart';

import '../../../theme.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    this.name,
    this.avatarURI,
    this.serviceEndTime,
  }) : super(key: key);

  final String? name;
  final String? avatarURI;
  final String? serviceEndTime;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        child: NetWorkImage(
          size: 56.w,
          image: avatarURI == null || avatarURI == ""
              ? ""
              : "$STAIC_ASSETS_ENDPOINT$avatarURI",
          placeholder: SvgPicture.asset(
            "assets/images/avatar.svg",
            width: 56.w,
            height: 56.w,
          ),
          shape: BoxShape.circle,
        ),
        onTap: () => router.navigateTo(context, Routes.personalInfo),
      ),
      contentPadding: EdgeInsets.only(
        top: 16.0.w,
        left: 24.w,
        bottom: 16.w,
      ),
      title: name == null
          ? Container()
          : Text(
              name ?? "",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                fontFamily: notoSansSC,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
      subtitle: Text(
        serviceEndTime ?? "您还不是会员",
        style: bodyText1.copyWith(color: grey66),
      ),
      trailing: GestureDetector(
        onTap: () {
          if (serviceEndTime == null)
            router.navigateTo(context, Routes.payment);
          else
            router.navigateTo(
              context,
              "${Routes.payment}?serviceEndTime=${Uri.encodeComponent(serviceEndTime ?? "")}",
            );
        },
        child: Container(
          child: Text(
            serviceEndTime == null ? "开通 VIP" : "续费 VIP",
            style: bodyText1.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
          padding: EdgeInsets.fromLTRB(16.w, 8.w, 12.w, 8.w),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Pigment.fromString("#4f709b33"),
                offset: Offset(0, 1),
                blurRadius: 8.0,
              ),
              BoxShadow(
                  color: Pigment.fromString("#4f709b1f"),
                  offset: Offset(0, 3),
                  blurRadius: 3.0,
                  spreadRadius: -2),
              BoxShadow(
                color: Pigment.fromString("#4f709b24"),
                offset: Offset(0, 3),
                blurRadius: 4.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
