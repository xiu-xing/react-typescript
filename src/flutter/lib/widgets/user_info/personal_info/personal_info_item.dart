import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoItem extends StatelessWidget {
  const PersonalInfoItem({
    Key? key,
    required this.title,
    required this.content,
    this.onPress,
    required this.showIcon,
    this.isAvatar,
  }) : super(key: key);
  final String title;
  final void Function()? onPress;
  final String content;
  final bool showIcon;
  final bool? isAvatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'NotoSansSC',
              color: grey73,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 8.h, bottom: 12.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Pigment.fromString("#eee"),
                    width: 1.0,
                  ),
                ),
              ),
              child: InkWell(
                onTap: onPress,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isAvatar ?? false
                        ? NetWorkImage(
                            size: 32.w,
                            image: content == ""
                                ? ""
                                : "$STAIC_ASSETS_ENDPOINT$content",
                            placeholder: SvgPicture.asset(
                              "assets/images/avatar.svg",
                              width: 32.w,
                              height: 32.w,
                            ),
                            shape: BoxShape.circle,
                          )
                        : Expanded(
                            child: Container(
                              child: Text(
                                content,
                                style: headline4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                    Icon(
                      showIcon ? Icons.chevron_right : null,
                      size: 26.sp,
                      color: grey66,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
