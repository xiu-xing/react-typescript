import 'package:flutter/material.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/widgets/common/profile_actions/tracker_action.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/webview_page.dart';

class SubProfile extends StatefulWidget {
  final String id;
  final String entityId;
  final String entityType;
  SubProfile(
      {Key? key,
      required this.id,
      required this.entityId,
      required this.entityType})
      : super(key: key);

  @override
  _SubProfileState createState() => _SubProfileState();
}

class _SubProfileState extends State<SubProfile> {
  @override
  void initState() {
    MuseEventUtil.sendEvent(
      eventId: MuseEventUtil.SubProfileEventId,
      value: {
        "entity": {
          "value": {"id": widget.entityId, "type": widget.entityType}
        },
        "sub_profile_id": {"value": widget.id}
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewPage(
      url:
          '$WEB_ENDPOINT/mobile/sub-profile?id=${widget.entityId}&type=${widget.entityType}&subProfileId=${widget.id}',
      actions: [
        TrackAction(
          entityID: widget.entityId,
          entityType: GEntityType.valueOf(widget.entityType),
        ),
        SizedBox(width: 2.w),
        // ShareAction(),
      ],
    );
  }
}
