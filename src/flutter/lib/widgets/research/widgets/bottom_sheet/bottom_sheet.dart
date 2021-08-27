import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/research/provider.dart';
import 'package:rime_app/widgets/research/widgets/bottom_sheet/widgets/filter/filter.dart';

class BottomSheet extends StatefulWidget {
  BottomSheet({Key? key}) : super(key: key);

  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ResearchProvider>(builder: (ctx, provider, child) {
      return LimitedBox(
        maxHeight: MediaQuery.of(context).size.height * 0.80,
        child: Wrap(
          direction: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 24,
                bottom: 12,
                right: 12,
              ),
              child: Text(
                "筛选",
                style: TextStyle(
                  color: regularColor,
                  fontFamily: notoSansSC,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.70,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Wrap(
                  children: (provider.filters ?? [])
                      .map((f) => Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                              bottom: 32,
                            ),
                            child: Filter(
                              filter: f,
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: greyEE)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          provider.resetBufferedFilterInputs();
                        },
                        child: Container(
                          constraints: BoxConstraints(
                            minWidth: 88.0.w,
                            maxHeight: 46.0.h,
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "重置",
                            style: headline2.copyWith(
                              color: greyA6,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      color: primaryColor,
                      child: InkWell(
                        onTap: () {
                          provider.applyBufferdFilterInputs();
                          Navigator.pop(context);
                        },
                        child: Container(
                          constraints: BoxConstraints(
                            minWidth: 88.0.w,
                            maxHeight: 46.0.h,
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "确定",
                            style: headline2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
