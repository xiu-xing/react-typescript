// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i2;
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i4;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;
import 'package:rime_app/graphql/types/page_info/page_info.data.gql.dart'
    as _i6;
import 'package:rime_app/graphql/types/permission/permission.data.gql.dart'
    as _i3;
import 'package:rime_app/graphql/types/tags/tags_fragment.data.gql.dart' as _i5;

part 'realm.data.gql.g.dart';

abstract class GAppRealmData
    implements Built<GAppRealmData, GAppRealmDataBuilder> {
  GAppRealmData._();

  factory GAppRealmData([Function(GAppRealmDataBuilder b) updates]) =
      _$GAppRealmData;

  static void _initializeBuilder(GAppRealmDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GAppRealmData_appRealms> get appRealms;
  static Serializer<GAppRealmData> get serializer => _$gAppRealmDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAppRealmData.serializer, this)
          as Map<String, dynamic>);
  static GAppRealmData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAppRealmData.serializer, json);
}

abstract class GAppRealmData_appRealms
    implements Built<GAppRealmData_appRealms, GAppRealmData_appRealmsBuilder> {
  GAppRealmData_appRealms._();

  factory GAppRealmData_appRealms(
          [Function(GAppRealmData_appRealmsBuilder b) updates]) =
      _$GAppRealmData_appRealms;

  static void _initializeBuilder(GAppRealmData_appRealmsBuilder b) =>
      b..G__typename = 'AppRealm';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  BuiltList<GAppRealmData_appRealms_orderColumns>? get orderColumns;
  BuiltList<GAppRealmData_appRealms_permissions>? get permissions;
  static Serializer<GAppRealmData_appRealms> get serializer =>
      _$gAppRealmDataAppRealmsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAppRealmData_appRealms.serializer, this)
          as Map<String, dynamic>);
  static GAppRealmData_appRealms? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAppRealmData_appRealms.serializer, json);
}

abstract class GAppRealmData_appRealms_orderColumns
    implements
        Built<GAppRealmData_appRealms_orderColumns,
            GAppRealmData_appRealms_orderColumnsBuilder> {
  GAppRealmData_appRealms_orderColumns._();

  factory GAppRealmData_appRealms_orderColumns(
          [Function(GAppRealmData_appRealms_orderColumnsBuilder b) updates]) =
      _$GAppRealmData_appRealms_orderColumns;

  static void _initializeBuilder(
          GAppRealmData_appRealms_orderColumnsBuilder b) =>
      b..G__typename = 'AppOrderColumn';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  static Serializer<GAppRealmData_appRealms_orderColumns> get serializer =>
      _$gAppRealmDataAppRealmsOrderColumnsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GAppRealmData_appRealms_orderColumns.serializer, this)
      as Map<String, dynamic>);
  static GAppRealmData_appRealms_orderColumns? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppRealmData_appRealms_orderColumns.serializer, json);
}

abstract class GAppRealmData_appRealms_permissions {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GAppRealmData_appRealms_permissions> get serializer =>
      _i2.InlineFragmentSerializer<GAppRealmData_appRealms_permissions>(
          'GAppRealmData_appRealms_permissions',
          GAppRealmData_appRealms_permissions__base, [
        GAppRealmData_appRealms_permissions__asLockPermission,
        GAppRealmData_appRealms_permissions__asFrequencyPermission,
        GAppRealmData_appRealms_permissions__asPaginationPermission
      ]);
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GAppRealmData_appRealms_permissions.serializer, this)
      as Map<String, dynamic>);
  static GAppRealmData_appRealms_permissions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppRealmData_appRealms_permissions.serializer, json);
}

abstract class GAppRealmData_appRealms_permissions__base
    implements
        Built<GAppRealmData_appRealms_permissions__base,
            GAppRealmData_appRealms_permissions__baseBuilder>,
        GAppRealmData_appRealms_permissions {
  GAppRealmData_appRealms_permissions__base._();

  factory GAppRealmData_appRealms_permissions__base(
      [Function(GAppRealmData_appRealms_permissions__baseBuilder b)
          updates]) = _$GAppRealmData_appRealms_permissions__base;

  static void _initializeBuilder(
          GAppRealmData_appRealms_permissions__baseBuilder b) =>
      b..G__typename = 'Permission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GAppRealmData_appRealms_permissions__base> get serializer =>
      _$gAppRealmDataAppRealmsPermissionsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAppRealmData_appRealms_permissions__base.serializer, this)
      as Map<String, dynamic>);
  static GAppRealmData_appRealms_permissions__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppRealmData_appRealms_permissions__base.serializer, json);
}

