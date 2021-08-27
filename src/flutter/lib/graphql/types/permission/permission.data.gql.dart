// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'permission.data.gql.g.dart';

abstract class GFrequencyPermissionFields {
  String get G__typename;
  int get used;
  int get total;
  int get remaining;
  Map<String, dynamic> toJson();
}

abstract class GFrequencyPermissionFieldsData
    implements
        Built<GFrequencyPermissionFieldsData,
            GFrequencyPermissionFieldsDataBuilder>,
        GFrequencyPermissionFields {
  GFrequencyPermissionFieldsData._();

  factory GFrequencyPermissionFieldsData(
          [Function(GFrequencyPermissionFieldsDataBuilder b) updates]) =
      _$GFrequencyPermissionFieldsData;

  static void _initializeBuilder(GFrequencyPermissionFieldsDataBuilder b) =>
      b..G__typename = 'FrequencyPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get used;
  int get total;
  int get remaining;
  static Serializer<GFrequencyPermissionFieldsData> get serializer =>
      _$gFrequencyPermissionFieldsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GFrequencyPermissionFieldsData.serializer, this) as Map<String, dynamic>);
  static GFrequencyPermissionFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GFrequencyPermissionFieldsData.serializer, json);
}

abstract class GPaginationPermissionFields {
  String get G__typename;
  int get rowLimit;
  bool get lockNextPage;
  bool get lockPreviousPage;
  Map<String, dynamic> toJson();
}

abstract class GPaginationPermissionFieldsData
    implements
        Built<GPaginationPermissionFieldsData,
            GPaginationPermissionFieldsDataBuilder>,
        GPaginationPermissionFields {
  GPaginationPermissionFieldsData._();

  factory GPaginationPermissionFieldsData(
          [Function(GPaginationPermissionFieldsDataBuilder b) updates]) =
      _$GPaginationPermissionFieldsData;

  static void _initializeBuilder(GPaginationPermissionFieldsDataBuilder b) =>
      b..G__typename = 'PaginationPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get rowLimit;
  bool get lockNextPage;
  bool get lockPreviousPage;
  static Serializer<GPaginationPermissionFieldsData> get serializer =>
      _$gPaginationPermissionFieldsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GPaginationPermissionFieldsData.serializer, this)
      as Map<String, dynamic>);
  static GPaginationPermissionFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GPaginationPermissionFieldsData.serializer, json);
}

abstract class GLockPermissionFields {
  String get G__typename;
  bool get locked;
  Map<String, dynamic> toJson();
}

abstract class GLockPermissionFieldsData
    implements
        Built<GLockPermissionFieldsData, GLockPermissionFieldsDataBuilder>,
        GLockPermissionFields {
  GLockPermissionFieldsData._();

  factory GLockPermissionFieldsData(
          [Function(GLockPermissionFieldsDataBuilder b) updates]) =
      _$GLockPermissionFieldsData;

  static void _initializeBuilder(GLockPermissionFieldsDataBuilder b) =>
      b..G__typename = 'LockPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get locked;
  static Serializer<GLockPermissionFieldsData> get serializer =>
      _$gLockPermissionFieldsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GLockPermissionFieldsData.serializer, this)
          as Map<String, dynamic>);
  static GLockPermissionFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GLockPermissionFieldsData.serializer, json);
}
