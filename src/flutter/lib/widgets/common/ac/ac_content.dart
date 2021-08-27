import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/custom_icons/custom_icons.dart';

class ACContent extends StatelessWidget {
  final String? title;
  final List<String>? rights;

  const ACContent({
    Key? key,
    this.title: "升级会员解锁内容",
    this.rights: const ["私募投融数据全覆盖", "独家硬科技十大领域", "更多精彩等你来发掘"],
  }) : super(key: key);

  factory ACContent.simple({Key? key}) = ACContent;

  factory ACContent.readLimit({Key? key}) {
    return ACContent(
      title: "您已达到每日查看上限 升级会员解锁限制",
      rights: ['丰富的一级市场研究数据', '全面掌握市场新动态', '更多精彩等你来挖掘'],
    );
  }

  factory ACContent.loadLimit({Key? key}) {
    return ACContent(
      title: "您已达到加载数量上限 升级会员解锁限制",
      rights: ['丰富的一级市场研究数据', '全面掌握市场新动态', '更多精彩等你来挖掘'],
    );
  }

  factory ACContent.trackLimit({Key? key}) {
    return ACContent(
      title: "您已达到追踪数量上限 升级会员解锁限制",
      rights: ['丰富的一级市场研究数据', '全面掌握市场新动态', '更多精彩等你来挖掘'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        left: 24.w,
        top: 56.w,
        bottom: 36.w,
        right: 24.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            4.w,
          ),
        ),
        image: DecorationImage(
          image: AssetImage(
            "assets/images/discovery/header-background.png",
          ),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title!,
            style: overline.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 24.w,
          ),
          Wrap(
            direction: Axis.vertical,
            spacing: 8.w,
            children: rights!
                .map(
                  (e) => Wrap(
                    spacing: 6.w,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2.w,
                          ),
                        ),
                      ),
                      Text(
                        e,
                        style: bodyText1.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 45.w,
          ),
          TextButton.icon(
            onPressed: () => router.navigateTo(context, Routes.payment),
            icon: Text(
              "升级会员",
              style: subtitle1.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            label: Icon(
              CustomIcons.halfchenvronright,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
