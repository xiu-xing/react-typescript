import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_crop/image_crop.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/flat_text_button/flat_text_button.dart';

class CropImage extends StatefulWidget {
  CropImage(this.image);

  final File image;

  @override
  _CropImageState createState() => new _CropImageState();
}

class _CropImageState extends State<CropImage> {
  double? baseLeft;
  double? baseTop;
  double? imageWidth;
  double imageScale = 1;
  Image? imageView;
  final cropKey = GlobalKey<CropState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.8,
              child: Crop.file(
                widget.image,
                key: cropKey,
                aspectRatio: 304 / 171,
                alwaysShowGrid: true,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.h),
              width: 200.w,
              height: 50.h,
              child: FlatTextButton(
                onTap: () {
                  _crop(widget.image);
                },
                disableColor: disabledButtonColor,
                text: "确定",
                textStyle: subtitle1.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _crop(File originalFile) async {
    final crop = cropKey.currentState;
    if (crop == null) {
      Navigator.pop(context, originalFile.path);
      return;
    }
    final area = crop.area;
    if (area == null) {
      Navigator.pop(context, originalFile.path);
      return;
    }
    await ImageCrop.requestPermissions().then((value) {
      if (value) {
        ImageCrop.cropImage(
          file: originalFile,
          area: area,
        ).then((value) {
          Navigator.pop(context, value);
        }).catchError((e) {
          Navigator.pop(context, new File(''));
        });
      } else {
        Navigator.pop(context, originalFile);
      }
    });
  }
}
