import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:rime_app/common/user_provider.dart';
import 'package:rime_app/widgets/common/ac/ac_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/ac/utils.dart';
import 'package:provider/provider.dart';

enum ACDialogType { Simple, TrackLimit, ReadLimit, LoadLimit }

Future<void> showACDialog({
  required BuildContext context,
  ACDialogType type = ACDialogType.Simple,
  VoidCallback? onClose,
  String? message,
}) async {
  Role role = context.read<UserProvider>().userRole;
  if (role == Role.simple) {
    await showGeneralDialog(
      barrierDismissible: false,
      context: context,
      transitionDuration: const Duration(),
      pageBuilder: (context, _, __) {
        Widget dialog;

        switch (type) {
          case ACDialogType.LoadLimit:
            dialog = ACContent.loadLimit();
            break;
          case ACDialogType.ReadLimit:
            dialog = ACContent.readLimit();
            break;
          case ACDialogType.TrackLimit:
            dialog = ACContent.trackLimit();
            break;
          case ACDialogType.Simple:
            dialog = ACContent.simple();
            break;
          default:
            dialog = ACContent.simple();
            break;
        }
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BackdropFilter(
              //Issue https://github.com/flutter/flutter/issues/43902
              filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 52.0.w, vertical: 24.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dialog,
                    SizedBox(
                      height: 20.w,
                    ),
                    IconButton(
                      splashRadius: 24.w,
                      iconSize: 40.sp,
                      color: Colors.white,
                      onPressed: onClose != null
                          ? onClose
                          : () => Navigator.of(context).pop(),
                      icon: Icon(
                        MdiIcons.closeCircleOutline,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  } else {
    if (message != null) showToast(message);
  }
}

extension ACDialog on BuildContext {
  Future<void> showAC({
    ACDialogType type = ACDialogType.Simple,
    VoidCallback? onClose,
    String? message,
  }) async =>
      await showACDialog(
        context: this,
        type: type,
        onClose: onClose,
        message: message,
      );
}
