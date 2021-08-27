// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'updateUserInfo.data.gql.g.dart';

abstract class GUpdateUserInfoData
    implements Built<GUpdateUserInfoData, GUpdateUserInfoDataBuilder> {
  GUpdateUserInfoData._();

  factory GUpdateUserInfoData(
      [Function(GUpdateUserInfoDataBuilder b) updates]) = _$GUpdateUserInfoData;

  static void _initializeBuilder(GUpdateUserInfoDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateUserInfoData_updateUserInfo? get updateUserInfo;
  static Serializer<GUpdateUserInfoData> get serializer =>
      _$gUpdateUserInfoDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUpdateUserInfoData.serializer, this)
          as Map<String, dynamic>);
  static GUpdateUserInfoData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdateUserInfoData.serializer, json);
}

abstract class GUpdateUserInfoData_updateUserInfo
    implements
        Built<GUpdateUserInfoData_updateUserInfo,
            GUpdateUserInfoData_updateUserInfoBuilder> {
  GUpdateUserInfoData_updateUserInfo._();

  factory GUpdateUserInfoData_updateUserInfo(
          [Function(GUpdateUserInfoData_updateUserInfoBuilder b) updates]) =
      _$GUpdateUserInfoData_updateUserInfo;

  static void _initializeBuilder(GUpdateUserInfoData_updateUserInfoBuilder b) =>
      b..G__typename = 'UserInformation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get userID;
  _i2.GRole get role;
  String? get userName;
  String? get avatarURL;
  String? get description;
  String? get phone;
  String? get email;
  static Serializer<GUpdateUserInfoData_updateUserInfo> get serializer =>
      _$gUpdateUserInfoDataUpdateUserInfoSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GUpdateUserInfoData_updateUserInfo.serializer, this)
      as Map<String, dynamic>);
  static GUpdateUserInfoData_updateUserInfo? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GUpdateUserInfoData_updateUserInfo.serializer, json);
}
