import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rime_app/widgets/common/access_control/permission.dart';

void showAccessControlDialog(BuildContext context,
    {Function? dialogPopCallBack}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AccessControlDialog();
      }).then((value) {
    if (dialogPopCallBack != null) dialogPopCallBack();
  });
}

class AccessControlDialog extends StatefulWidget {
  const AccessControlDialog({Key? key}) : super(key: key);

  @override
  _AccessControlDialogState createState() => _AccessControlDialogState();
}

class _AccessControlDialogState extends State<AccessControlDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Permission(),
          Container(
            margin: EdgeInsets.only(top: 24.h),
            child: IconButton(
              icon: Icon(
                MdiIcons.closeCircleOutline,
                color: Colors.white,
              ),
              iconSize: 40.sp,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
