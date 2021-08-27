import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/widgets/common/dotted_border/dotted_border.dart';

class ImageGallery extends StatefulWidget {
  ImageGallery({Key? key, this.maxImagesCount = 3, this.onChange})
      : super(key: key);

  final int maxImagesCount;
  final ValueChanged<List<File>>? onChange;

  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  List<File> images = List.empty();

  @override
  void initState() {
    super.initState();
    _onChange(images);
  }

  _onChange(List<File> images) {
    if (widget.onChange != null) widget.onChange!(images);
  }

  bool get _isFilled => images.length >= widget.maxImagesCount;

  _addImage() async {
    if (images.length >= widget.maxImagesCount) {
      showToast("图片数量已达上限");
      return;
    }

    final res = await ImagePicker().getImage(source: ImageSource.gallery);

    if (res != null) {
      setState(() {
        images = [...images, File(res.path)];
      });
      _onChange(images);
    }
  }

  _removeImage(File image) {
    setState(() {
      images.remove(image);
    });
    _onChange(images);
  }

  Widget _buildAddImageButton() {
    return InkWell(
      onTap: _addImage,
      child: DottedBorder(
        color: Pigment.fromString("#E6E6E6"),
        dashPattern: [6.w, 6.w],
        borderType: BorderType.RRect,
        radius: Radius.circular(4.0.w),
        child: Container(
          width: 90.w,
          height: 90.w,
          child: Icon(
            MdiIcons.camera,
            size: 45.sp,
            color: Pigment.fromString("#E6E6E6"),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(File image) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => GestureDetector(
              onTap: () => Navigator.pop(context),
              child: PhotoView(
                imageProvider: FileImage(image),
              ),
            ),
          ),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.w),
            child: Image.file(
              image,
              fit: BoxFit.fitHeight,
              width: 90.w,
              height: 90.w,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => _removeImage(image),
              child: Container(
                width: 20.w,
                height: 20.w,
                decoration: BoxDecoration(
                  color: Pigment.fromString("#656565"),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4.0.w),
                    bottomLeft: Radius.circular(4.0.w),
                  ),
                ),
                child: Icon(
                  MdiIcons.close,
                  color: Colors.white,
                  size: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildChildren() {
    List<Widget> children = [
      for (int i = 0; i < images.length; i++) ...<Widget>[
        _buildImage(images[i]),
      ],
      if (!_isFilled) _buildAddImageButton()
    ];

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16.w,
      runSpacing: 16.w,
      children: _buildChildren(),
    );
  }
}
