// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i2;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'realm_suggestions.data.gql.g.dart';

abstract class GRealmSuggestionsData
    implements Built<GRealmSuggestionsData, GRealmSuggestionsDataBuilder> {
  GRealmSuggestionsData._();

  factory GRealmSuggestionsData(
          [Function(GRealmSuggestionsDataBuilder b) updates]) =
      _$GRealmSuggestionsData;

  static void _initializeBuilder(GRealmSuggestionsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GRealmSuggestionsData_appRealmSuggestions get appRealmSuggestions;
  static Serializer<GRealmSuggestionsData> get serializer =>
      _$gRealmSuggestionsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GRealmSuggestionsData.serializer, this)
          as Map<String, dynamic>);
  static GRealmSuggestionsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GRealmSuggestionsData.serializer, json);
}

abstract class GRealmSuggestionsData_appRealmSuggestions
    implements
        Built<GRealmSuggestionsData_appRealmSuggestions,
            GRealmSuggestionsData_appRealmSuggestionsBuilder> {
  GRealmSuggestionsData_appRealmSuggestions._();

  factory GRealmSuggestionsData_appRealmSuggestions(
      [Function(GRealmSuggestionsData_appRealmSuggestionsBuilder b)
          updates]) = _$GRealmSuggestionsData_appRealmSuggestions;

  static void _initializeBuilder(
          GRealmSuggestionsData_appRealmSuggestionsBuilder b) =>
      b..G__typename = 'RealmSuggestionConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get totalCount;
  BuiltList<GRealmSuggestionsData_appRealmSuggestions_nodes>? get nodes;
  GRealmSuggestionsData_appRealmSuggestions_pageInfo get pageInfo;
  BuiltList<GRealmSuggestionsData_appRealmSuggestions_permissions>?
      get permissions;
  static Serializer<GRealmSuggestionsData_appRealmSuggestions> get serializer =>
      _$gRealmSuggestionsDataAppRealmSuggestionsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GRealmSuggestionsData_appRealmSuggestions.serializer, this)
      as Map<String, dynamic>);
  static GRealmSuggestionsData_appRealmSuggestions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GRealmSuggestionsData_appRealmSuggestions.serializer, json);
}

abstract class GRealmSuggestionsData_appRealmSuggestions_nodes
    implements
        Built<GRealmSuggestionsData_appRealmSuggestions_nodes,
            GRealmSuggestionsData_appRealmSuggestions_nodesBuilder> {
  GRealmSuggestionsData_appRealmSuggestions_nodes._();

  factory GRealmSuggestionsData_appRealmSuggestions_nodes(
      [Function(GRealmSuggestionsData_appRealmSuggestions_nodesBuilder b)
          updates]) = _$GRealmSuggestionsData_appRealmSuggestions_nodes;

  static void _initializeBuilder(
          GRealmSuggestionsData_appRealmSuggestions_nodesBuilder b) =>
      b..G__typename = 'RealmSuggestion';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get primaryName;
  String? get description;
  String? get logo;
  static Serializer<GRealmSuggestionsData_appRealmSuggestions_nodes>
      get serializer =>
          _$gRealmSuggestionsDataAppRealmSuggestionsNodesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GRealmSuggestionsData_appRealmSuggestions_nodes.serializer, this)
      as Map<String, dynamic>);
  static GRealmSuggestionsData_appRealmSuggestions_nodes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GRealmSuggestionsData_appRealmSuggestions_nodes.serializer, json);
}

abstract class GRealmSuggestionsData_appRealmSuggestions_pageInfo
    implements
        Built<GRealmSuggestionsData_appRealmSuggestions_pageInfo,
            GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder> {
  GRealmSuggestionsData_appRealmSuggestions_pageInfo._();

  factory GRealmSuggestionsData_appRealmSuggestions_pageInfo(
      [Function(GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder b)
          updates]) = _$GRealmSuggestionsData_appRealmSuggestions_pageInfo;

  static void _initializeBuilder(
          GRealmSuggestionsData_appRealmSuggestions_pageInfoBuilder b) =>
      b..G__typename = 'PageInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get hasPreviousPage;
  bool get hasNextPage;
  String? get startCursor;
  String? get endCursor;
  static Serializer<GRealmSuggestionsData_appRealmSuggestions_pageInfo>
      get serializer =>
          _$gRealmSuggestionsDataAppRealmSuggestionsPageInfoSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GRealmSuggestionsData_appRealmSuggestions_pageInfo.serializer, this)
      as Map<String, dynamic>);
  static GRealmSuggestionsData_appRealmSuggestions_pageInfo? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GRealmSuggestionsData_appRealmSuggestions_pageInfo.serializer, json);
}

