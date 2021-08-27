// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'business_card.var.gql.g.dart';

abstract class GCreateBusinessCardApprovalTicketVars
    implements
        Built<GCreateBusinessCardApprovalTicketVars,
            GCreateBusinessCardApprovalTicketVarsBuilder> {
  GCreateBusinessCardApprovalTicketVars._();

  factory GCreateBusinessCardApprovalTicketVars(
          [Function(GCreateBusinessCardApprovalTicketVarsBuilder b) updates]) =
      _$GCreateBusinessCardApprovalTicketVars;

  String get businessCardUrl;
  static Serializer<GCreateBusinessCardApprovalTicketVars> get serializer =>
      _$gCreateBusinessCardApprovalTicketVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GCreateBusinessCardApprovalTicketVars.serializer, this)
      as Map<String, dynamic>);
  static GCreateBusinessCardApprovalTicketVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GCreateBusinessCardApprovalTicketVars.serializer, json);
}

abstract class GCreateVerificationCodeVars
    implements
        Built<GCreateVerificationCodeVars, GCreateVerificationCodeVarsBuilder> {
  GCreateVerificationCodeVars._();

  factory GCreateVerificationCodeVars(
          [Function(GCreateVerificationCodeVarsBuilder b) updates]) =
      _$GCreateVerificationCodeVars;

  String get contactInfo;
  _i2.GContactType get contactType;
  static Serializer<GCreateVerificationCodeVars> get serializer =>
      _$gCreateVerificationCodeVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GCreateVerificationCodeVars.serializer, this) as Map<String, dynamic>);
  static GCreateVerificationCodeVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GCreateVerificationCodeVars.serializer, json);
}

abstract class GVerifyCodeAndApproveJoinRequestVars
    implements
        Built<GVerifyCodeAndApproveJoinRequestVars,
            GVerifyCodeAndApproveJoinRequestVarsBuilder> {
  GVerifyCodeAndApproveJoinRequestVars._();

  factory GVerifyCodeAndApproveJoinRequestVars(
          [Function(GVerifyCodeAndApproveJoinRequestVarsBuilder b) updates]) =
      _$GVerifyCodeAndApproveJoinRequestVars;

  _i2.GVerifyCodeInput get input;
  static Serializer<GVerifyCodeAndApproveJoinRequestVars> get serializer =>
      _$gVerifyCodeAndApproveJoinRequestVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GVerifyCodeAndApproveJoinRequestVars.serializer, this)
      as Map<String, dynamic>);
  static GVerifyCodeAndApproveJoinRequestVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GVerifyCodeAndApproveJoinRequestVars.serializer, json);
}

abstract class GCreateVerificationCodeByJoinRequestVars
    implements
        Built<GCreateVerificationCodeByJoinRequestVars,
            GCreateVerificationCodeByJoinRequestVarsBuilder> {
  GCreateVerificationCodeByJoinRequestVars._();

  factory GCreateVerificationCodeByJoinRequestVars(
      [Function(GCreateVerificationCodeByJoinRequestVarsBuilder b)
          updates]) = _$GCreateVerificationCodeByJoinRequestVars;

  _i2.GContactType get contactType;
  static Serializer<GCreateVerificationCodeByJoinRequestVars> get serializer =>
      _$gCreateVerificationCodeByJoinRequestVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GCreateVerificationCodeByJoinRequestVars.serializer, this)
      as Map<String, dynamic>);
  static GCreateVerificationCodeByJoinRequestVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GCreateVerificationCodeByJoinRequestVars.serializer, json);
}
