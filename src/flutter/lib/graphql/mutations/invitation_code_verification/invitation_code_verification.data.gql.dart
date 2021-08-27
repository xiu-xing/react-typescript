// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'invitation_code_verification.data.gql.g.dart';

abstract class GInvitationCodeVerifyData
    implements
        Built<GInvitationCodeVerifyData, GInvitationCodeVerifyDataBuilder> {
  GInvitationCodeVerifyData._();

  factory GInvitationCodeVerifyData(
          [Function(GInvitationCodeVerifyDataBuilder b) updates]) =
      _$GInvitationCodeVerifyData;

  static void _initializeBuilder(GInvitationCodeVerifyDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GInvitationCodeVerifyData_invitationCodeVerification
      get invitationCodeVerification;
  static Serializer<GInvitationCodeVerifyData> get serializer =>
      _$gInvitationCodeVerifyDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GInvitationCodeVerifyData.serializer, this)
          as Map<String, dynamic>);
  static GInvitationCodeVerifyData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GInvitationCodeVerifyData.serializer, json);
}

abstract class GInvitationCodeVerifyData_invitationCodeVerification
    implements
        Built<GInvitationCodeVerifyData_invitationCodeVerification,
            GInvitationCodeVerifyData_invitationCodeVerificationBuilder> {
  GInvitationCodeVerifyData_invitationCodeVerification._();

  factory GInvitationCodeVerifyData_invitationCodeVerification(
      [Function(GInvitationCodeVerifyData_invitationCodeVerificationBuilder b)
          updates]) = _$GInvitationCodeVerifyData_invitationCodeVerification;

  static void _initializeBuilder(
          GInvitationCodeVerifyData_invitationCodeVerificationBuilder b) =>
      b..G__typename = 'AuthPayload';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get accessTokenString;
  String? get userID;
  static Serializer<GInvitationCodeVerifyData_invitationCodeVerification>
      get serializer =>
          _$gInvitationCodeVerifyDataInvitationCodeVerificationSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GInvitationCodeVerifyData_invitationCodeVerification.serializer, this)
      as Map<String, dynamic>);
  static GInvitationCodeVerifyData_invitationCodeVerification? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GInvitationCodeVerifyData_invitationCodeVerification.serializer,
          json);
}