abstract class GAppRealmData_appRealms_permissions__asLockPermission
    implements
        Built<GAppRealmData_appRealms_permissions__asLockPermission,
            GAppRealmData_appRealms_permissions__asLockPermissionBuilder>,
        GAppRealmData_appRealms_permissions,
        _i3.GLockPermissionFields {
  GAppRealmData_appRealms_permissions__asLockPermission._();

  factory GAppRealmData_appRealms_permissions__asLockPermission(
      [Function(GAppRealmData_appRealms_permissions__asLockPermissionBuilder b)
          updates]) = _$GAppRealmData_appRealms_permissions__asLockPermission;

  static void _initializeBuilder(
          GAppRealmData_appRealms_permissions__asLockPermissionBuilder b) =>
      b..G__typename = 'LockPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get locked;
  static Serializer<GAppRealmData_appRealms_permissions__asLockPermission>
      get serializer =>
          _$gAppRealmDataAppRealmsPermissionsAsLockPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppRealmData_appRealms_permissions__asLockPermission.serializer,
      this) as Map<String, dynamic>);
  static GAppRealmData_appRealms_permissions__asLockPermission? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppRealmData_appRealms_permissions__asLockPermission.serializer,
          json);
}

abstract class GAppRealmData_appRealms_permissions__asFrequencyPermission
    implements
        Built<GAppRealmData_appRealms_permissions__asFrequencyPermission,
            GAppRealmData_appRealms_permissions__asFrequencyPermissionBuilder>,
        GAppRealmData_appRealms_permissions,
        _i3.GFrequencyPermissionFields {
  GAppRealmData_appRealms_permissions__asFrequencyPermission._();

  factory GAppRealmData_appRealms_permissions__asFrequencyPermission(
      [Function(
              GAppRealmData_appRealms_permissions__asFrequencyPermissionBuilder
                  b)
          updates]) = _$GAppRealmData_appRealms_permissions__asFrequencyPermission;

  static void _initializeBuilder(
          GAppRealmData_appRealms_permissions__asFrequencyPermissionBuilder
              b) =>
      b..G__typename = 'FrequencyPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get used;
  int get total;
  int get remaining;
  static Serializer<GAppRealmData_appRealms_permissions__asFrequencyPermission>
      get serializer =>
          _$gAppRealmDataAppRealmsPermissionsAsFrequencyPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppRealmData_appRealms_permissions__asFrequencyPermission.serializer,
      this) as Map<String, dynamic>);
  static GAppRealmData_appRealms_permissions__asFrequencyPermission? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppRealmData_appRealms_permissions__asFrequencyPermission.serializer,
          json);
}

abstract class GAppRealmData_appRealms_permissions__asPaginationPermission
    implements
        Built<GAppRealmData_appRealms_permissions__asPaginationPermission,
            GAppRealmData_appRealms_permissions__asPaginationPermissionBuilder>,
        GAppRealmData_appRealms_permissions,
        _i3.GPaginationPermissionFields {
  GAppRealmData_appRealms_permissions__asPaginationPermission._();

  factory GAppRealmData_appRealms_permissions__asPaginationPermission(
      [Function(
              GAppRealmData_appRealms_permissions__asPaginationPermissionBuilder
                  b)
          updates]) = _$GAppRealmData_appRealms_permissions__asPaginationPermission;

  static void _initializeBuilder(
          GAppRealmData_appRealms_permissions__asPaginationPermissionBuilder
              b) =>
      b..G__typename = 'PaginationPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get rowLimit;
  bool get lockNextPage;
  bool get lockPreviousPage;
  static Serializer<GAppRealmData_appRealms_permissions__asPaginationPermission>
      get serializer =>
          _$gAppRealmDataAppRealmsPermissionsAsPaginationPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppRealmData_appRealms_permissions__asPaginationPermission.serializer,
      this) as Map<String, dynamic>);
  static GAppRealmData_appRealms_permissions__asPaginationPermission? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppRealmData_appRealms_permissions__asPaginationPermission
              .serializer,
          json);
}

