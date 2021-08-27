import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/widgets/common/bottomList/bottomList.dart';
import 'package:rime_app/widgets/verification/widgets/cropImage.dart';

class BusinessCardContainer extends StatefulWidget {
  final List<String> images;
  final ValueChanged<File>? cardImgOnChange;

  BusinessCardContainer({
    Key? key,
    required this.images,
    this.cardImgOnChange,
  })  : assert(images.length > 0 && images.length <= 2),
        super(key: key);

  @override
  _BusinessCardContainerState createState() => _BusinessCardContainerState();
}

class _BusinessCardContainerState extends State<BusinessCardContainer> {
  String _localCardUrl = '';
  File? _cardImg;

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomList(
          tabs: ["从相册上传", "拍照上传"],
          onTaps: [chooseImage, takePhoto],
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

  void cropImage(File originalImage) async {
    File result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => CropImage(originalImage)));

    if (result.path != '') {
      setState(() {
        _cardImg = result;
        _localCardUrl = result.path;
      });
      if (widget.cardImgOnChange != null) widget.cardImgOnChange!(_cardImg!);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cardImgOnChange == null) {
      return Container(
        height: 165.h,
        width: 311.w,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(widget.images[0]),
          fit: BoxFit.fill,
        )),
      );
    }
    return GestureDetector(
      onTap: _showBottomSheet,
      child: Container(
        height: 165.h,
        width: 311.w,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
              _localCardUrl == '' ? widget.images[0] : widget.images[1]),
          fit: BoxFit.fill,
        )),
        child: _localCardUrl != ''
            ? Center(
                child: Container(
                  width: 160,
                  height: 90,
                  child: Image(
                    image: FileImage(_cardImg!),
                    fit: BoxFit.fill,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
