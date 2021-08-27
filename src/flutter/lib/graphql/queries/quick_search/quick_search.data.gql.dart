// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i2;
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i5;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;
import 'package:rime_app/graphql/types/entity/entity_fragment.data.gql.dart'
    as _i7;
import 'package:rime_app/graphql/types/page_info/page_info.data.gql.dart'
    as _i8;
import 'package:rime_app/graphql/types/permission/permission.data.gql.dart'
    as _i3;
import 'package:rime_app/graphql/types/quick_search/quick_search_fragment.data.gql.dart'
    as _i4;
import 'package:rime_app/graphql/types/tags/tags_fragment.data.gql.dart' as _i6;

part 'quick_search.data.gql.g.dart';

abstract class GQuickSearchTrendingData
    implements
        Built<GQuickSearchTrendingData, GQuickSearchTrendingDataBuilder> {
  GQuickSearchTrendingData._();

  factory GQuickSearchTrendingData(
          [Function(GQuickSearchTrendingDataBuilder b) updates]) =
      _$GQuickSearchTrendingData;

  static void _initializeBuilder(GQuickSearchTrendingDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GQuickSearchTrendingData_quickSearchTrending get quickSearchTrending;
  static Serializer<GQuickSearchTrendingData> get serializer =>
      _$gQuickSearchTrendingDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GQuickSearchTrendingData.serializer, this)
          as Map<String, dynamic>);
  static GQuickSearchTrendingData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GQuickSearchTrendingData.serializer, json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending
    implements
        Built<GQuickSearchTrendingData_quickSearchTrending,
            GQuickSearchTrendingData_quickSearchTrendingBuilder> {
  GQuickSearchTrendingData_quickSearchTrending._();

  factory GQuickSearchTrendingData_quickSearchTrending(
      [Function(GQuickSearchTrendingData_quickSearchTrendingBuilder b)
          updates]) = _$GQuickSearchTrendingData_quickSearchTrending;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrendingBuilder b) =>
      b..G__typename = 'QuickSearchConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GQuickSearchTrendingData_quickSearchTrending_permissions>?
      get permissions;
  int get totalCount;
  BuiltList<GQuickSearchTrendingData_quickSearchTrending_nodes>? get nodes;
  GQuickSearchTrendingData_quickSearchTrending_pageInfo get pageInfo;
  static Serializer<GQuickSearchTrendingData_quickSearchTrending>
      get serializer => _$gQuickSearchTrendingDataQuickSearchTrendingSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GQuickSearchTrendingData_quickSearchTrending.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending.serializer, json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_permissions {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GQuickSearchTrendingData_quickSearchTrending_permissions>
      get serializer => _i2.InlineFragmentSerializer<
                  GQuickSearchTrendingData_quickSearchTrending_permissions>(
              'GQuickSearchTrendingData_quickSearchTrending_permissions',
              GQuickSearchTrendingData_quickSearchTrending_permissions__base, [
            GQuickSearchTrendingData_quickSearchTrending_permissions__asLockPermission,
            GQuickSearchTrendingData_quickSearchTrending_permissions__asPaginationPermission,
            GQuickSearchTrendingData_quickSearchTrending_permissions__asFrequencyPermission
          ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_permissions.serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_permissions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_permissions.serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_permissions__base
    implements
        Built<GQuickSearchTrendingData_quickSearchTrending_permissions__base,
            GQuickSearchTrendingData_quickSearchTrending_permissions__baseBuilder>,
        GQuickSearchTrendingData_quickSearchTrending_permissions {
  GQuickSearchTrendingData_quickSearchTrending_permissions__base._();

  factory GQuickSearchTrendingData_quickSearchTrending_permissions__base(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_permissions__baseBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_permissions__base;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_permissions__baseBuilder
              b) =>
      b..G__typename = 'Permission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_permissions__base>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingPermissionsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_permissions__base.serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_permissions__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_permissions__base
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_permissions__asLockPermission
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_permissions__asLockPermission,
            GQuickSearchTrendingData_quickSearchTrending_permissions__asLockPermissionBuilder>,
        GQuickSearchTrendingData_quickSearchTrending_permissions,
        _i3.GLockPermissionFields {
  GQuickSearchTrendingData_quickSearchTrending_permissions__asLockPermission._();

  factory GQuickSearchTrendingData_quickSearchTrending_permissions__asLockPermission(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_permissions__asLockPermissionBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_permissions__asLockPermission;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_permissions__asLockPermissionBuilder
              b) =>
      b..G__typename = 'LockPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get locked;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_permissions__asLockPermission>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingPermissionsAsLockPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_permissions__asLockPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_permissions__asLockPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_permissions__asLockPermission
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_permissions__asPaginationPermission
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_permissions__asPaginationPermission,
            GQuickSearchTrendingData_quickSearchTrending_permissions__asPaginationPermissionBuilder>,
        GQuickSearchTrendingData_quickSearchTrending_permissions,
        _i3.GPaginationPermissionFields {
  GQuickSearchTrendingData_quickSearchTrending_permissions__asPaginationPermission._();

  factory GQuickSearchTrendingData_quickSearchTrending_permissions__asPaginationPermission(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_permissions__asPaginationPermissionBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_permissions__asPaginationPermission;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_permissions__asPaginationPermissionBuilder
              b) =>
      b..G__typename = 'PaginationPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get rowLimit;
  bool get lockNextPage;
  bool get lockPreviousPage;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_permissions__asPaginationPermission>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingPermissionsAsPaginationPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_permissions__asPaginationPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_permissions__asPaginationPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_permissions__asPaginationPermission
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_permissions__asFrequencyPermission
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_permissions__asFrequencyPermission,
            GQuickSearchTrendingData_quickSearchTrending_permissions__asFrequencyPermissionBuilder>,
        GQuickSearchTrendingData_quickSearchTrending_permissions,
        _i3.GFrequencyPermissionFields {
  GQuickSearchTrendingData_quickSearchTrending_permissions__asFrequencyPermission._();

  factory GQuickSearchTrendingData_quickSearchTrending_permissions__asFrequencyPermission(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_permissions__asFrequencyPermissionBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_permissions__asFrequencyPermission;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_permissions__asFrequencyPermissionBuilder
              b) =>
      b..G__typename = 'FrequencyPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get used;
  int get total;
  int get remaining;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_permissions__asFrequencyPermission>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingPermissionsAsFrequencyPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_permissions__asFrequencyPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_permissions__asFrequencyPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_permissions__asFrequencyPermission
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GQuickSearchTrendingData_quickSearchTrending_nodes>
      get serializer => _i2.InlineFragmentSerializer<
                  GQuickSearchTrendingData_quickSearchTrending_nodes>(
              'GQuickSearchTrendingData_quickSearchTrending_nodes',
              GQuickSearchTrendingData_quickSearchTrending_nodes__base, [
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode
          ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes.serializer, json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__base
    implements
        Built<GQuickSearchTrendingData_quickSearchTrending_nodes__base,
            GQuickSearchTrendingData_quickSearchTrending_nodes__baseBuilder>,
        GQuickSearchTrendingData_quickSearchTrending_nodes {
  GQuickSearchTrendingData_quickSearchTrending_nodes__base._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__base(
      [Function(
              GQuickSearchTrendingData_quickSearchTrending_nodes__baseBuilder b)
          updates]) = _$GQuickSearchTrendingData_quickSearchTrending_nodes__base;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__baseBuilder b) =>
      b..G__typename = 'QuickSearchNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GQuickSearchTrendingData_quickSearchTrending_nodes__base>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__base.serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__base.serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNodeBuilder>,
        GQuickSearchTrendingData_quickSearchTrending_nodes,
        _i4.GQuickSearchEntityNodeFields {
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNodeBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNodeBuilder
              b) =>
      b..G__typename = 'QuickSearchEntityNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_action?
      get action;
  String? get description;
  BuiltList<String>? get highlightTexts;
  String? get logoURI;
  String get nodeId;
  String get searchType;
  String? get subtitle;
  String? get title;
  BuiltList<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags>?
      get tags;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesAsQuickSearchEntityNodeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_action
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_action,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_actionBuilder>,
        _i4.GQuickSearchEntityNodeFields_action {
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_action._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_action(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_actionBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_action;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_actionBuilder
              b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get data;
  Map<String, dynamic>? get args;
  String get name;
  _i5.GActionType get type;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_action>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesAsQuickSearchEntityNodeActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_action
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_action?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_action
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags
    implements _i4.GQuickSearchEntityNodeFields_tags {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags>
      get serializer => _i2.InlineFragmentSerializer<
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags>(
              'GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags',
              GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__base,
              [
                GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag,
                GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag,
                GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asRiskTag
              ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__base
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__base,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__baseBuilder>,
        GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags {
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__base._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__base(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__baseBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__base;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__baseBuilder
              b) =>
      b..G__typename = 'Tag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__base>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesAsQuickSearchEntityNodeTagsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__base
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__base
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asQuickSearchTagBuilder>,
        GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags,
        _i6.GQuickSearchTagFields {
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asQuickSearchTagBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asQuickSearchTagBuilder
              b) =>
      b..G__typename = 'QuickSearchTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesAsQuickSearchEntityNodeTagsAsQuickSearchTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTagBuilder>,
        GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags,
        _i6.GTextTagFields {
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTagBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTagBuilder
              b) =>
      b..G__typename = 'TextTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get name;
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag_action?
      get action;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesAsQuickSearchEntityNodeTagsAsTextTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag_action
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag_action,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag_actionBuilder>,
        _i6.GTextTagFields_action {
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag_action._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag_action(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag_actionBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag_action;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag_actionBuilder
              b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  _i5.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag_action>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesAsQuickSearchEntityNodeTagsAsTextTagActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag_action
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag_action?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asTextTag_action
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asRiskTag
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asRiskTag,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asRiskTagBuilder>,
        GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags,
        _i6.GRiskTagFields {
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asRiskTag._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asRiskTag(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asRiskTagBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asRiskTag;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asRiskTagBuilder
              b) =>
      b..G__typename = 'RiskTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get level;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asRiskTag>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesAsQuickSearchEntityNodeTagsAsRiskTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asRiskTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asRiskTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode_tags__asRiskTag
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNodeBuilder>,
        GQuickSearchTrendingData_quickSearchTrending_nodes,
        _i4.GQuickSearchInfoFlowNodeFields {
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNodeBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNodeBuilder
              b) =>
      b..G__typename = 'QuickSearchInfoFlowNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_action?
      get action;
  String? get imageURI;
  int? get publishTime;
  String? get description;
  BuiltList<String>? get highlightTexts;
  String get nodeId;
  String get searchType;
  String? get subtitle;
  String? get title;
  BuiltList<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags>?
      get tags;
  BuiltList<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_relatedEntity>?
      get relatedEntity;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesAsQuickSearchInfoFlowNodeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_action
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_action,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_actionBuilder>,
        _i4.GQuickSearchInfoFlowNodeFields_action {
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_action._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_action(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_actionBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_action;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_actionBuilder
              b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  Map<String, dynamic>? get args;
  String get name;
  _i5.GActionType get type;
  String? get data;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_action>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesAsQuickSearchInfoFlowNodeActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_action
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_action?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_action
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags
    implements _i4.GQuickSearchInfoFlowNodeFields_tags {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags>
      get serializer => _i2.InlineFragmentSerializer<
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags>(
              'GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags',
              GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__base,
              [
                GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag,
                GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag,
                GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag
              ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__base
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__base,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__baseBuilder>,
        GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags {
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__base._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__base(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__baseBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__base;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__baseBuilder
              b) =>
      b..G__typename = 'Tag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__base>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesAsQuickSearchInfoFlowNodeTagsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__base
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__base
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTagBuilder>,
        GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags,
        _i6.GQuickSearchTagFields {
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTagBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTagBuilder
              b) =>
      b..G__typename = 'QuickSearchTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesAsQuickSearchInfoFlowNodeTagsAsQuickSearchTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTagBuilder>,
        GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags,
        _i6.GTextTagFields {
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTagBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTagBuilder
              b) =>
      b..G__typename = 'TextTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get name;
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action?
      get action;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesAsQuickSearchInfoFlowNodeTagsAsTextTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_actionBuilder>,
        _i6.GTextTagFields_action {
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_actionBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_actionBuilder
              b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  _i5.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesAsQuickSearchInfoFlowNodeTagsAsTextTagActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asRiskTagBuilder>,
        GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags,
        _i6.GRiskTagFields {
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asRiskTagBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asRiskTagBuilder
              b) =>
      b..G__typename = 'RiskTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get level;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesAsQuickSearchInfoFlowNodeTagsAsRiskTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_relatedEntity
    implements
        Built<
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_relatedEntity,
            GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_relatedEntityBuilder>,
        _i4.GQuickSearchInfoFlowNodeFields_relatedEntity,
        _i7.GEntityFields {
  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_relatedEntity._();

  factory GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_relatedEntity(
          [Function(
                  GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_relatedEntityBuilder
                      b)
              updates]) =
      _$GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_relatedEntity;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_relatedEntityBuilder
              b) =>
      b..G__typename = 'Entity';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get entityId;
  _i5.GEntityType get entityType;
  String get entityName;
  String? get portraitURL;
  static Serializer<
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_relatedEntity>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingNodesAsQuickSearchInfoFlowNodeRelatedEntitySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_relatedEntity
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_relatedEntity?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchInfoFlowNode_relatedEntity
              .serializer,
          json);
}

abstract class GQuickSearchTrendingData_quickSearchTrending_pageInfo
    implements
        Built<GQuickSearchTrendingData_quickSearchTrending_pageInfo,
            GQuickSearchTrendingData_quickSearchTrending_pageInfoBuilder>,
        _i8.GPageInfoFields {
  GQuickSearchTrendingData_quickSearchTrending_pageInfo._();

  factory GQuickSearchTrendingData_quickSearchTrending_pageInfo(
      [Function(GQuickSearchTrendingData_quickSearchTrending_pageInfoBuilder b)
          updates]) = _$GQuickSearchTrendingData_quickSearchTrending_pageInfo;

  static void _initializeBuilder(
          GQuickSearchTrendingData_quickSearchTrending_pageInfoBuilder b) =>
      b..G__typename = 'PageInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get hasPreviousPage;
  bool get hasNextPage;
  String? get startCursor;
  String? get endCursor;
  static Serializer<GQuickSearchTrendingData_quickSearchTrending_pageInfo>
      get serializer =>
          _$gQuickSearchTrendingDataQuickSearchTrendingPageInfoSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchTrendingData_quickSearchTrending_pageInfo.serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchTrendingData_quickSearchTrending_pageInfo? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchTrendingData_quickSearchTrending_pageInfo.serializer,
          json);
}

abstract class GQuickSearchLatestViewData
    implements
        Built<GQuickSearchLatestViewData, GQuickSearchLatestViewDataBuilder> {
  GQuickSearchLatestViewData._();

  factory GQuickSearchLatestViewData(
          [Function(GQuickSearchLatestViewDataBuilder b) updates]) =
      _$GQuickSearchLatestViewData;

  static void _initializeBuilder(GQuickSearchLatestViewDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GQuickSearchLatestViewData_quickSearchLatestView get quickSearchLatestView;
  static Serializer<GQuickSearchLatestViewData> get serializer =>
      _$gQuickSearchLatestViewDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData.serializer, this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GQuickSearchLatestViewData.serializer, json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView
    implements
        Built<GQuickSearchLatestViewData_quickSearchLatestView,
            GQuickSearchLatestViewData_quickSearchLatestViewBuilder> {
  GQuickSearchLatestViewData_quickSearchLatestView._();

  factory GQuickSearchLatestViewData_quickSearchLatestView(
      [Function(GQuickSearchLatestViewData_quickSearchLatestViewBuilder b)
          updates]) = _$GQuickSearchLatestViewData_quickSearchLatestView;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestViewBuilder b) =>
      b..G__typename = 'QuickSearchConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GQuickSearchLatestViewData_quickSearchLatestView_permissions>?
      get permissions;
  int get totalCount;
  BuiltList<GQuickSearchLatestViewData_quickSearchLatestView_nodes>? get nodes;
  GQuickSearchLatestViewData_quickSearchLatestView_pageInfo get pageInfo;
  static Serializer<GQuickSearchLatestViewData_quickSearchLatestView>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView.serializer, json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_permissions {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_permissions>
      get serializer => _i2.InlineFragmentSerializer<
                  GQuickSearchLatestViewData_quickSearchLatestView_permissions>(
              'GQuickSearchLatestViewData_quickSearchLatestView_permissions',
              GQuickSearchLatestViewData_quickSearchLatestView_permissions__base,
              [
                GQuickSearchLatestViewData_quickSearchLatestView_permissions__asLockPermission,
                GQuickSearchLatestViewData_quickSearchLatestView_permissions__asPaginationPermission,
                GQuickSearchLatestViewData_quickSearchLatestView_permissions__asFrequencyPermission
              ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_permissions.serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_permissions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_permissions
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_permissions__base
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_permissions__base,
            GQuickSearchLatestViewData_quickSearchLatestView_permissions__baseBuilder>,
        GQuickSearchLatestViewData_quickSearchLatestView_permissions {
  GQuickSearchLatestViewData_quickSearchLatestView_permissions__base._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_permissions__base(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_permissions__baseBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_permissions__base;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_permissions__baseBuilder
              b) =>
      b..G__typename = 'Permission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_permissions__base>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewPermissionsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_permissions__base
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_permissions__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_permissions__base
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_permissions__asLockPermission
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_permissions__asLockPermission,
            GQuickSearchLatestViewData_quickSearchLatestView_permissions__asLockPermissionBuilder>,
        GQuickSearchLatestViewData_quickSearchLatestView_permissions,
        _i3.GLockPermissionFields {
  GQuickSearchLatestViewData_quickSearchLatestView_permissions__asLockPermission._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_permissions__asLockPermission(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_permissions__asLockPermissionBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_permissions__asLockPermission;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_permissions__asLockPermissionBuilder
              b) =>
      b..G__typename = 'LockPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get locked;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_permissions__asLockPermission>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewPermissionsAsLockPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_permissions__asLockPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_permissions__asLockPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_permissions__asLockPermission
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_permissions__asPaginationPermission
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_permissions__asPaginationPermission,
            GQuickSearchLatestViewData_quickSearchLatestView_permissions__asPaginationPermissionBuilder>,
        GQuickSearchLatestViewData_quickSearchLatestView_permissions,
        _i3.GPaginationPermissionFields {
  GQuickSearchLatestViewData_quickSearchLatestView_permissions__asPaginationPermission._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_permissions__asPaginationPermission(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_permissions__asPaginationPermissionBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_permissions__asPaginationPermission;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_permissions__asPaginationPermissionBuilder
              b) =>
      b..G__typename = 'PaginationPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get rowLimit;
  bool get lockNextPage;
  bool get lockPreviousPage;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_permissions__asPaginationPermission>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewPermissionsAsPaginationPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_permissions__asPaginationPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_permissions__asPaginationPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_permissions__asPaginationPermission
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_permissions__asFrequencyPermission
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_permissions__asFrequencyPermission,
            GQuickSearchLatestViewData_quickSearchLatestView_permissions__asFrequencyPermissionBuilder>,
        GQuickSearchLatestViewData_quickSearchLatestView_permissions,
        _i3.GFrequencyPermissionFields {
  GQuickSearchLatestViewData_quickSearchLatestView_permissions__asFrequencyPermission._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_permissions__asFrequencyPermission(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_permissions__asFrequencyPermissionBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_permissions__asFrequencyPermission;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_permissions__asFrequencyPermissionBuilder
              b) =>
      b..G__typename = 'FrequencyPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get used;
  int get total;
  int get remaining;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_permissions__asFrequencyPermission>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewPermissionsAsFrequencyPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_permissions__asFrequencyPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_permissions__asFrequencyPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_permissions__asFrequencyPermission
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GQuickSearchLatestViewData_quickSearchLatestView_nodes>
      get serializer => _i2.InlineFragmentSerializer<
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes>(
              'GQuickSearchLatestViewData_quickSearchLatestView_nodes',
              GQuickSearchLatestViewData_quickSearchLatestView_nodes__base, [
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode
          ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes.serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes.serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__base
    implements
        Built<GQuickSearchLatestViewData_quickSearchLatestView_nodes__base,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__baseBuilder>,
        GQuickSearchLatestViewData_quickSearchLatestView_nodes {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__base._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__base(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__baseBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__base;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__baseBuilder
              b) =>
      b..G__typename = 'QuickSearchNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__base>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__base.serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__base
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNodeBuilder>,
        GQuickSearchLatestViewData_quickSearchLatestView_nodes,
        _i4.GQuickSearchEntityNodeFields {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNodeBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNodeBuilder
              b) =>
      b..G__typename = 'QuickSearchEntityNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_action?
      get action;
  String? get description;
  BuiltList<String>? get highlightTexts;
  String? get logoURI;
  String get nodeId;
  String get searchType;
  String? get subtitle;
  String? get title;
  BuiltList<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags>?
      get tags;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesAsQuickSearchEntityNodeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_action
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_action,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_actionBuilder>,
        _i4.GQuickSearchEntityNodeFields_action {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_action._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_action(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_actionBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_action;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_actionBuilder
              b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get data;
  Map<String, dynamic>? get args;
  String get name;
  _i5.GActionType get type;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_action>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesAsQuickSearchEntityNodeActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_action
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_action?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_action
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags
    implements _i4.GQuickSearchEntityNodeFields_tags {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags>
      get serializer => _i2.InlineFragmentSerializer<
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags>(
              'GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags',
              GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__base,
              [
                GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag,
                GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag,
                GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asRiskTag
              ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__base
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__base,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__baseBuilder>,
        GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__base._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__base(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__baseBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__base;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__baseBuilder
              b) =>
      b..G__typename = 'Tag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__base>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesAsQuickSearchEntityNodeTagsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__base
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__base
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asQuickSearchTagBuilder>,
        GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags,
        _i6.GQuickSearchTagFields {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asQuickSearchTagBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asQuickSearchTagBuilder
              b) =>
      b..G__typename = 'QuickSearchTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesAsQuickSearchEntityNodeTagsAsQuickSearchTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTagBuilder>,
        GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags,
        _i6.GTextTagFields {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTagBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTagBuilder
              b) =>
      b..G__typename = 'TextTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get name;
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag_action?
      get action;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesAsQuickSearchEntityNodeTagsAsTextTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag_action
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag_action,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag_actionBuilder>,
        _i6.GTextTagFields_action {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag_action._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag_action(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag_actionBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag_action;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag_actionBuilder
              b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  _i5.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag_action>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesAsQuickSearchEntityNodeTagsAsTextTagActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag_action
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag_action?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asTextTag_action
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asRiskTag
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asRiskTag,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asRiskTagBuilder>,
        GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags,
        _i6.GRiskTagFields {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asRiskTag._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asRiskTag(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asRiskTagBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asRiskTag;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asRiskTagBuilder
              b) =>
      b..G__typename = 'RiskTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get level;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asRiskTag>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesAsQuickSearchEntityNodeTagsAsRiskTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asRiskTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asRiskTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode_tags__asRiskTag
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNodeBuilder>,
        GQuickSearchLatestViewData_quickSearchLatestView_nodes,
        _i4.GQuickSearchInfoFlowNodeFields {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNodeBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNodeBuilder
              b) =>
      b..G__typename = 'QuickSearchInfoFlowNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_action?
      get action;
  String? get imageURI;
  int? get publishTime;
  String? get description;
  BuiltList<String>? get highlightTexts;
  String get nodeId;
  String get searchType;
  String? get subtitle;
  String? get title;
  BuiltList<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags>?
      get tags;
  BuiltList<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_relatedEntity>?
      get relatedEntity;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesAsQuickSearchInfoFlowNodeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_action
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_action,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_actionBuilder>,
        _i4.GQuickSearchInfoFlowNodeFields_action {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_action._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_action(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_actionBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_action;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_actionBuilder
              b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  Map<String, dynamic>? get args;
  String get name;
  _i5.GActionType get type;
  String? get data;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_action>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesAsQuickSearchInfoFlowNodeActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_action
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_action?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_action
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags
    implements _i4.GQuickSearchInfoFlowNodeFields_tags {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags>
      get serializer => _i2.InlineFragmentSerializer<
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags>(
              'GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags',
              GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__base,
              [
                GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag,
                GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag,
                GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag
              ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__base
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__base,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__baseBuilder>,
        GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__base._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__base(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__baseBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__base;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__baseBuilder
              b) =>
      b..G__typename = 'Tag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__base>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesAsQuickSearchInfoFlowNodeTagsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__base
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__base
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTagBuilder>,
        GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags,
        _i6.GQuickSearchTagFields {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTagBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTagBuilder
              b) =>
      b..G__typename = 'QuickSearchTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesAsQuickSearchInfoFlowNodeTagsAsQuickSearchTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTagBuilder>,
        GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags,
        _i6.GTextTagFields {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTagBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTagBuilder
              b) =>
      b..G__typename = 'TextTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get name;
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action?
      get action;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesAsQuickSearchInfoFlowNodeTagsAsTextTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_actionBuilder>,
        _i6.GTextTagFields_action {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_actionBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_actionBuilder
              b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  _i5.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesAsQuickSearchInfoFlowNodeTagsAsTextTagActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asRiskTagBuilder>,
        GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags,
        _i6.GRiskTagFields {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asRiskTagBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asRiskTagBuilder
              b) =>
      b..G__typename = 'RiskTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get level;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesAsQuickSearchInfoFlowNodeTagsAsRiskTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_relatedEntity
    implements
        Built<
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_relatedEntity,
            GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_relatedEntityBuilder>,
        _i4.GQuickSearchInfoFlowNodeFields_relatedEntity,
        _i7.GEntityFields {
  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_relatedEntity._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_relatedEntity(
          [Function(
                  GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_relatedEntityBuilder
                      b)
              updates]) =
      _$GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_relatedEntity;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_relatedEntityBuilder
              b) =>
      b..G__typename = 'Entity';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get entityId;
  _i5.GEntityType get entityType;
  String get entityName;
  String? get portraitURL;
  static Serializer<
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_relatedEntity>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewNodesAsQuickSearchInfoFlowNodeRelatedEntitySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_relatedEntity
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_relatedEntity?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchInfoFlowNode_relatedEntity
              .serializer,
          json);
}

abstract class GQuickSearchLatestViewData_quickSearchLatestView_pageInfo
    implements
        Built<GQuickSearchLatestViewData_quickSearchLatestView_pageInfo,
            GQuickSearchLatestViewData_quickSearchLatestView_pageInfoBuilder>,
        _i8.GPageInfoFields {
  GQuickSearchLatestViewData_quickSearchLatestView_pageInfo._();

  factory GQuickSearchLatestViewData_quickSearchLatestView_pageInfo(
      [Function(
              GQuickSearchLatestViewData_quickSearchLatestView_pageInfoBuilder
                  b)
          updates]) = _$GQuickSearchLatestViewData_quickSearchLatestView_pageInfo;

  static void _initializeBuilder(
          GQuickSearchLatestViewData_quickSearchLatestView_pageInfoBuilder b) =>
      b..G__typename = 'PageInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get hasPreviousPage;
  bool get hasNextPage;
  String? get startCursor;
  String? get endCursor;
  static Serializer<GQuickSearchLatestViewData_quickSearchLatestView_pageInfo>
      get serializer =>
          _$gQuickSearchLatestViewDataQuickSearchLatestViewPageInfoSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewData_quickSearchLatestView_pageInfo.serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchLatestViewData_quickSearchLatestView_pageInfo? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchLatestViewData_quickSearchLatestView_pageInfo.serializer,
          json);
}

abstract class GQuickSearchTabsData
    implements Built<GQuickSearchTabsData, GQuickSearchTabsDataBuilder> {
  GQuickSearchTabsData._();

  factory GQuickSearchTabsData(
          [Function(GQuickSearchTabsDataBuilder b) updates]) =
      _$GQuickSearchTabsData;

  static void _initializeBuilder(GQuickSearchTabsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GQuickSearchTabsData_quickSearchTabs> get quickSearchTabs;
  static Serializer<GQuickSearchTabsData> get serializer =>
      _$gQuickSearchTabsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GQuickSearchTabsData.serializer, this)
          as Map<String, dynamic>);
  static GQuickSearchTabsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GQuickSearchTabsData.serializer, json);
}

abstract class GQuickSearchTabsData_quickSearchTabs
    implements
        Built<GQuickSearchTabsData_quickSearchTabs,
            GQuickSearchTabsData_quickSearchTabsBuilder> {
  GQuickSearchTabsData_quickSearchTabs._();

  factory GQuickSearchTabsData_quickSearchTabs(
          [Function(GQuickSearchTabsData_quickSearchTabsBuilder b) updates]) =
      _$GQuickSearchTabsData_quickSearchTabs;

  static void _initializeBuilder(
          GQuickSearchTabsData_quickSearchTabsBuilder b) =>
      b..G__typename = 'QuickSearchTab';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get title;
  String get searchType;
  GQuickSearchTabsData_quickSearchTabs_lockPermission get lockPermission;
  static Serializer<GQuickSearchTabsData_quickSearchTabs> get serializer =>
      _$gQuickSearchTabsDataQuickSearchTabsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GQuickSearchTabsData_quickSearchTabs.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchTabsData_quickSearchTabs? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchTabsData_quickSearchTabs.serializer, json);
}

abstract class GQuickSearchTabsData_quickSearchTabs_lockPermission
    implements
        Built<GQuickSearchTabsData_quickSearchTabs_lockPermission,
            GQuickSearchTabsData_quickSearchTabs_lockPermissionBuilder> {
  GQuickSearchTabsData_quickSearchTabs_lockPermission._();

  factory GQuickSearchTabsData_quickSearchTabs_lockPermission(
      [Function(GQuickSearchTabsData_quickSearchTabs_lockPermissionBuilder b)
          updates]) = _$GQuickSearchTabsData_quickSearchTabs_lockPermission;

  static void _initializeBuilder(
          GQuickSearchTabsData_quickSearchTabs_lockPermissionBuilder b) =>
      b..G__typename = 'LockPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get locked;
  static Serializer<GQuickSearchTabsData_quickSearchTabs_lockPermission>
      get serializer =>
          _$gQuickSearchTabsDataQuickSearchTabsLockPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GQuickSearchTabsData_quickSearchTabs_lockPermission.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchTabsData_quickSearchTabs_lockPermission? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchTabsData_quickSearchTabs_lockPermission.serializer, json);
}

abstract class GQuickSearchData
    implements Built<GQuickSearchData, GQuickSearchDataBuilder> {
  GQuickSearchData._();

  factory GQuickSearchData([Function(GQuickSearchDataBuilder b) updates]) =
      _$GQuickSearchData;

  static void _initializeBuilder(GQuickSearchDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GQuickSearchData_quickSearch get quickSearch;
  static Serializer<GQuickSearchData> get serializer =>
      _$gQuickSearchDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GQuickSearchData.serializer, this)
          as Map<String, dynamic>);
  static GQuickSearchData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GQuickSearchData.serializer, json);
}

abstract class GQuickSearchData_quickSearch
    implements
        Built<GQuickSearchData_quickSearch,
            GQuickSearchData_quickSearchBuilder> {
  GQuickSearchData_quickSearch._();

  factory GQuickSearchData_quickSearch(
          [Function(GQuickSearchData_quickSearchBuilder b) updates]) =
      _$GQuickSearchData_quickSearch;

  static void _initializeBuilder(GQuickSearchData_quickSearchBuilder b) =>
      b..G__typename = 'QuickSearchConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get totalCount;
  BuiltList<GQuickSearchData_quickSearch_permissions>? get permissions;
  BuiltList<GQuickSearchData_quickSearch_nodes>? get nodes;
  GQuickSearchData_quickSearch_pageInfo get pageInfo;
  static Serializer<GQuickSearchData_quickSearch> get serializer =>
      _$gQuickSearchDataQuickSearchSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch.serializer, this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GQuickSearchData_quickSearch.serializer, json);
}

abstract class GQuickSearchData_quickSearch_permissions {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GQuickSearchData_quickSearch_permissions> get serializer =>
      _i2.InlineFragmentSerializer<GQuickSearchData_quickSearch_permissions>(
          'GQuickSearchData_quickSearch_permissions',
          GQuickSearchData_quickSearch_permissions__base, [
        GQuickSearchData_quickSearch_permissions__asLockPermission,
        GQuickSearchData_quickSearch_permissions__asPaginationPermission,
        GQuickSearchData_quickSearch_permissions__asFrequencyPermission
      ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GQuickSearchData_quickSearch_permissions.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_permissions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_permissions.serializer, json);
}

abstract class GQuickSearchData_quickSearch_permissions__base
    implements
        Built<GQuickSearchData_quickSearch_permissions__base,
            GQuickSearchData_quickSearch_permissions__baseBuilder>,
        GQuickSearchData_quickSearch_permissions {
  GQuickSearchData_quickSearch_permissions__base._();

  factory GQuickSearchData_quickSearch_permissions__base(
      [Function(GQuickSearchData_quickSearch_permissions__baseBuilder b)
          updates]) = _$GQuickSearchData_quickSearch_permissions__base;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_permissions__baseBuilder b) =>
      b..G__typename = 'Permission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GQuickSearchData_quickSearch_permissions__base>
      get serializer => _$gQuickSearchDataQuickSearchPermissionsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GQuickSearchData_quickSearch_permissions__base.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_permissions__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_permissions__base.serializer, json);
}

abstract class GQuickSearchData_quickSearch_permissions__asLockPermission
    implements
        Built<GQuickSearchData_quickSearch_permissions__asLockPermission,
            GQuickSearchData_quickSearch_permissions__asLockPermissionBuilder>,
        GQuickSearchData_quickSearch_permissions,
        _i3.GLockPermissionFields {
  GQuickSearchData_quickSearch_permissions__asLockPermission._();

  factory GQuickSearchData_quickSearch_permissions__asLockPermission(
      [Function(
              GQuickSearchData_quickSearch_permissions__asLockPermissionBuilder
                  b)
          updates]) = _$GQuickSearchData_quickSearch_permissions__asLockPermission;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_permissions__asLockPermissionBuilder
              b) =>
      b..G__typename = 'LockPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get locked;
  static Serializer<GQuickSearchData_quickSearch_permissions__asLockPermission>
      get serializer =>
          _$gQuickSearchDataQuickSearchPermissionsAsLockPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_permissions__asLockPermission.serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_permissions__asLockPermission? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_permissions__asLockPermission.serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_permissions__asPaginationPermission
    implements
        Built<GQuickSearchData_quickSearch_permissions__asPaginationPermission,
            GQuickSearchData_quickSearch_permissions__asPaginationPermissionBuilder>,
        GQuickSearchData_quickSearch_permissions,
        _i3.GPaginationPermissionFields {
  GQuickSearchData_quickSearch_permissions__asPaginationPermission._();

  factory GQuickSearchData_quickSearch_permissions__asPaginationPermission(
          [Function(
                  GQuickSearchData_quickSearch_permissions__asPaginationPermissionBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_permissions__asPaginationPermission;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_permissions__asPaginationPermissionBuilder
              b) =>
      b..G__typename = 'PaginationPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get rowLimit;
  bool get lockNextPage;
  bool get lockPreviousPage;
  static Serializer<
          GQuickSearchData_quickSearch_permissions__asPaginationPermission>
      get serializer =>
          _$gQuickSearchDataQuickSearchPermissionsAsPaginationPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_permissions__asPaginationPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_permissions__asPaginationPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_permissions__asPaginationPermission
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_permissions__asFrequencyPermission
    implements
        Built<GQuickSearchData_quickSearch_permissions__asFrequencyPermission,
            GQuickSearchData_quickSearch_permissions__asFrequencyPermissionBuilder>,
        GQuickSearchData_quickSearch_permissions,
        _i3.GFrequencyPermissionFields {
  GQuickSearchData_quickSearch_permissions__asFrequencyPermission._();

  factory GQuickSearchData_quickSearch_permissions__asFrequencyPermission(
          [Function(
                  GQuickSearchData_quickSearch_permissions__asFrequencyPermissionBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_permissions__asFrequencyPermission;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_permissions__asFrequencyPermissionBuilder
              b) =>
      b..G__typename = 'FrequencyPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get used;
  int get total;
  int get remaining;
  static Serializer<
          GQuickSearchData_quickSearch_permissions__asFrequencyPermission>
      get serializer =>
          _$gQuickSearchDataQuickSearchPermissionsAsFrequencyPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_permissions__asFrequencyPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_permissions__asFrequencyPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_permissions__asFrequencyPermission
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GQuickSearchData_quickSearch_nodes> get serializer =>
      _i2.InlineFragmentSerializer<GQuickSearchData_quickSearch_nodes>(
          'GQuickSearchData_quickSearch_nodes',
          GQuickSearchData_quickSearch_nodes__base, [
        GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode,
        GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode
      ]);
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GQuickSearchData_quickSearch_nodes.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GQuickSearchData_quickSearch_nodes.serializer, json);
}

abstract class GQuickSearchData_quickSearch_nodes__base
    implements
        Built<GQuickSearchData_quickSearch_nodes__base,
            GQuickSearchData_quickSearch_nodes__baseBuilder>,
        GQuickSearchData_quickSearch_nodes {
  GQuickSearchData_quickSearch_nodes__base._();

  factory GQuickSearchData_quickSearch_nodes__base(
      [Function(GQuickSearchData_quickSearch_nodes__baseBuilder b)
          updates]) = _$GQuickSearchData_quickSearch_nodes__base;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__baseBuilder b) =>
      b..G__typename = 'QuickSearchNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GQuickSearchData_quickSearch_nodes__base> get serializer =>
      _$gQuickSearchDataQuickSearchNodesBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GQuickSearchData_quickSearch_nodes__base.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__base.serializer, json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode
    implements
        Built<GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode,
            GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNodeBuilder>,
        GQuickSearchData_quickSearch_nodes,
        _i4.GQuickSearchEntityNodeFields {
  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode._();

  factory GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode(
      [Function(
              GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNodeBuilder
                  b)
          updates]) = _$GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNodeBuilder
              b) =>
      b..G__typename = 'QuickSearchEntityNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_action?
      get action;
  String? get description;
  BuiltList<String>? get highlightTexts;
  String? get logoURI;
  String get nodeId;
  String get searchType;
  String? get subtitle;
  String? get title;
  BuiltList<GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags>?
      get tags;
  static Serializer<GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode>
      get serializer =>
          _$gQuickSearchDataQuickSearchNodesAsQuickSearchEntityNodeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode.serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_action
    implements
        Built<
            GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_action,
            GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_actionBuilder>,
        _i4.GQuickSearchEntityNodeFields_action {
  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_action._();

  factory GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_action(
          [Function(
                  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_actionBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_action;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_actionBuilder
              b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get data;
  Map<String, dynamic>? get args;
  String get name;
  _i5.GActionType get type;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_action>
      get serializer =>
          _$gQuickSearchDataQuickSearchNodesAsQuickSearchEntityNodeActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_action
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_action?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_action
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags
    implements _i4.GQuickSearchEntityNodeFields_tags {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags>
      get serializer => _i2.InlineFragmentSerializer<
                  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags>(
              'GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags',
              GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__base,
              [
                GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag,
                GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag,
                GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asRiskTag
              ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__base
    implements
        Built<
            GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__base,
            GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__baseBuilder>,
        GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags {
  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__base._();

  factory GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__base(
          [Function(
                  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__baseBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__base;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__baseBuilder
              b) =>
      b..G__typename = 'Tag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__base>
      get serializer =>
          _$gQuickSearchDataQuickSearchNodesAsQuickSearchEntityNodeTagsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__base
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__base
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag
    implements
        Built<
            GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag,
            GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asQuickSearchTagBuilder>,
        GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags,
        _i6.GQuickSearchTagFields {
  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag._();

  factory GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag(
          [Function(
                  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asQuickSearchTagBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asQuickSearchTagBuilder
              b) =>
      b..G__typename = 'QuickSearchTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag>
      get serializer =>
          _$gQuickSearchDataQuickSearchNodesAsQuickSearchEntityNodeTagsAsQuickSearchTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asQuickSearchTag
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag
    implements
        Built<
            GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag,
            GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTagBuilder>,
        GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags,
        _i6.GTextTagFields {
  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag._();

  factory GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag(
          [Function(
                  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTagBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTagBuilder
              b) =>
      b..G__typename = 'TextTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get name;
  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag_action?
      get action;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag>
      get serializer =>
          _$gQuickSearchDataQuickSearchNodesAsQuickSearchEntityNodeTagsAsTextTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag_action
    implements
        Built<
            GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag_action,
            GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag_actionBuilder>,
        _i6.GTextTagFields_action {
  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag_action._();

  factory GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag_action(
          [Function(
                  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag_actionBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag_action;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag_actionBuilder
              b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  _i5.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag_action>
      get serializer =>
          _$gQuickSearchDataQuickSearchNodesAsQuickSearchEntityNodeTagsAsTextTagActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag_action
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag_action?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asTextTag_action
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asRiskTag
    implements
        Built<
            GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asRiskTag,
            GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asRiskTagBuilder>,
        GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags,
        _i6.GRiskTagFields {
  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asRiskTag._();

  factory GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asRiskTag(
          [Function(
                  GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asRiskTagBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asRiskTag;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asRiskTagBuilder
              b) =>
      b..G__typename = 'RiskTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get level;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asRiskTag>
      get serializer =>
          _$gQuickSearchDataQuickSearchNodesAsQuickSearchEntityNodeTagsAsRiskTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asRiskTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asRiskTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchEntityNode_tags__asRiskTag
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode
    implements
        Built<GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode,
            GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNodeBuilder>,
        GQuickSearchData_quickSearch_nodes,
        _i4.GQuickSearchInfoFlowNodeFields {
  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode._();

  factory GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode(
          [Function(
                  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNodeBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNodeBuilder
              b) =>
      b..G__typename = 'QuickSearchInfoFlowNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_action?
      get action;
  String? get imageURI;
  int? get publishTime;
  String? get description;
  BuiltList<String>? get highlightTexts;
  String get nodeId;
  String get searchType;
  String? get subtitle;
  String? get title;
  BuiltList<GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags>?
      get tags;
  BuiltList<
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_relatedEntity>?
      get relatedEntity;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode>
      get serializer =>
          _$gQuickSearchDataQuickSearchNodesAsQuickSearchInfoFlowNodeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode.serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_action
    implements
        Built<
            GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_action,
            GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_actionBuilder>,
        _i4.GQuickSearchInfoFlowNodeFields_action {
  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_action._();

  factory GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_action(
          [Function(
                  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_actionBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_action;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_actionBuilder
              b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  Map<String, dynamic>? get args;
  String get name;
  _i5.GActionType get type;
  String? get data;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_action>
      get serializer =>
          _$gQuickSearchDataQuickSearchNodesAsQuickSearchInfoFlowNodeActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_action
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_action?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_action
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags
    implements _i4.GQuickSearchInfoFlowNodeFields_tags {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags>
      get serializer => _i2.InlineFragmentSerializer<
                  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags>(
              'GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags',
              GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__base,
              [
                GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag,
                GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag,
                GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag
              ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__base
    implements
        Built<
            GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__base,
            GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__baseBuilder>,
        GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags {
  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__base._();

  factory GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__base(
          [Function(
                  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__baseBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__base;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__baseBuilder
              b) =>
      b..G__typename = 'Tag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__base>
      get serializer =>
          _$gQuickSearchDataQuickSearchNodesAsQuickSearchInfoFlowNodeTagsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__base
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__base
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag
    implements
        Built<
            GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag,
            GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTagBuilder>,
        GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags,
        _i6.GQuickSearchTagFields {
  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag._();

  factory GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag(
          [Function(
                  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTagBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTagBuilder
              b) =>
      b..G__typename = 'QuickSearchTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag>
      get serializer =>
          _$gQuickSearchDataQuickSearchNodesAsQuickSearchInfoFlowNodeTagsAsQuickSearchTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag
    implements
        Built<
            GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag,
            GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTagBuilder>,
        GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags,
        _i6.GTextTagFields {
  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag._();

  factory GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag(
          [Function(
                  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTagBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTagBuilder
              b) =>
      b..G__typename = 'TextTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get name;
  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action?
      get action;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag>
      get serializer =>
          _$gQuickSearchDataQuickSearchNodesAsQuickSearchInfoFlowNodeTagsAsTextTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action
    implements
        Built<
            GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action,
            GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_actionBuilder>,
        _i6.GTextTagFields_action {
  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action._();

  factory GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action(
          [Function(
                  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_actionBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_actionBuilder
              b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  _i5.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action>
      get serializer =>
          _$gQuickSearchDataQuickSearchNodesAsQuickSearchInfoFlowNodeTagsAsTextTagActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asTextTag_action
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag
    implements
        Built<
            GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag,
            GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asRiskTagBuilder>,
        GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags,
        _i6.GRiskTagFields {
  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag._();

  factory GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag(
          [Function(
                  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asRiskTagBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asRiskTagBuilder
              b) =>
      b..G__typename = 'RiskTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get level;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag>
      get serializer =>
          _$gQuickSearchDataQuickSearchNodesAsQuickSearchInfoFlowNodeTagsAsRiskTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asRiskTag
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_relatedEntity
    implements
        Built<
            GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_relatedEntity,
            GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_relatedEntityBuilder>,
        _i4.GQuickSearchInfoFlowNodeFields_relatedEntity,
        _i7.GEntityFields {
  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_relatedEntity._();

  factory GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_relatedEntity(
          [Function(
                  GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_relatedEntityBuilder
                      b)
              updates]) =
      _$GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_relatedEntity;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_relatedEntityBuilder
              b) =>
      b..G__typename = 'Entity';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get entityId;
  _i5.GEntityType get entityType;
  String get entityName;
  String? get portraitURL;
  static Serializer<
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_relatedEntity>
      get serializer =>
          _$gQuickSearchDataQuickSearchNodesAsQuickSearchInfoFlowNodeRelatedEntitySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_relatedEntity
          .serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_relatedEntity?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_relatedEntity
              .serializer,
          json);
}

abstract class GQuickSearchData_quickSearch_pageInfo
    implements
        Built<GQuickSearchData_quickSearch_pageInfo,
            GQuickSearchData_quickSearch_pageInfoBuilder>,
        _i8.GPageInfoFields {
  GQuickSearchData_quickSearch_pageInfo._();

  factory GQuickSearchData_quickSearch_pageInfo(
          [Function(GQuickSearchData_quickSearch_pageInfoBuilder b) updates]) =
      _$GQuickSearchData_quickSearch_pageInfo;

  static void _initializeBuilder(
          GQuickSearchData_quickSearch_pageInfoBuilder b) =>
      b..G__typename = 'PageInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get hasPreviousPage;
  bool get hasNextPage;
  String? get startCursor;
  String? get endCursor;
  static Serializer<GQuickSearchData_quickSearch_pageInfo> get serializer =>
      _$gQuickSearchDataQuickSearchPageInfoSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GQuickSearchData_quickSearch_pageInfo.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchData_quickSearch_pageInfo? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GQuickSearchData_quickSearch_pageInfo.serializer, json);
}

abstract class GIncrementEntityClickThroughData
    implements
        Built<GIncrementEntityClickThroughData,
            GIncrementEntityClickThroughDataBuilder> {
  GIncrementEntityClickThroughData._();

  factory GIncrementEntityClickThroughData(
          [Function(GIncrementEntityClickThroughDataBuilder b) updates]) =
      _$GIncrementEntityClickThroughData;

  static void _initializeBuilder(GIncrementEntityClickThroughDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get incrementEntityClickThrough;
  static Serializer<GIncrementEntityClickThroughData> get serializer =>
      _$gIncrementEntityClickThroughDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GIncrementEntityClickThroughData.serializer, this)
      as Map<String, dynamic>);
  static GIncrementEntityClickThroughData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GIncrementEntityClickThroughData.serializer, json);
}