abstract class GAppRealmSearchResultData
    implements
        Built<GAppRealmSearchResultData, GAppRealmSearchResultDataBuilder> {
  GAppRealmSearchResultData._();

  factory GAppRealmSearchResultData(
          [Function(GAppRealmSearchResultDataBuilder b) updates]) =
      _$GAppRealmSearchResultData;

  static void _initializeBuilder(GAppRealmSearchResultDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GAppRealmSearchResultData_appRealmSearchResult? get appRealmSearchResult;
  static Serializer<GAppRealmSearchResultData> get serializer =>
      _$gAppRealmSearchResultDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAppRealmSearchResultData.serializer, this)
          as Map<String, dynamic>);
  static GAppRealmSearchResultData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAppRealmSearchResultData.serializer, json);
}

abstract class GAppRealmSearchResultData_appRealmSearchResult
    implements
        Built<GAppRealmSearchResultData_appRealmSearchResult,
            GAppRealmSearchResultData_appRealmSearchResultBuilder> {
  GAppRealmSearchResultData_appRealmSearchResult._();

  factory GAppRealmSearchResultData_appRealmSearchResult(
      [Function(GAppRealmSearchResultData_appRealmSearchResultBuilder b)
          updates]) = _$GAppRealmSearchResultData_appRealmSearchResult;

  static void _initializeBuilder(
          GAppRealmSearchResultData_appRealmSearchResultBuilder b) =>
      b..G__typename = 'AppRealmSearchResult';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get totalCount;
  BuiltList<GAppRealmSearchResultData_appRealmSearchResult_nodes>? get nodes;
  GAppRealmSearchResultData_appRealmSearchResult_pageInfo get pageInfo;
  BuiltList<GAppRealmSearchResultData_appRealmSearchResult_permissions>?
      get permissions;
  static Serializer<GAppRealmSearchResultData_appRealmSearchResult>
      get serializer =>
          _$gAppRealmSearchResultDataAppRealmSearchResultSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAppRealmSearchResultData_appRealmSearchResult.serializer, this)
      as Map<String, dynamic>);
  static GAppRealmSearchResultData_appRealmSearchResult? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppRealmSearchResultData_appRealmSearchResult.serializer, json);
}

abstract class GAppRealmSearchResultData_appRealmSearchResult_nodes
    implements
        Built<GAppRealmSearchResultData_appRealmSearchResult_nodes,
            GAppRealmSearchResultData_appRealmSearchResult_nodesBuilder> {
  GAppRealmSearchResultData_appRealmSearchResult_nodes._();

  factory GAppRealmSearchResultData_appRealmSearchResult_nodes(
      [Function(GAppRealmSearchResultData_appRealmSearchResult_nodesBuilder b)
          updates]) = _$GAppRealmSearchResultData_appRealmSearchResult_nodes;

  static void _initializeBuilder(
          GAppRealmSearchResultData_appRealmSearchResult_nodesBuilder b) =>
      b..G__typename = 'AppRealmSearchResultNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get entityID;
  _i4.GEntityType? get entityType;
  String? get logoURI;
  String? get primaryName;
  String? get label;
  String? get description;
  BuiltList<GAppRealmSearchResultData_appRealmSearchResult_nodes_tags>?
      get tags;
  static Serializer<GAppRealmSearchResultData_appRealmSearchResult_nodes>
      get serializer =>
          _$gAppRealmSearchResultDataAppRealmSearchResultNodesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAppRealmSearchResultData_appRealmSearchResult_nodes.serializer, this)
      as Map<String, dynamic>);
  static GAppRealmSearchResultData_appRealmSearchResult_nodes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppRealmSearchResultData_appRealmSearchResult_nodes.serializer,
          json);
}

abstract class GAppRealmSearchResultData_appRealmSearchResult_nodes_tags {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GAppRealmSearchResultData_appRealmSearchResult_nodes_tags>
      get serializer => _i2.InlineFragmentSerializer<
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags>(
              'GAppRealmSearchResultData_appRealmSearchResult_nodes_tags',
              GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base, [
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag,
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag,
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag
          ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags.serializer,
      this) as Map<String, dynamic>);
  static GAppRealmSearchResultData_appRealmSearchResult_nodes_tags? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags.serializer,
          json);
}

abstract class GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base
    implements
        Built<GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base,
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseBuilder>,
        GAppRealmSearchResultData_appRealmSearchResult_nodes_tags {
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base._();

  factory GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base(
          [Function(
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseBuilder
                      b)
              updates]) =
      _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base;

  static void _initializeBuilder(
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__baseBuilder
              b) =>
      b..G__typename = 'Tag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base>
      get serializer =>
          _$gAppRealmSearchResultDataAppRealmSearchResultNodesTagsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base
          .serializer,
      this) as Map<String, dynamic>);
  static GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__base
              .serializer,
          json);
}

