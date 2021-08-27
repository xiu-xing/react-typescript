// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'invitation.var.gql.g.dart';

abstract class GInvitationVars
    implements Built<GInvitationVars, GInvitationVarsBuilder> {
  GInvitationVars._();

  factory GInvitationVars([Function(GInvitationVarsBuilder b) updates]) =
      _$GInvitationVars;

  String get teamID;
  int get expiredHour;
  static Serializer<GInvitationVars> get serializer =>
      _$gInvitationVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GInvitationVars.serializer, this)
          as Map<String, dynamic>);
  static GInvitationVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GInvitationVars.serializer, json);
}

abstract class GInvitationDetailVars
    implements Built<GInvitationDetailVars, GInvitationDetailVarsBuilder> {
  GInvitationDetailVars._();

  factory GInvitationDetailVars(
          [Function(GInvitationDetailVarsBuilder b) updates]) =
      _$GInvitationDetailVars;

  String get invitationCode;
  static Serializer<GInvitationDetailVars> get serializer =>
      _$gInvitationDetailVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GInvitationDetailVars.serializer, this)
          as Map<String, dynamic>);
  static GInvitationDetailVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GInvitationDetailVars.serializer, json);
}
