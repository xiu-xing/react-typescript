// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'invitation_code_verification.var.gql.g.dart';

abstract class GInvitationCodeVerifyVars
    implements
        Built<GInvitationCodeVerifyVars, GInvitationCodeVerifyVarsBuilder> {
  GInvitationCodeVerifyVars._();

  factory GInvitationCodeVerifyVars(
          [Function(GInvitationCodeVerifyVarsBuilder b) updates]) =
      _$GInvitationCodeVerifyVars;

  String get code;
  static Serializer<GInvitationCodeVerifyVars> get serializer =>
      _$gInvitationCodeVerifyVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GInvitationCodeVerifyVars.serializer, this)
          as Map<String, dynamic>);
  static GInvitationCodeVerifyVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GInvitationCodeVerifyVars.serializer, json);
}
