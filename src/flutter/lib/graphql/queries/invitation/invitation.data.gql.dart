// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'invitation.data.gql.g.dart';

abstract class GInvitationData
    implements Built<GInvitationData, GInvitationDataBuilder> {
  GInvitationData._();

  factory GInvitationData([Function(GInvitationDataBuilder b) updates]) =
      _$GInvitationData;

  static void _initializeBuilder(GInvitationDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GInvitationData_invitation get invitation;
  static Serializer<GInvitationData> get serializer =>
      _$gInvitationDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GInvitationData.serializer, this)
          as Map<String, dynamic>);
  static GInvitationData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GInvitationData.serializer, json);
}

abstract class GInvitationData_invitation
    implements
        Built<GInvitationData_invitation, GInvitationData_invitationBuilder> {
  GInvitationData_invitation._();

  factory GInvitationData_invitation(
          [Function(GInvitationData_invitationBuilder b) updates]) =
      _$GInvitationData_invitation;

  static void _initializeBuilder(GInvitationData_invitationBuilder b) =>
      b..G__typename = 'InvitationCode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get invitationCode;
  static Serializer<GInvitationData_invitation> get serializer =>
      _$gInvitationDataInvitationSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GInvitationData_invitation.serializer, this) as Map<String, dynamic>);
  static GInvitationData_invitation? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GInvitationData_invitation.serializer, json);
}

abstract class GInvitationDetailData
    implements Built<GInvitationDetailData, GInvitationDetailDataBuilder> {
  GInvitationDetailData._();

  factory GInvitationDetailData(
          [Function(GInvitationDetailDataBuilder b) updates]) =
      _$GInvitationDetailData;

  static void _initializeBuilder(GInvitationDetailDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GInvitationDetailData_invitationDetail get invitationDetail;
  static Serializer<GInvitationDetailData> get serializer =>
      _$gInvitationDetailDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GInvitationDetailData.serializer, this)
          as Map<String, dynamic>);
  static GInvitationDetailData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GInvitationDetailData.serializer, json);
}

abstract class GInvitationDetailData_invitationDetail
    implements
        Built<GInvitationDetailData_invitationDetail,
            GInvitationDetailData_invitationDetailBuilder> {
  GInvitationDetailData_invitationDetail._();

  factory GInvitationDetailData_invitationDetail(
          [Function(GInvitationDetailData_invitationDetailBuilder b) updates]) =
      _$GInvitationDetailData_invitationDetail;

  static void _initializeBuilder(
          GInvitationDetailData_invitationDetailBuilder b) =>
      b..G__typename = 'InvitationInformation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get invitee;
  String? get invitationCode;
  String? get teamName;
  String? get logoUrl;
  static Serializer<GInvitationDetailData_invitationDetail> get serializer =>
      _$gInvitationDetailDataInvitationDetailSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GInvitationDetailData_invitationDetail.serializer, this)
      as Map<String, dynamic>);
  static GInvitationDetailData_invitationDetail? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GInvitationDetailData_invitationDetail.serializer, json);
}
