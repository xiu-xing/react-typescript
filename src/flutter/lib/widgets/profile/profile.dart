import 'package:flutter/material.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/widgets/common/profile_actions/tracker_action.dart';
import 'package:rime_app/widgets/webview_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  final String id;
  final String type;
  Profile({Key? key, required this.id, required this.type}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    MuseEventUtil.sendEntity(
      eventId: MuseEventUtil.ProfileEventId,
      entityId: widget.id,
      entityType: widget.type,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewPage(
      url: '$WEB_ENDPOINT/mobile/profile?id=${widget.id}&type=${widget.type}',
      opactityTitle: true,
      actions: [
        TrackAction(
          entityID: widget.id,
          entityType: GEntityType.valueOf(widget.type),
        ),
        SizedBox(width: 2.w),
        // ShareAction(),
      ],
    );
  }
}
