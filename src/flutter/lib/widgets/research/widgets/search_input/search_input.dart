import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/research/provider.dart';

class SearchInput extends StatefulWidget {
  SearchInput({Key? key}) : super(key: key);

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late TextEditingController _textController;
  bool _focus = false;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _textController = TextEditingController();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus)
        setState(() => _focus = true);
      else
        setState(() => _focus = false);
    });
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ResearchProvider>(builder: (ctx, p, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 7.0,
        ),
        child: TextField(
          focusNode: _focusNode,
          onSubmitted: (value) {
            p.updateQuery(value);
          },
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 14.sp,
            fontFamily: notoSansSC,
            fontWeight: FontWeight.w500,
          ),
          controller: _textController,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: _focus
                ? null
                : Padding(
                    padding: const EdgeInsets.only(left: 16, right: 4),
                    child: Icon(
                      Icons.search,
                      size: 20,
                      color: grey99,
                    ),
                  ),
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontFamily: notoSansSC,
              color: Pigment.fromString("#999"),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 20),
            hintText: "搜索报告",
            filled: true,
            fillColor: Pigment.fromString("#F8F9FB"),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Pigment.fromString("#F8F9FB")),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Pigment.fromString("#F8F9FB")),
            ),
          ),
        ),
      );
    });
  }
}
