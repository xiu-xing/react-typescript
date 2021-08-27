// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'business_card.data.gql.g.dart';

abstract class GCreateBusinessCardApprovalTicketData
    implements
        Built<GCreateBusinessCardApprovalTicketData,
            GCreateBusinessCardApprovalTicketDataBuilder> {
  GCreateBusinessCardApprovalTicketData._();

  factory GCreateBusinessCardApprovalTicketData(
          [Function(GCreateBusinessCardApprovalTicketDataBuilder b) updates]) =
      _$GCreateBusinessCardApprovalTicketData;

  static void _initializeBuilder(
          GCreateBusinessCardApprovalTicketDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get createBussinessCardApprovalTicket;
  static Serializer<GCreateBusinessCardApprovalTicketData> get serializer =>
      _$gCreateBusinessCardApprovalTicketDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GCreateBusinessCardApprovalTicketData.serializer, this)
      as Map<String, dynamic>);
  static GCreateBusinessCardApprovalTicketData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GCreateBusinessCardApprovalTicketData.serializer, json);
}

abstract class GCreateVerificationCodeData
    implements
        Built<GCreateVerificationCodeData, GCreateVerificationCodeDataBuilder> {
  GCreateVerificationCodeData._();

  factory GCreateVerificationCodeData(
          [Function(GCreateVerificationCodeDataBuilder b) updates]) =
      _$GCreateVerificationCodeData;

  static void _initializeBuilder(GCreateVerificationCodeDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get createVerificationCode;
  static Serializer<GCreateVerificationCodeData> get serializer =>
      _$gCreateVerificationCodeDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GCreateVerificationCodeData.serializer, this) as Map<String, dynamic>);
  static GCreateVerificationCodeData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GCreateVerificationCodeData.serializer, json);
}

abstract class GVerifyCodeAndApproveJoinRequestData
    implements
        Built<GVerifyCodeAndApproveJoinRequestData,
            GVerifyCodeAndApproveJoinRequestDataBuilder> {
  GVerifyCodeAndApproveJoinRequestData._();

  factory GVerifyCodeAndApproveJoinRequestData(
          [Function(GVerifyCodeAndApproveJoinRequestDataBuilder b) updates]) =
      _$GVerifyCodeAndApproveJoinRequestData;

  static void _initializeBuilder(
          GVerifyCodeAndApproveJoinRequestDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get verifyCodeAndApproveJoinRequest;
  static Serializer<GVerifyCodeAndApproveJoinRequestData> get serializer =>
      _$gVerifyCodeAndApproveJoinRequestDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GVerifyCodeAndApproveJoinRequestData.serializer, this)
      as Map<String, dynamic>);
  static GVerifyCodeAndApproveJoinRequestData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GVerifyCodeAndApproveJoinRequestData.serializer, json);
}

abstract class GCreateVerificationCodeByJoinRequestData
    implements
        Built<GCreateVerificationCodeByJoinRequestData,
            GCreateVerificationCodeByJoinRequestDataBuilder> {
  GCreateVerificationCodeByJoinRequestData._();

  factory GCreateVerificationCodeByJoinRequestData(
      [Function(GCreateVerificationCodeByJoinRequestDataBuilder b)
          updates]) = _$GCreateVerificationCodeByJoinRequestData;

  static void _initializeBuilder(
          GCreateVerificationCodeByJoinRequestDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get createVerificationCodeByJoinRequest;
  static Serializer<GCreateVerificationCodeByJoinRequestData> get serializer =>
      _$gCreateVerificationCodeByJoinRequestDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GCreateVerificationCodeByJoinRequestData.serializer, this)
      as Map<String, dynamic>);
  static GCreateVerificationCodeByJoinRequestData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GCreateVerificationCodeByJoinRequestData.serializer, json);
}