abstract class GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag
    implements
        Built<
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag,
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagBuilder>,
        GAppRealmSearchResultData_appRealmSearchResult_nodes_tags,
        _i5.GTextTagFields {
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag._();

  factory GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag(
          [Function(
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagBuilder
                      b)
              updates]) =
      _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag;

  static void _initializeBuilder(
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTagBuilder
              b) =>
      b..G__typename = 'TextTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get name;
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action?
      get action;
  static Serializer<
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag>
      get serializer =>
          _$gAppRealmSearchResultDataAppRealmSearchResultNodesTagsAsTextTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag
          .serializer,
      this) as Map<String, dynamic>);
  static GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag
              .serializer,
          json);
}

abstract class GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action
    implements
        Built<
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action,
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder>,
        _i5.GTextTagFields_action {
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action._();

  factory GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action(
          [Function(
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder
                      b)
              updates]) =
      _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action;

  static void _initializeBuilder(
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_actionBuilder
              b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  _i4.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  static Serializer<
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action>
      get serializer =>
          _$gAppRealmSearchResultDataAppRealmSearchResultNodesTagsAsTextTagActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action
          .serializer,
      this) as Map<String, dynamic>);
  static GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asTextTag_action
              .serializer,
          json);
}

abstract class GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag
    implements
        Built<
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag,
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagBuilder>,
        GAppRealmSearchResultData_appRealmSearchResult_nodes_tags,
        _i5.GRiskTagFields {
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag._();

  factory GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag(
          [Function(
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagBuilder
                      b)
              updates]) =
      _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag;

  static void _initializeBuilder(
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTagBuilder
              b) =>
      b..G__typename = 'RiskTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get level;
  static Serializer<
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag>
      get serializer =>
          _$gAppRealmSearchResultDataAppRealmSearchResultNodesTagsAsRiskTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag
          .serializer,
      this) as Map<String, dynamic>);
  static GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asRiskTag
              .serializer,
          json);
}

abstract class GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag
    implements
        Built<
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag,
            GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagBuilder>,
        GAppRealmSearchResultData_appRealmSearchResult_nodes_tags,
        _i5.GQuickSearchTagFields {
  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag._();

  factory GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag(
          [Function(
                  GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagBuilder
                      b)
              updates]) =
      _$GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag;

  static void _initializeBuilder(
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTagBuilder
              b) =>
      b..G__typename = 'QuickSearchTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  static Serializer<
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag>
      get serializer =>
          _$gAppRealmSearchResultDataAppRealmSearchResultNodesTagsAsQuickSearchTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag
          .serializer,
      this) as Map<String, dynamic>);
  static GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppRealmSearchResultData_appRealmSearchResult_nodes_tags__asQuickSearchTag
              .serializer,
          json);
}

abstract class GAppRealmSearchResultData_appRealmSearchResult_pageInfo
    implements
        Built<GAppRealmSearchResultData_appRealmSearchResult_pageInfo,
            GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder>,
        _i6.GPageInfoFields {
  GAppRealmSearchResultData_appRealmSearchResult_pageInfo._();

  factory GAppRealmSearchResultData_appRealmSearchResult_pageInfo(
      [Function(
              GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder b)
          updates]) = _$GAppRealmSearchResultData_appRealmSearchResult_pageInfo;

  static void _initializeBuilder(
          GAppRealmSearchResultData_appRealmSearchResult_pageInfoBuilder b) =>
      b..G__typename = 'PageInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get hasPreviousPage;
  bool get hasNextPage;
  String? get startCursor;
  String? get endCursor;
  static Serializer<GAppRealmSearchResultData_appRealmSearchResult_pageInfo>
      get serializer =>
          _$gAppRealmSearchResultDataAppRealmSearchResultPageInfoSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppRealmSearchResultData_appRealmSearchResult_pageInfo.serializer,
      this) as Map<String, dynamic>);
  static GAppRealmSearchResultData_appRealmSearchResult_pageInfo? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppRealmSearchResultData_appRealmSearchResult_pageInfo.serializer,
          json);
}

