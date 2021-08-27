import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.data.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.req.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.var.gql.dart';
import 'package:rime_app/graphql/queries/business_card/business_card.data.gql.dart';
import 'package:rime_app/graphql/queries/business_card/business_card.req.gql.dart';
import 'package:rime_app/graphql/queries/business_card/business_card.var.gql.dart';
import 'package:rime_app/graphql/queries/team/team.data.gql.dart';
import 'package:rime_app/graphql/queries/team/team.req.gql.dart';
import 'package:rime_app/graphql/queries/team/team.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/widgets/common/ac/utils.dart';

enum TicketStatus {
  UnUpload,
  Pending,
  Failed,
  Success,
}

class UserProvider with ChangeNotifier {
  late BuildContext _context;

  UserProvider({BuildContext? context}) {
    if (context != null) this._context = context;
  }

  GUserInfoData_user? _user;

  GTeamsData_teams? _defaultTeam;
  GBusinessCardDetailData_bussinessCardDetail? _ticketDetail;

  GTeamsData_teams? get defaultTeam => _defaultTeam;
  GBusinessCardDetailData_bussinessCardDetail? get ticketDetail =>
      _ticketDetail;
  GUserInfoData_user? get user => _user;
  Role get userRole {
    if (_user == null) return Role.simple;
    return _user!.getRole();
  }

  TicketStatus get ticketStatus {
    if (_ticketDetail?.joinStatus == GJoinStatus.JoinSubmit)
      return TicketStatus.Pending;

    if (_ticketDetail?.joinStatus == GJoinStatus.JoinEnd &&
        _ticketDetail?.success == true) return TicketStatus.Success;
    if (_ticketDetail?.joinStatus == GJoinStatus.JoinEnd &&
        _ticketDetail?.success == false) return TicketStatus.Failed;

    return TicketStatus.UnUpload;
  }

  void setUser({
    GUserInfoData_user? user,
    String? avatarURL,
    String? description,
    GRole? role,
    String? userID,
    String? userName,
    String? phone,
    String? email,
    bool? hasBoundWechat,
  }) {
    GUserInfoData_userBuilder uBuilder = GUserInfoData_userBuilder();
    if (user != null) {
      uBuilder.avatarURL = user.avatarURL;
      uBuilder.description = user.description;
      uBuilder.role = user.role;
      uBuilder.userID = user.userID;
      uBuilder.userName = user.userName;
      uBuilder.phone = user.phone;
      uBuilder.email = user.email;
      uBuilder.hasBoundWechat = user.hasBoundWechat;
    } else {
      uBuilder.avatarURL = avatarURL ?? this._user?.avatarURL;
      uBuilder.description = description ?? this._user?.description;
      uBuilder.role = role ?? this._user?.role;
      uBuilder.userID = userID ?? this._user?.userID;
      uBuilder.userName = userName ?? this._user?.userName;
      uBuilder.phone = phone ?? this._user?.phone;
      uBuilder.email = email ?? this._user?.email;
      uBuilder.hasBoundWechat = hasBoundWechat ?? this._user?.hasBoundWechat;
    }
    this._user = uBuilder.build();
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setContext(BuildContext value) {
    _context = value;
  }

  void initQuery(BuildContext context) {
    getUser(context: context);
    getTeamInfo(context: context);
    getBusinessCardDetail(context: context);
  }

  void getTeamInfo({BuildContext? context, bool firstInit = false}) {
    final teamsReq = GTeamsReq();

    GQL.executeQuery<GTeamsData, GTeamsVars>(teamsReq,
        context: context ?? _context, onData: (stream, res) {
      stream.cancel();

      if (res.data?.teams != null && res.data!.teams.length > 0) {
        _defaultTeam = res.data!.teams.first;
        // Global.museClient.options.teamId = res.data!.teams.first.id;
      } else {
        _defaultTeam = null;
      }
      notifyListeners();
    }, onError: (stream, error) {
      stream.cancel();
    });
  }

  void getBusinessCardDetail({BuildContext? context}) {
    final req = GBusinessCardDetailReq();

    GQL.executeQuery<GBusinessCardDetailData, GBusinessCardDetailVars>(
      req,
      onData: (stream, res) {
        stream.cancel();
        if (res.data?.bussinessCardDetail != null) {
          _ticketDetail = res.data?.bussinessCardDetail;
          notifyListeners();
        }
      },
    );
  }

  void getUser({BuildContext? context}) {
    final getUser = GUserInfoReq((b) => b);

    GQL.executeQuery<GUserInfoData, GUserInfoVars>(
      getUser,
      onData: (stream, res) {
        stream.cancel();
        if (res.data != null && res.data?.user != null) {
          _user = res.data!.user;
          MuseEventUtil.getInstance().options?.userId = _user!.userID;
          notifyListeners();
          String userId = res.data!.user?.userID ?? "";
          Global.getuiPushUtil.setAlias(userId);
        }
      },
      onError: (stream, err) {
        stream.cancel();
        // showToast("获取用户信息失败");
      },
    );
  }

  void cleanUserModel() {
    _user = null;
  }

  // void getIsEmailRequire({BuildContext? context}) {
  //   GQL.executeQuery<GIsEmailBindingRequiredData, GIsEmailBindingRequiredVars>(
  //     GIsEmailBindingRequiredReq(),
  //     context: context ?? _context,
  //     onData: (stream, data) {
  //       stream.cancel();
  //       if (data.data?.isEmailBindingRequired != null &&
  //           data.data!.isEmailBindingRequired.isBindingRequired)
  //         showDialog(
  //           context: context ?? _context,
  //           builder: (context) {
  //             return VirifyEmailDialog(
  //               domins: data.data!.isEmailBindingRequired.domain!.toList(),
  //             );
  //           },
  //           barrierDismissible: false,
  //         );
  //     },
  //     onError: (stream, err) {
  //       stream.cancel();
  //     },
  //   );
  // }
}
