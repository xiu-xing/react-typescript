// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i2;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;
import 'package:rime_app/graphql/types/permission/permission.data.gql.dart'
    as _i3;

part 'key_value_map.data.gql.g.dart';

abstract class GKeyValueMapData
    implements Built<GKeyValueMapData, GKeyValueMapDataBuilder> {
  GKeyValueMapData._();

  factory GKeyValueMapData([Function(GKeyValueMapDataBuilder b) updates]) =
      _$GKeyValueMapData;

  static void _initializeBuilder(GKeyValueMapDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GKeyValueMapData_keyValueMap? get keyValueMap;
  static Serializer<GKeyValueMapData> get serializer =>
      _$gKeyValueMapDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GKeyValueMapData.serializer, this)
          as Map<String, dynamic>);
  static GKeyValueMapData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GKeyValueMapData.serializer, json);
}

abstract class GKeyValueMapData_keyValueMap
    implements
        Built<GKeyValueMapData_keyValueMap,
            GKeyValueMapData_keyValueMapBuilder> {
  GKeyValueMapData_keyValueMap._();

  factory GKeyValueMapData_keyValueMap(
          [Function(GKeyValueMapData_keyValueMapBuilder b) updates]) =
      _$GKeyValueMapData_keyValueMap;

  static void _initializeBuilder(GKeyValueMapData_keyValueMapBuilder b) =>
      b..G__typename = 'KeyValueMapResponse';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get data;
  BuiltList<GKeyValueMapData_keyValueMap_permissions>? get permissions;
  static Serializer<GKeyValueMapData_keyValueMap> get serializer =>
      _$gKeyValueMapDataKeyValueMapSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GKeyValueMapData_keyValueMap.serializer, this) as Map<String, dynamic>);
  static GKeyValueMapData_keyValueMap? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GKeyValueMapData_keyValueMap.serializer, json);
}

abstract class GKeyValueMapData_keyValueMap_permissions {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GKeyValueMapData_keyValueMap_permissions> get serializer =>
      _i2.InlineFragmentSerializer<GKeyValueMapData_keyValueMap_permissions>(
          'GKeyValueMapData_keyValueMap_permissions',
          GKeyValueMapData_keyValueMap_permissions__base, [
        GKeyValueMapData_keyValueMap_permissions__asLockPermission,
        GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission,
        GKeyValueMapData_keyValueMap_permissions__asPaginationPermission
      ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GKeyValueMapData_keyValueMap_permissions.serializer, this)
      as Map<String, dynamic>);
  static GKeyValueMapData_keyValueMap_permissions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GKeyValueMapData_keyValueMap_permissions.serializer, json);
}

abstract class GKeyValueMapData_keyValueMap_permissions__base
    implements
        Built<GKeyValueMapData_keyValueMap_permissions__base,
            GKeyValueMapData_keyValueMap_permissions__baseBuilder>,
        GKeyValueMapData_keyValueMap_permissions {
  GKeyValueMapData_keyValueMap_permissions__base._();

  factory GKeyValueMapData_keyValueMap_permissions__base(
      [Function(GKeyValueMapData_keyValueMap_permissions__baseBuilder b)
          updates]) = _$GKeyValueMapData_keyValueMap_permissions__base;

  static void _initializeBuilder(
          GKeyValueMapData_keyValueMap_permissions__baseBuilder b) =>
      b..G__typename = 'Permission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GKeyValueMapData_keyValueMap_permissions__base>
      get serializer => _$gKeyValueMapDataKeyValueMapPermissionsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GKeyValueMapData_keyValueMap_permissions__base.serializer, this)
      as Map<String, dynamic>);
  static GKeyValueMapData_keyValueMap_permissions__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GKeyValueMapData_keyValueMap_permissions__base.serializer, json);
}

abstract class GKeyValueMapData_keyValueMap_permissions__asLockPermission
    implements
        Built<GKeyValueMapData_keyValueMap_permissions__asLockPermission,
            GKeyValueMapData_keyValueMap_permissions__asLockPermissionBuilder>,
        GKeyValueMapData_keyValueMap_permissions,
        _i3.GLockPermissionFields {
  GKeyValueMapData_keyValueMap_permissions__asLockPermission._();

  factory GKeyValueMapData_keyValueMap_permissions__asLockPermission(
      [Function(
              GKeyValueMapData_keyValueMap_permissions__asLockPermissionBuilder
                  b)
          updates]) = _$GKeyValueMapData_keyValueMap_permissions__asLockPermission;

  static void _initializeBuilder(
          GKeyValueMapData_keyValueMap_permissions__asLockPermissionBuilder
              b) =>
      b..G__typename = 'LockPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get locked;
  static Serializer<GKeyValueMapData_keyValueMap_permissions__asLockPermission>
      get serializer =>
          _$gKeyValueMapDataKeyValueMapPermissionsAsLockPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GKeyValueMapData_keyValueMap_permissions__asLockPermission.serializer,
      this) as Map<String, dynamic>);
  static GKeyValueMapData_keyValueMap_permissions__asLockPermission? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GKeyValueMapData_keyValueMap_permissions__asLockPermission.serializer,
          json);
}

abstract class GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission
    implements
        Built<GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission,
            GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionBuilder>,
        GKeyValueMapData_keyValueMap_permissions,
        _i3.GFrequencyPermissionFields {
  GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission._();

  factory GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission(
          [Function(
                  GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionBuilder
                      b)
              updates]) =
      _$GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission;

  static void _initializeBuilder(
          GKeyValueMapData_keyValueMap_permissions__asFrequencyPermissionBuilder
              b) =>
      b..G__typename = 'FrequencyPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get used;
  int get total;
  int get remaining;
  static Serializer<
          GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission>
      get serializer =>
          _$gKeyValueMapDataKeyValueMapPermissionsAsFrequencyPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GKeyValueMapData_keyValueMap_permissions__asFrequencyPermission
              .serializer,
          json);
}

abstract class GKeyValueMapData_keyValueMap_permissions__asPaginationPermission
    implements
        Built<GKeyValueMapData_keyValueMap_permissions__asPaginationPermission,
            GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionBuilder>,
        GKeyValueMapData_keyValueMap_permissions,
        _i3.GPaginationPermissionFields {
  GKeyValueMapData_keyValueMap_permissions__asPaginationPermission._();

  factory GKeyValueMapData_keyValueMap_permissions__asPaginationPermission(
          [Function(
                  GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionBuilder
                      b)
              updates]) =
      _$GKeyValueMapData_keyValueMap_permissions__asPaginationPermission;

  static void _initializeBuilder(
          GKeyValueMapData_keyValueMap_permissions__asPaginationPermissionBuilder
              b) =>
      b..G__typename = 'PaginationPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get rowLimit;
  bool get lockNextPage;
  bool get lockPreviousPage;
  static Serializer<
          GKeyValueMapData_keyValueMap_permissions__asPaginationPermission>
      get serializer =>
          _$gKeyValueMapDataKeyValueMapPermissionsAsPaginationPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GKeyValueMapData_keyValueMap_permissions__asPaginationPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GKeyValueMapData_keyValueMap_permissions__asPaginationPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GKeyValueMapData_keyValueMap_permissions__asPaginationPermission
              .serializer,
          json);
}
