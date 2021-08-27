import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pigment/pigment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/icon_button.dart';

// TODO: 分享内容：长图+底部app下载二维码，分享方式：微信会话、微信朋友圈、保存到相册
class ShareAction extends StatefulWidget {
  const ShareAction({Key? key}) : super(key: key);

  @override
  _ShareActionState createState() => _ShareActionState();
}

class _ShareActionState extends State<ShareAction> {
  @override
  Widget build(BuildContext context) {
    return CommonIconButton(
      icon: Center(
        child: SvgPicture.asset(
          'assets/images/ic_share.svg',
          color: Pigment.fromString("#333"),
          fit: BoxFit.fitWidth,
          width: 24.w,
        ),
      ),
      onTap: () {},
      size: 36.sp,
    );
  }
}
