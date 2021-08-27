// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'business_card.data.gql.g.dart';

abstract class GBusinessCardDetailData
    implements Built<GBusinessCardDetailData, GBusinessCardDetailDataBuilder> {
  GBusinessCardDetailData._();

  factory GBusinessCardDetailData(
          [Function(GBusinessCardDetailDataBuilder b) updates]) =
      _$GBusinessCardDetailData;

  static void _initializeBuilder(GBusinessCardDetailDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GBusinessCardDetailData_bussinessCardDetail get bussinessCardDetail;
  static Serializer<GBusinessCardDetailData> get serializer =>
      _$gBusinessCardDetailDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GBusinessCardDetailData.serializer, this)
          as Map<String, dynamic>);
  static GBusinessCardDetailData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GBusinessCardDetailData.serializer, json);
}

abstract class GBusinessCardDetailData_bussinessCardDetail
    implements
        Built<GBusinessCardDetailData_bussinessCardDetail,
            GBusinessCardDetailData_bussinessCardDetailBuilder> {
  GBusinessCardDetailData_bussinessCardDetail._();

  factory GBusinessCardDetailData_bussinessCardDetail(
      [Function(GBusinessCardDetailData_bussinessCardDetailBuilder b)
          updates]) = _$GBusinessCardDetailData_bussinessCardDetail;

  static void _initializeBuilder(
          GBusinessCardDetailData_bussinessCardDetailBuilder b) =>
      b..G__typename = 'BusinessCardInformation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get userId;
  String get teamId;
  _i2.GJoinStatus get joinStatus;
  bool? get success;
  int? get expireAt;
  String? get msg;
  String? get email;
  String? get phone;
  static Serializer<GBusinessCardDetailData_bussinessCardDetail>
      get serializer => _$gBusinessCardDetailDataBussinessCardDetailSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GBusinessCardDetailData_bussinessCardDetail.serializer, this)
      as Map<String, dynamic>);
  static GBusinessCardDetailData_bussinessCardDetail? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GBusinessCardDetailData_bussinessCardDetail.serializer, json);
}
