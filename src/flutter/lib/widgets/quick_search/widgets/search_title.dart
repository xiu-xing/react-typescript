import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pigment/pigment.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/quick_search/provider.dart';

class SearchTitle extends StatefulWidget {
  final bool autoFocus;

  const SearchTitle({Key? key, this.autoFocus = false}) : super(key: key);

  @override
  _SearchTitleState createState() => _SearchTitleState();
}

class _SearchTitleState extends State<SearchTitle>
    with TickerProviderStateMixin {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  Widget suffixIcon(QuickSearchProvider provider) {
    return Container(
      child: InkWell(
        child: Icon(
          MdiIcons.closeCircle,
          color: Pigment.fromString("#d6d6d6"),
          size: 22.w,
        ),
        onTap: () {
          _textEditingController.clear();
          provider.setInputValue('', false);
        },
      ),
    );
  }

  InputBorder textFieldBorder(double radius) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Selector<QuickSearchProvider, QuickSearchProvider>(
      selector: (c, p) => p,
      shouldRebuild: (r, p) => r.keywordEmpty != p.keywordEmpty,
      builder: (c, p, _) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            AnimatedSize(
              vsync: this,
              duration: const Duration(milliseconds: 300),
              child: _leftBack(p.keywordEmpty),
            ),
            _input(p),
            AnimatedSize(
              vsync: this,
              duration: const Duration(milliseconds: 300),
              child: _right(p.keywordEmpty),
            ),
            SizedBox(width: 16.w)
          ],
        );
      },
    );
  }

  Widget _leftBack(bool keywordEmpty) {
    return keywordEmpty
        ? SizedBox(width: 16.w)
        : Padding(
            padding: EdgeInsets.only(left: 11.w, right: 8.w),
            child: InkWell(
              borderRadius: BorderRadius.circular(14.w),
              onTap: () => router.pop(context),
              child: Icon(Icons.chevron_left, size: 28.w, color: normalColor),
            ),
          );
  }

  Widget _input(QuickSearchProvider provider) {
    return Expanded(
      child: Container(
          height: 32.w,
          child: TextField(
            controller: _textEditingController,
            onChanged: (String text) {
              provider.setInputValue(text);
            },
            autofocus: widget.autoFocus,
            maxLines: 1,
            enableInteractiveSelection: true,
            style: bodyText1.copyWith(fontWeight: FontWeight.w500),
            onSubmitted: (value) {
              provider.setInputValue(value, false);
            },
            decoration: InputDecoration(
              filled: true,
              suffixIcon: provider.keywordEmpty ? null : suffixIcon(provider),
              fillColor: backgroundLightColor,
              hintText: '搜索',
              hintStyle: bodyText1.copyWith(color: disabledColor),
              contentPadding: EdgeInsets.only(left: 16.w),
              alignLabelWithHint: true,
              helperStyle: subtitle2,
              enabledBorder: textFieldBorder(4.w),
              focusedBorder: textFieldBorder(4.w),
            ),
          )),
    );
  }

  Widget _right(bool keywordEmpty) {
    return keywordEmpty
        ? Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Center(
              child: InkWell(
                onTap: () => router.pop(context),
                child: Text('取消', style: headline2.copyWith(color: grey73)),
              ),
            ),
          )
        : SizedBox();
  }
}
