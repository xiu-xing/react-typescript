import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/appbar/primary_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/wrapper/logo-header/logo-header.dart';

class Share extends StatelessWidget {
  const Share({
    Key? key,
    required this.title,
    this.content,
    this.publishTime,
  }) : super(key: key);

  final String title;
  final String? content;
  final String? publishTime;

  void shareSession() {
    // shareToWeChat(WeChatShareImageModel(WeChatImage.file("souce"), scene: WeChatScene.SESSION));
    // shareToWeChat(WeChatShareImageModel(WeChatImage.file("souce"), scene: WeChatScene.TIMELINE));
  }

  Widget divider(List<Color> colors) {
    return Container(
      width: 110.w,
      height: 1.h,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }

  Widget iconButtonWidget(
    String imageUrl,
    String text, {
    void Function()? onTap,
  }) {
    return Column(
      children: [
        Container(
          width: 32.w,
          height: 32.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
            ),
          ),
        ),
        Text(
          text,
          style: bodyText2.copyWith(
            color: Pigment.fromString("#666"),
          ),
        ),
      ],
    );
  }

  Widget bottomWidget() {
    return Container(
      height: 104.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              divider([
                Pigment.fromString("#FFFFFF"),
                Pigment.fromString("#E7E7E7")
              ]),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text("分享至", style: bodyText1),
              ),
              divider([
                Pigment.fromString("#E7E7E7"),
                Pigment.fromString("#FFFFFF")
              ]),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconButtonWidget("assets/images/share/wechat.png", "微信好友"),
              iconButtonWidget("assets/images/share/timeline.png", "朋友圈"),
              iconButtonWidget("assets/images/share/download.png", "保存到相册"),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        customizable: true,
        leading: Container(
          margin: EdgeInsets.only(left: 24.w),
          child: GestureDetector(
            onTap: () {
              router.pop(context);
            },
            child: Text(
              "取消",
              style: headline2.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
      body: LogoHeaderWrapper(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 249.w,
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: headline4.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    publishTime ?? "",
                    style: bodyText1.copyWith(
                      color: Pigment.fromString("#999"),
                      height: 2.2,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
                children: [
                  Text(
                    content ?? "",
                    style: bodyText1.copyWith(
                      color: Pigment.fromString("#666"),
                    ),
                  )
                ],
              ),
            ),
            bottomWidget(),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