abstract class GAppRealmSearchResultData_appRealmSearchResult_permissions {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GAppRealmSearchResultData_appRealmSearchResult_permissions>
      get serializer => _i2.InlineFragmentSerializer<
                  GAppRealmSearchResultData_appRealmSearchResult_permissions>(
              'GAppRealmSearchResultData_appRealmSearchResult_permissions',
              GAppRealmSearchResultData_appRealmSearchResult_permissions__base,
              [
                GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission,
                GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission,
                GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission
              ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppRealmSearchResultData_appRealmSearchResult_permissions.serializer,
      this) as Map<String, dynamic>);
  static GAppRealmSearchResultData_appRealmSearchResult_permissions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppRealmSearchResultData_appRealmSearchResult_permissions.serializer,
          json);
}

abstract class GAppRealmSearchResultData_appRealmSearchResult_permissions__base
    implements
        Built<GAppRealmSearchResultData_appRealmSearchResult_permissions__base,
            GAppRealmSearchResultData_appRealmSearchResult_permissions__baseBuilder>,
        GAppRealmSearchResultData_appRealmSearchResult_permissions {
  GAppRealmSearchResultData_appRealmSearchResult_permissions__base._();

  factory GAppRealmSearchResultData_appRealmSearchResult_permissions__base(
          [Function(
                  GAppRealmSearchResultData_appRealmSearchResult_permissions__baseBuilder
                      b)
              updates]) =
      _$GAppRealmSearchResultData_appRealmSearchResult_permissions__base;

  static void _initializeBuilder(
          GAppRealmSearchResultData_appRealmSearchResult_permissions__baseBuilder
              b) =>
      b..G__typename = 'Permission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GAppRealmSearchResultData_appRealmSearchResult_permissions__base>
      get serializer =>
          _$gAppRealmSearchResultDataAppRealmSearchResultPermissionsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppRealmSearchResultData_appRealmSearchResult_permissions__base
          .serializer,
      this) as Map<String, dynamic>);
  static GAppRealmSearchResultData_appRealmSearchResult_permissions__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppRealmSearchResultData_appRealmSearchResult_permissions__base
              .serializer,
          json);
}

abstract class GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission
    implements
        Built<
            GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission,
            GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionBuilder>,
        GAppRealmSearchResultData_appRealmSearchResult_permissions,
        _i3.GLockPermissionFields {
  GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission._();

  factory GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission(
          [Function(
                  GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionBuilder
                      b)
              updates]) =
      _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission;

  static void _initializeBuilder(
          GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermissionBuilder
              b) =>
      b..G__typename = 'LockPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get locked;
  static Serializer<
          GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission>
      get serializer =>
          _$gAppRealmSearchResultDataAppRealmSearchResultPermissionsAsLockPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppRealmSearchResultData_appRealmSearchResult_permissions__asLockPermission
              .serializer,
          json);
}

abstract class GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission
    implements
        Built<
            GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission,
            GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionBuilder>,
        GAppRealmSearchResultData_appRealmSearchResult_permissions,
        _i3.GFrequencyPermissionFields {
  GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission._();

  factory GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission(
          [Function(
                  GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionBuilder
                      b)
              updates]) =
      _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission;

  static void _initializeBuilder(
          GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermissionBuilder
              b) =>
      b..G__typename = 'FrequencyPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get used;
  int get total;
  int get remaining;
  static Serializer<
          GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission>
      get serializer =>
          _$gAppRealmSearchResultDataAppRealmSearchResultPermissionsAsFrequencyPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppRealmSearchResultData_appRealmSearchResult_permissions__asFrequencyPermission
              .serializer,
          json);
}

abstract class GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission
    implements
        Built<
            GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission,
            GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionBuilder>,
        GAppRealmSearchResultData_appRealmSearchResult_permissions,
        _i3.GPaginationPermissionFields {
  GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission._();

  factory GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission(
          [Function(
                  GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionBuilder
                      b)
              updates]) =
      _$GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission;

  static void _initializeBuilder(
          GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermissionBuilder
              b) =>
      b..G__typename = 'PaginationPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get rowLimit;
  bool get lockNextPage;
  bool get lockPreviousPage;
  static Serializer<
          GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission>
      get serializer =>
          _$gAppRealmSearchResultDataAppRealmSearchResultPermissionsAsPaginationPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppRealmSearchResultData_appRealmSearchResult_permissions__asPaginationPermission
              .serializer,
          json);
}