abstract class GRealmSuggestionsData_appRealmSuggestions_permissions {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GRealmSuggestionsData_appRealmSuggestions_permissions>
      get serializer => _i2.InlineFragmentSerializer<
                  GRealmSuggestionsData_appRealmSuggestions_permissions>(
              'GRealmSuggestionsData_appRealmSuggestions_permissions',
              GRealmSuggestionsData_appRealmSuggestions_permissions__base, [
            GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission,
            GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission,
            GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission
          ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GRealmSuggestionsData_appRealmSuggestions_permissions.serializer,
      this) as Map<String, dynamic>);
  static GRealmSuggestionsData_appRealmSuggestions_permissions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GRealmSuggestionsData_appRealmSuggestions_permissions.serializer,
          json);
}

abstract class GRealmSuggestionsData_appRealmSuggestions_permissions__base
    implements
        Built<GRealmSuggestionsData_appRealmSuggestions_permissions__base,
            GRealmSuggestionsData_appRealmSuggestions_permissions__baseBuilder>,
        GRealmSuggestionsData_appRealmSuggestions_permissions {
  GRealmSuggestionsData_appRealmSuggestions_permissions__base._();

  factory GRealmSuggestionsData_appRealmSuggestions_permissions__base(
      [Function(
              GRealmSuggestionsData_appRealmSuggestions_permissions__baseBuilder
                  b)
          updates]) = _$GRealmSuggestionsData_appRealmSuggestions_permissions__base;

  static void _initializeBuilder(
          GRealmSuggestionsData_appRealmSuggestions_permissions__baseBuilder
              b) =>
      b..G__typename = 'Permission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GRealmSuggestionsData_appRealmSuggestions_permissions__base>
      get serializer =>
          _$gRealmSuggestionsDataAppRealmSuggestionsPermissionsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GRealmSuggestionsData_appRealmSuggestions_permissions__base.serializer,
      this) as Map<String, dynamic>);
  static GRealmSuggestionsData_appRealmSuggestions_permissions__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GRealmSuggestionsData_appRealmSuggestions_permissions__base
              .serializer,
          json);
}

abstract class GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission
    implements
        Built<
            GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission,
            GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionBuilder>,
        GRealmSuggestionsData_appRealmSuggestions_permissions {
  GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission._();

  factory GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission(
          [Function(
                  GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionBuilder
                      b)
              updates]) =
      _$GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission;

  static void _initializeBuilder(
          GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermissionBuilder
              b) =>
      b..G__typename = 'LockPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get locked;
  static Serializer<
          GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission>
      get serializer =>
          _$gRealmSuggestionsDataAppRealmSuggestionsPermissionsAsLockPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GRealmSuggestionsData_appRealmSuggestions_permissions__asLockPermission
              .serializer,
          json);
}

abstract class GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission
    implements
        Built<
            GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission,
            GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionBuilder>,
        GRealmSuggestionsData_appRealmSuggestions_permissions {
  GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission._();

  factory GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission(
          [Function(
                  GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionBuilder
                      b)
              updates]) =
      _$GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission;

  static void _initializeBuilder(
          GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermissionBuilder
              b) =>
      b..G__typename = 'PaginationPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get lockNextPage;
  bool get lockPreviousPage;
  int get rowLimit;
  static Serializer<
          GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission>
      get serializer =>
          _$gRealmSuggestionsDataAppRealmSuggestionsPermissionsAsPaginationPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GRealmSuggestionsData_appRealmSuggestions_permissions__asPaginationPermission
              .serializer,
          json);
}

abstract class GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission
    implements
        Built<
            GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission,
            GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionBuilder>,
        GRealmSuggestionsData_appRealmSuggestions_permissions {
  GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission._();

  factory GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission(
          [Function(
                  GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionBuilder
                      b)
              updates]) =
      _$GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission;

  static void _initializeBuilder(
          GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermissionBuilder
              b) =>
      b..G__typename = 'FrequencyPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get remaining;
  int get used;
  int get total;
  static Serializer<
          GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission>
      get serializer =>
          _$gRealmSuggestionsDataAppRealmSuggestionsPermissionsAsFrequencyPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GRealmSuggestionsData_appRealmSuggestions_permissions__asFrequencyPermission
              .serializer,
          json);
}
