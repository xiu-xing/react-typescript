import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';

class NetWorkImage extends StatelessWidget {
  final String image;
  final double? size;
  final double? width;
  final double? height;
  final EdgeInsets margin;
  final double radius;
  final Color? backgroundColor;
  final BoxShape? shape;
  final BoxBorder? border;
  final String? placeholderImg;
  final Widget? placeholder;
  final Map<String, String>? httpHeaders;

  NetWorkImage(
      {Key? key,
      required this.image,
      this.size,
      this.width,
      this.height,
      this.margin = EdgeInsets.zero,
      this.radius = 2,
      this.shape,
      this.backgroundColor,
      this.border,
      this.placeholderImg,
      this.placeholder,
      this.httpHeaders})
      : super(key: key);

  Widget fetchingPlaceholderWidget() {
    return Container(
      width: size ?? width ?? 30.w,
      height: size ?? height ?? 30.w,
      // margin: margin,
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        borderRadius: shape == BoxShape.circle
            ? null
            : BorderRadius.all(Radius.circular(radius.w)),
        border: border ??
            Border.all(
              color: Pigment.fromString('#CCCCCCFF').withOpacity(0.4),
              width: 0.5.w,
            ),
      ),
    );
  }

  Widget errorPlaceholderWidget() {
    return Container(
      width: size ?? width ?? 30.w,
      height: size ?? height ?? 30.w,
      margin: margin,
      decoration: BoxDecoration(
        // color: backgroundDarkColor,
        borderRadius: shape == BoxShape.circle
            ? null
            : BorderRadius.all(Radius.circular(radius.w)),
        shape: shape ?? BoxShape.rectangle,
        image: placeholder != null
            ? null
            : DecorationImage(
                image: AssetImage(placeholderImg ??
                    'assets/images/placeholder/avatar_placeholder.png'),
                fit: BoxFit.contain,
              ),
      ),
      child: placeholder,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (image == "") return errorPlaceholderWidget();
    return Container(
      margin: margin,
      child: CachedNetworkImage(
        httpHeaders: httpHeaders,
        imageUrl: image,
        imageBuilder: (context, imageProvider) {
          return Container(
            width: size ?? width ?? 30.w,
            height: size ?? height ?? 30.w,
            decoration: BoxDecoration(
              shape: shape ?? BoxShape.rectangle,
              borderRadius: shape == BoxShape.circle
                  ? null
                  : BorderRadius.all(Radius.circular(radius.w)),
              border: border ??
                  Border.all(
                    color: Pigment.fromString('#CCCCCCFF').withOpacity(0.4),
                    width: 0.5.w,
                  ),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
        placeholder: (context, url) => fetchingPlaceholderWidget(),
        errorWidget: (context, url, error) => errorPlaceholderWidget(),
      ),
    );
  }
}
