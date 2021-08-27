import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/network_image.dart';

/// CommonListItem所需 Widget
class EntityListItem {
  Widget? _avatarWidget;
  Widget? _titleWidget;
  Widget? _subTitleWidget;
  Widget? _contentWidget;
  Widget? _tagsWidget;

  EntityListItem();

  EntityListItem buildDefault(
      {String? url,
      String? title,
      String? subTitle,
      String? content,
      List<String>? tags}) {
    return buildAvatar(url: url)
        .buildTitle(title: title)
        .buildSubTitle(subTitle: subTitle)
        .buildContent(content: content)
        .buildTags(tags: tags);
  }

  EntityListItem buildAvatar({String? url, double? size, Widget? widget}) {
    if (widget != null) {
      _avatarWidget = widget;
    } else {
      _avatarWidget = NetWorkImage(
        image: url ?? "",
        margin: EdgeInsets.only(right: 8.w),
      );
    }
    return this;
  }

  EntityListItem buildTitle({String? title, Widget? widget}) {
    if (title != null && title.isNotEmpty) {
      _titleWidget = Text(
        title,
        style: headline2.copyWith(fontWeight: FontWeight.w500),
        overflow: TextOverflow.ellipsis,
      );
    } else {
      _titleWidget = widget;
    }
    return this;
  }

  EntityListItem buildSubTitle({String? subTitle, Widget? widget}) {
    if (subTitle != null && subTitle.isNotEmpty) {
      _subTitleWidget = Padding(
          padding: EdgeInsets.only(top: 1.w),
          child: Text(subTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: bodyText1.copyWith(color: Pigment.fromString("#666"))));
    } else if (widget != null) {
      _subTitleWidget = widget;
    }
    return this;
  }

  EntityListItem buildContent({String? content, Widget? widget}) {
    if (content != null && content.isNotEmpty) {
      _contentWidget = Padding(
        padding: EdgeInsets.only(top: 1.w),
        child: Text(
          content,
          style: bodyText1.copyWith(color: Pigment.fromString("#999")),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else if (widget != null) {
      _contentWidget = widget;
    }
    return this;
  }

  EntityListItem buildTags({List<String>? tags, Widget? widget}) {
    if (tags != null && tags.isNotEmpty) {
      _tagsWidget = Padding(
          padding: EdgeInsets.only(top: 10.w),
          child: Wrap(
            spacing: 8.w,
            runSpacing: 5.w,
            children: tags.map((value) => _tagItem(value)).toList(),
          ));
    } else {
      _tagsWidget = widget;
    }
    return this;
  }

  EntityListItem buildTagsBy(List<Widget> tagsItem, Color color) {
    _tagsWidget = Padding(
        padding: EdgeInsets.only(top: 10.w),
        child: Wrap(
          spacing: 8.w,
          runSpacing: 5.w,
          children: tagsItem.map((value) => _tagItemBy(value, color)).toList(),
        ));
    return this;
  }

  Widget _tagItem(String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
      decoration: BoxDecoration(
          color: highlightColorWithOpacity,
          borderRadius: BorderRadius.all(Radius.circular(2))),
      child: Text(
        value,
        style: bodyText1.copyWith(color: highlightColor, fontSize: 12.sp),
      ),
    );
  }

  Widget _tagItemBy(Widget itemBy, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(2))),
      child: itemBy,
    );
  }

  Widget get tagsWidget => _tagsWidget ?? SizedBox();

  set tagsWidget(Widget value) {
    _tagsWidget = value;
  }

  Widget get contentWidget => _contentWidget ?? SizedBox();

  set contentWidget(Widget value) {
    _contentWidget = value;
  }

  Widget get subTitleWidget => _subTitleWidget ?? SizedBox();

  set subTitleWidget(Widget value) {
    _subTitleWidget = value;
  }

  Widget get titleWidget => _titleWidget ?? SizedBox();

  set titleWidget(Widget value) {
    _titleWidget = value;
  }

  Widget get avatarWidget => _avatarWidget ?? SizedBox();

  set avatarWidget(Widget value) {
    _avatarWidget = value;
  }
}
