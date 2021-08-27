// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i4;
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;
import 'package:rime_app/graphql/types/entity/entity_fragment.data.gql.dart'
    as _i3;
import 'package:rime_app/graphql/types/page_info/page_info.data.gql.dart'
    as _i6;
import 'package:rime_app/graphql/types/permission/permission.data.gql.dart'
    as _i7;
import 'package:rime_app/graphql/types/tags/tags_fragment.data.gql.dart' as _i5;

part 'tracker.data.gql.g.dart';

abstract class GTrackerRecommendationsData
    implements
        Built<GTrackerRecommendationsData, GTrackerRecommendationsDataBuilder> {
  GTrackerRecommendationsData._();

  factory GTrackerRecommendationsData(
          [Function(GTrackerRecommendationsDataBuilder b) updates]) =
      _$GTrackerRecommendationsData;

  static void _initializeBuilder(GTrackerRecommendationsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GTrackerRecommendationsData_appTrackerRecommendations>?
      get appTrackerRecommendations;
  static Serializer<GTrackerRecommendationsData> get serializer =>
      _$gTrackerRecommendationsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GTrackerRecommendationsData.serializer, this) as Map<String, dynamic>);
  static GTrackerRecommendationsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GTrackerRecommendationsData.serializer, json);
}

abstract class GTrackerRecommendationsData_appTrackerRecommendations
    implements
        Built<GTrackerRecommendationsData_appTrackerRecommendations,
            GTrackerRecommendationsData_appTrackerRecommendationsBuilder> {
  GTrackerRecommendationsData_appTrackerRecommendations._();

  factory GTrackerRecommendationsData_appTrackerRecommendations(
      [Function(GTrackerRecommendationsData_appTrackerRecommendationsBuilder b)
          updates]) = _$GTrackerRecommendationsData_appTrackerRecommendations;

  static void _initializeBuilder(
          GTrackerRecommendationsData_appTrackerRecommendationsBuilder b) =>
      b..G__typename = 'Recommendation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get entityID;
  _i2.GEntityType? get entityType;
  String get primaryName;
  String get logoURI;
  static Serializer<GTrackerRecommendationsData_appTrackerRecommendations>
      get serializer =>
          _$gTrackerRecommendationsDataAppTrackerRecommendationsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GTrackerRecommendationsData_appTrackerRecommendations.serializer,
      this) as Map<String, dynamic>);
  static GTrackerRecommendationsData_appTrackerRecommendations? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GTrackerRecommendationsData_appTrackerRecommendations.serializer,
          json);
}

abstract class GTrackedEntityCountData
    implements Built<GTrackedEntityCountData, GTrackedEntityCountDataBuilder> {
  GTrackedEntityCountData._();

  factory GTrackedEntityCountData(
          [Function(GTrackedEntityCountDataBuilder b) updates]) =
      _$GTrackedEntityCountData;

  static void _initializeBuilder(GTrackedEntityCountDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GTrackedEntityCountData_appTrackedEntityCount? get appTrackedEntityCount;
  static Serializer<GTrackedEntityCountData> get serializer =>
      _$gTrackedEntityCountDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GTrackedEntityCountData.serializer, this)
          as Map<String, dynamic>);
  static GTrackedEntityCountData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GTrackedEntityCountData.serializer, json);
}

abstract class GTrackedEntityCountData_appTrackedEntityCount
    implements
        Built<GTrackedEntityCountData_appTrackedEntityCount,
            GTrackedEntityCountData_appTrackedEntityCountBuilder> {
  GTrackedEntityCountData_appTrackedEntityCount._();

  factory GTrackedEntityCountData_appTrackedEntityCount(
      [Function(GTrackedEntityCountData_appTrackedEntityCountBuilder b)
          updates]) = _$GTrackedEntityCountData_appTrackedEntityCount;

  static void _initializeBuilder(
          GTrackedEntityCountData_appTrackedEntityCountBuilder b) =>
      b..G__typename = 'TrackedEntityCount';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get count;
  static Serializer<GTrackedEntityCountData_appTrackedEntityCount>
      get serializer =>
          _$gTrackedEntityCountDataAppTrackedEntityCountSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GTrackedEntityCountData_appTrackedEntityCount.serializer, this)
      as Map<String, dynamic>);
  static GTrackedEntityCountData_appTrackedEntityCount? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GTrackedEntityCountData_appTrackedEntityCount.serializer, json);
}

abstract class GAppTrackerTimelineData
    implements Built<GAppTrackerTimelineData, GAppTrackerTimelineDataBuilder> {
  GAppTrackerTimelineData._();

  factory GAppTrackerTimelineData(
          [Function(GAppTrackerTimelineDataBuilder b) updates]) =
      _$GAppTrackerTimelineData;

  static void _initializeBuilder(GAppTrackerTimelineDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GAppTrackerTimelineData_appTrackerTimeline? get appTrackerTimeline;
  static Serializer<GAppTrackerTimelineData> get serializer =>
      _$gAppTrackerTimelineDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAppTrackerTimelineData.serializer, this)
          as Map<String, dynamic>);
  static GAppTrackerTimelineData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAppTrackerTimelineData.serializer, json);
}

abstract class GAppTrackerTimelineData_appTrackerTimeline
    implements
        Built<GAppTrackerTimelineData_appTrackerTimeline,
            GAppTrackerTimelineData_appTrackerTimelineBuilder> {
  GAppTrackerTimelineData_appTrackerTimeline._();

  factory GAppTrackerTimelineData_appTrackerTimeline(
      [Function(GAppTrackerTimelineData_appTrackerTimelineBuilder b)
          updates]) = _$GAppTrackerTimelineData_appTrackerTimeline;

  static void _initializeBuilder(
          GAppTrackerTimelineData_appTrackerTimelineBuilder b) =>
      b..G__typename = 'AppTimelineConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get totalCount;
  BuiltList<GAppTrackerTimelineData_appTrackerTimeline_nodes>? get nodes;
  GAppTrackerTimelineData_appTrackerTimeline_pageInfo? get pageInfo;
  BuiltList<GAppTrackerTimelineData_appTrackerTimeline_permissions>?
      get permissions;
  bool? get isNeedFolded;
  static Serializer<GAppTrackerTimelineData_appTrackerTimeline>
      get serializer => _$gAppTrackerTimelineDataAppTrackerTimelineSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAppTrackerTimelineData_appTrackerTimeline.serializer, this)
      as Map<String, dynamic>);
  static GAppTrackerTimelineData_appTrackerTimeline? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTrackerTimelineData_appTrackerTimeline.serializer, json);
}

abstract class GAppTrackerTimelineData_appTrackerTimeline_nodes
    implements
        Built<GAppTrackerTimelineData_appTrackerTimeline_nodes,
            GAppTrackerTimelineData_appTrackerTimeline_nodesBuilder>,
        GAppTimelineRowNodeFields {
  GAppTrackerTimelineData_appTrackerTimeline_nodes._();

  factory GAppTrackerTimelineData_appTrackerTimeline_nodes(
      [Function(GAppTrackerTimelineData_appTrackerTimeline_nodesBuilder b)
          updates]) = _$GAppTrackerTimelineData_appTrackerTimeline_nodes;

  static void _initializeBuilder(
          GAppTrackerTimelineData_appTrackerTimeline_nodesBuilder b) =>
      b..G__typename = 'AppTimelineRowNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get time;
  String get data;
  GAppTrackerTimelineData_appTrackerTimeline_nodes_entity? get entity;
  BuiltList<GAppTrackerTimelineData_appTrackerTimeline_nodes_tags>? get tags;
  static Serializer<GAppTrackerTimelineData_appTrackerTimeline_nodes>
      get serializer =>
          _$gAppTrackerTimelineDataAppTrackerTimelineNodesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_nodes.serializer, this)
      as Map<String, dynamic>);
  static GAppTrackerTimelineData_appTrackerTimeline_nodes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_nodes.serializer, json);
}

abstract class GAppTrackerTimelineData_appTrackerTimeline_nodes_entity
    implements
        Built<GAppTrackerTimelineData_appTrackerTimeline_nodes_entity,
            GAppTrackerTimelineData_appTrackerTimeline_nodes_entityBuilder>,
        GAppTimelineRowNodeFields_entity,
        _i3.GEntityFields {
  GAppTrackerTimelineData_appTrackerTimeline_nodes_entity._();

  factory GAppTrackerTimelineData_appTrackerTimeline_nodes_entity(
      [Function(
              GAppTrackerTimelineData_appTrackerTimeline_nodes_entityBuilder b)
          updates]) = _$GAppTrackerTimelineData_appTrackerTimeline_nodes_entity;

  static void _initializeBuilder(
          GAppTrackerTimelineData_appTrackerTimeline_nodes_entityBuilder b) =>
      b..G__typename = 'Entity';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get entityId;
  _i2.GEntityType get entityType;
  String get entityName;
  String? get portraitURL;
  static Serializer<GAppTrackerTimelineData_appTrackerTimeline_nodes_entity>
      get serializer =>
          _$gAppTrackerTimelineDataAppTrackerTimelineNodesEntitySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTimelineData_appTrackerTimeline_nodes_entity.serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTimelineData_appTrackerTimeline_nodes_entity? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_nodes_entity.serializer,
          json);
}

abstract class GAppTrackerTimelineData_appTrackerTimeline_nodes_tags
    implements GAppTimelineRowNodeFields_tags {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GAppTrackerTimelineData_appTrackerTimeline_nodes_tags>
      get serializer => _i4.InlineFragmentSerializer<
                  GAppTrackerTimelineData_appTrackerTimeline_nodes_tags>(
              'GAppTrackerTimelineData_appTrackerTimeline_nodes_tags',
              GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__base, [
            GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asQuickSearchTag,
            GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag,
            GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asRiskTag
          ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTimelineData_appTrackerTimeline_nodes_tags.serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTimelineData_appTrackerTimeline_nodes_tags? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_nodes_tags.serializer,
          json);
}

abstract class GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__base
    implements
        Built<GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__base,
            GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__baseBuilder>,
        GAppTrackerTimelineData_appTrackerTimeline_nodes_tags {
  GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__base._();

  factory GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__base(
      [Function(
              GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__baseBuilder
                  b)
          updates]) = _$GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__base;

  static void _initializeBuilder(
          GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__baseBuilder
              b) =>
      b..G__typename = 'Tag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__base>
      get serializer =>
          _$gAppTrackerTimelineDataAppTrackerTimelineNodesTagsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__base.serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__base
              .serializer,
          json);
}

abstract class GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asQuickSearchTag
    implements
        Built<
            GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asQuickSearchTag,
            GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asQuickSearchTagBuilder>,
        GAppTrackerTimelineData_appTrackerTimeline_nodes_tags,
        _i5.GQuickSearchTagFields {
  GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asQuickSearchTag._();

  factory GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asQuickSearchTag(
          [Function(
                  GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asQuickSearchTagBuilder
                      b)
              updates]) =
      _$GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asQuickSearchTag;

  static void _initializeBuilder(
          GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asQuickSearchTagBuilder
              b) =>
      b..G__typename = 'QuickSearchTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  static Serializer<
          GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asQuickSearchTag>
      get serializer =>
          _$gAppTrackerTimelineDataAppTrackerTimelineNodesTagsAsQuickSearchTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asQuickSearchTag
          .serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asQuickSearchTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asQuickSearchTag
              .serializer,
          json);
}

abstract class GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag
    implements
        Built<GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag,
            GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTagBuilder>,
        GAppTrackerTimelineData_appTrackerTimeline_nodes_tags,
        _i5.GTextTagFields {
  GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag._();

  factory GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag(
          [Function(
                  GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTagBuilder
                      b)
              updates]) =
      _$GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag;

  static void _initializeBuilder(
          GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTagBuilder
              b) =>
      b..G__typename = 'TextTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get name;
  GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag_action?
      get action;
  static Serializer<
          GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag>
      get serializer =>
          _$gAppTrackerTimelineDataAppTrackerTimelineNodesTagsAsTextTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag
          .serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag
              .serializer,
          json);
}

abstract class GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag_action
    implements
        Built<
            GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag_action,
            GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag_actionBuilder>,
        _i5.GTextTagFields_action {
  GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag_action._();

  factory GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag_action(
          [Function(
                  GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag_actionBuilder
                      b)
              updates]) =
      _$GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag_action;

  static void _initializeBuilder(
          GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag_actionBuilder
              b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  _i2.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  static Serializer<
          GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag_action>
      get serializer =>
          _$gAppTrackerTimelineDataAppTrackerTimelineNodesTagsAsTextTagActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag_action
          .serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag_action?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag_action
              .serializer,
          json);
}

abstract class GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asRiskTag
    implements
        Built<GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asRiskTag,
            GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asRiskTagBuilder>,
        GAppTrackerTimelineData_appTrackerTimeline_nodes_tags,
        _i5.GRiskTagFields {
  GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asRiskTag._();

  factory GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asRiskTag(
          [Function(
                  GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asRiskTagBuilder
                      b)
              updates]) =
      _$GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asRiskTag;

  static void _initializeBuilder(
          GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asRiskTagBuilder
              b) =>
      b..G__typename = 'RiskTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get level;
  static Serializer<
          GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asRiskTag>
      get serializer =>
          _$gAppTrackerTimelineDataAppTrackerTimelineNodesTagsAsRiskTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asRiskTag
          .serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asRiskTag?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asRiskTag
              .serializer,
          json);
}

abstract class GAppTrackerTimelineData_appTrackerTimeline_pageInfo
    implements
        Built<GAppTrackerTimelineData_appTrackerTimeline_pageInfo,
            GAppTrackerTimelineData_appTrackerTimeline_pageInfoBuilder>,
        _i6.GPageInfoFields {
  GAppTrackerTimelineData_appTrackerTimeline_pageInfo._();

  factory GAppTrackerTimelineData_appTrackerTimeline_pageInfo(
      [Function(GAppTrackerTimelineData_appTrackerTimeline_pageInfoBuilder b)
          updates]) = _$GAppTrackerTimelineData_appTrackerTimeline_pageInfo;

  static void _initializeBuilder(
          GAppTrackerTimelineData_appTrackerTimeline_pageInfoBuilder b) =>
      b..G__typename = 'PageInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get hasPreviousPage;
  bool get hasNextPage;
  String? get startCursor;
  String? get endCursor;
  static Serializer<GAppTrackerTimelineData_appTrackerTimeline_pageInfo>
      get serializer =>
          _$gAppTrackerTimelineDataAppTrackerTimelinePageInfoSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_pageInfo.serializer, this)
      as Map<String, dynamic>);
  static GAppTrackerTimelineData_appTrackerTimeline_pageInfo? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_pageInfo.serializer, json);
}

abstract class GAppTrackerTimelineData_appTrackerTimeline_permissions {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GAppTrackerTimelineData_appTrackerTimeline_permissions>
      get serializer => _i4.InlineFragmentSerializer<
                  GAppTrackerTimelineData_appTrackerTimeline_permissions>(
              'GAppTrackerTimelineData_appTrackerTimeline_permissions',
              GAppTrackerTimelineData_appTrackerTimeline_permissions__base, [
            GAppTrackerTimelineData_appTrackerTimeline_permissions__asLockPermission,
            GAppTrackerTimelineData_appTrackerTimeline_permissions__asPaginationPermission,
            GAppTrackerTimelineData_appTrackerTimeline_permissions__asFrequencyPermission
          ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTimelineData_appTrackerTimeline_permissions.serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTimelineData_appTrackerTimeline_permissions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_permissions.serializer,
          json);
}

abstract class GAppTrackerTimelineData_appTrackerTimeline_permissions__base
    implements
        Built<GAppTrackerTimelineData_appTrackerTimeline_permissions__base,
            GAppTrackerTimelineData_appTrackerTimeline_permissions__baseBuilder>,
        GAppTrackerTimelineData_appTrackerTimeline_permissions {
  GAppTrackerTimelineData_appTrackerTimeline_permissions__base._();

  factory GAppTrackerTimelineData_appTrackerTimeline_permissions__base(
          [Function(
                  GAppTrackerTimelineData_appTrackerTimeline_permissions__baseBuilder
                      b)
              updates]) =
      _$GAppTrackerTimelineData_appTrackerTimeline_permissions__base;

  static void _initializeBuilder(
          GAppTrackerTimelineData_appTrackerTimeline_permissions__baseBuilder
              b) =>
      b..G__typename = 'Permission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GAppTrackerTimelineData_appTrackerTimeline_permissions__base>
      get serializer =>
          _$gAppTrackerTimelineDataAppTrackerTimelinePermissionsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTimelineData_appTrackerTimeline_permissions__base.serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTimelineData_appTrackerTimeline_permissions__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_permissions__base
              .serializer,
          json);
}

abstract class GAppTrackerTimelineData_appTrackerTimeline_permissions__asLockPermission
    implements
        Built<
            GAppTrackerTimelineData_appTrackerTimeline_permissions__asLockPermission,
            GAppTrackerTimelineData_appTrackerTimeline_permissions__asLockPermissionBuilder>,
        GAppTrackerTimelineData_appTrackerTimeline_permissions,
        _i7.GLockPermissionFields {
  GAppTrackerTimelineData_appTrackerTimeline_permissions__asLockPermission._();

  factory GAppTrackerTimelineData_appTrackerTimeline_permissions__asLockPermission(
          [Function(
                  GAppTrackerTimelineData_appTrackerTimeline_permissions__asLockPermissionBuilder
                      b)
              updates]) =
      _$GAppTrackerTimelineData_appTrackerTimeline_permissions__asLockPermission;

  static void _initializeBuilder(
          GAppTrackerTimelineData_appTrackerTimeline_permissions__asLockPermissionBuilder
              b) =>
      b..G__typename = 'LockPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get locked;
  static Serializer<
          GAppTrackerTimelineData_appTrackerTimeline_permissions__asLockPermission>
      get serializer =>
          _$gAppTrackerTimelineDataAppTrackerTimelinePermissionsAsLockPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTimelineData_appTrackerTimeline_permissions__asLockPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTimelineData_appTrackerTimeline_permissions__asLockPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_permissions__asLockPermission
              .serializer,
          json);
}

abstract class GAppTrackerTimelineData_appTrackerTimeline_permissions__asPaginationPermission
    implements
        Built<
            GAppTrackerTimelineData_appTrackerTimeline_permissions__asPaginationPermission,
            GAppTrackerTimelineData_appTrackerTimeline_permissions__asPaginationPermissionBuilder>,
        GAppTrackerTimelineData_appTrackerTimeline_permissions,
        _i7.GPaginationPermissionFields {
  GAppTrackerTimelineData_appTrackerTimeline_permissions__asPaginationPermission._();

  factory GAppTrackerTimelineData_appTrackerTimeline_permissions__asPaginationPermission(
          [Function(
                  GAppTrackerTimelineData_appTrackerTimeline_permissions__asPaginationPermissionBuilder
                      b)
              updates]) =
      _$GAppTrackerTimelineData_appTrackerTimeline_permissions__asPaginationPermission;

  static void _initializeBuilder(
          GAppTrackerTimelineData_appTrackerTimeline_permissions__asPaginationPermissionBuilder
              b) =>
      b..G__typename = 'PaginationPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get rowLimit;
  bool get lockNextPage;
  bool get lockPreviousPage;
  static Serializer<
          GAppTrackerTimelineData_appTrackerTimeline_permissions__asPaginationPermission>
      get serializer =>
          _$gAppTrackerTimelineDataAppTrackerTimelinePermissionsAsPaginationPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTimelineData_appTrackerTimeline_permissions__asPaginationPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTimelineData_appTrackerTimeline_permissions__asPaginationPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_permissions__asPaginationPermission
              .serializer,
          json);
}

abstract class GAppTrackerTimelineData_appTrackerTimeline_permissions__asFrequencyPermission
    implements
        Built<
            GAppTrackerTimelineData_appTrackerTimeline_permissions__asFrequencyPermission,
            GAppTrackerTimelineData_appTrackerTimeline_permissions__asFrequencyPermissionBuilder>,
        GAppTrackerTimelineData_appTrackerTimeline_permissions,
        _i7.GFrequencyPermissionFields {
  GAppTrackerTimelineData_appTrackerTimeline_permissions__asFrequencyPermission._();

  factory GAppTrackerTimelineData_appTrackerTimeline_permissions__asFrequencyPermission(
          [Function(
                  GAppTrackerTimelineData_appTrackerTimeline_permissions__asFrequencyPermissionBuilder
                      b)
              updates]) =
      _$GAppTrackerTimelineData_appTrackerTimeline_permissions__asFrequencyPermission;

  static void _initializeBuilder(
          GAppTrackerTimelineData_appTrackerTimeline_permissions__asFrequencyPermissionBuilder
              b) =>
      b..G__typename = 'FrequencyPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get used;
  int get total;
  int get remaining;
  static Serializer<
          GAppTrackerTimelineData_appTrackerTimeline_permissions__asFrequencyPermission>
      get serializer =>
          _$gAppTrackerTimelineDataAppTrackerTimelinePermissionsAsFrequencyPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTimelineData_appTrackerTimeline_permissions__asFrequencyPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTimelineData_appTrackerTimeline_permissions__asFrequencyPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppTrackerTimelineData_appTrackerTimeline_permissions__asFrequencyPermission
              .serializer,
          json);
}

abstract class GAppTrackerTabsData
    implements Built<GAppTrackerTabsData, GAppTrackerTabsDataBuilder> {
  GAppTrackerTabsData._();

  factory GAppTrackerTabsData(
      [Function(GAppTrackerTabsDataBuilder b) updates]) = _$GAppTrackerTabsData;

  static void _initializeBuilder(GAppTrackerTabsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GAppTrackerTabsData_appTrackerTabs> get appTrackerTabs;
  static Serializer<GAppTrackerTabsData> get serializer =>
      _$gAppTrackerTabsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAppTrackerTabsData.serializer, this)
          as Map<String, dynamic>);
  static GAppTrackerTabsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAppTrackerTabsData.serializer, json);
}

abstract class GAppTrackerTabsData_appTrackerTabs {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GAppTrackerTabsData_appTrackerTabs> get serializer =>
      _i4.InlineFragmentSerializer<GAppTrackerTabsData_appTrackerTabs>(
          'GAppTrackerTabsData_appTrackerTabs',
          GAppTrackerTabsData_appTrackerTabs__base,
          [GAppTrackerTabsData_appTrackerTabs__asTimelineTab]);
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GAppTrackerTabsData_appTrackerTabs.serializer, this)
      as Map<String, dynamic>);
  static GAppTrackerTabsData_appTrackerTabs? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAppTrackerTabsData_appTrackerTabs.serializer, json);
}

abstract class GAppTrackerTabsData_appTrackerTabs__base
    implements
        Built<GAppTrackerTabsData_appTrackerTabs__base,
            GAppTrackerTabsData_appTrackerTabs__baseBuilder>,
        GAppTrackerTabsData_appTrackerTabs {
  GAppTrackerTabsData_appTrackerTabs__base._();

  factory GAppTrackerTabsData_appTrackerTabs__base(
      [Function(GAppTrackerTabsData_appTrackerTabs__baseBuilder b)
          updates]) = _$GAppTrackerTabsData_appTrackerTabs__base;

  static void _initializeBuilder(
          GAppTrackerTabsData_appTrackerTabs__baseBuilder b) =>
      b..G__typename = 'Tab';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GAppTrackerTabsData_appTrackerTabs__base> get serializer =>
      _$gAppTrackerTabsDataAppTrackerTabsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAppTrackerTabsData_appTrackerTabs__base.serializer, this)
      as Map<String, dynamic>);
  static GAppTrackerTabsData_appTrackerTabs__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTrackerTabsData_appTrackerTabs__base.serializer, json);
}

abstract class GAppTrackerTabsData_appTrackerTabs__asTimelineTab
    implements
        Built<GAppTrackerTabsData_appTrackerTabs__asTimelineTab,
            GAppTrackerTabsData_appTrackerTabs__asTimelineTabBuilder>,
        GAppTrackerTabsData_appTrackerTabs {
  GAppTrackerTabsData_appTrackerTabs__asTimelineTab._();

  factory GAppTrackerTabsData_appTrackerTabs__asTimelineTab(
      [Function(GAppTrackerTabsData_appTrackerTabs__asTimelineTabBuilder b)
          updates]) = _$GAppTrackerTabsData_appTrackerTabs__asTimelineTab;

  static void _initializeBuilder(
          GAppTrackerTabsData_appTrackerTabs__asTimelineTabBuilder b) =>
      b..G__typename = 'TimelineTab';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get timelineID;
  _i2.GTimelineType get timelineType;
  String get name;
  GAppTrackerTabsData_appTrackerTabs__asTimelineTab_modifier? get modifier;
  BuiltList<GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions>?
      get permissions;
  static Serializer<GAppTrackerTabsData_appTrackerTabs__asTimelineTab>
      get serializer =>
          _$gAppTrackerTabsDataAppTrackerTabsAsTimelineTabSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab.serializer, this)
      as Map<String, dynamic>);
  static GAppTrackerTabsData_appTrackerTabs__asTimelineTab? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab.serializer, json);
}

abstract class GAppTrackerTabsData_appTrackerTabs__asTimelineTab_modifier
    implements
        Built<GAppTrackerTabsData_appTrackerTabs__asTimelineTab_modifier,
            GAppTrackerTabsData_appTrackerTabs__asTimelineTab_modifierBuilder> {
  GAppTrackerTabsData_appTrackerTabs__asTimelineTab_modifier._();

  factory GAppTrackerTabsData_appTrackerTabs__asTimelineTab_modifier(
      [Function(
              GAppTrackerTabsData_appTrackerTabs__asTimelineTab_modifierBuilder
                  b)
          updates]) = _$GAppTrackerTabsData_appTrackerTabs__asTimelineTab_modifier;

  static void _initializeBuilder(
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_modifierBuilder
              b) =>
      b..G__typename = 'Modifier';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get hasUpdatedContent;
  bool get isNew;
  static Serializer<GAppTrackerTabsData_appTrackerTabs__asTimelineTab_modifier>
      get serializer =>
          _$gAppTrackerTabsDataAppTrackerTabsAsTimelineTabModifierSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTabsData_appTrackerTabs__asTimelineTab_modifier.serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTabsData_appTrackerTabs__asTimelineTab_modifier? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_modifier.serializer,
          json);
}

abstract class GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions>
      get serializer => _i4.InlineFragmentSerializer<
                  GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions>(
              'GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions',
              GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__base,
              [
                GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asLockPermission,
                GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asPaginationPermission,
                GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asFrequencyPermission
              ]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions.serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions
              .serializer,
          json);
}

abstract class GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__base
    implements
        Built<
            GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__base,
            GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__baseBuilder>,
        GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions {
  GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__base._();

  factory GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__base(
          [Function(
                  GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__baseBuilder
                      b)
              updates]) =
      _$GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__base;

  static void _initializeBuilder(
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__baseBuilder
              b) =>
      b..G__typename = 'Permission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__base>
      get serializer =>
          _$gAppTrackerTabsDataAppTrackerTabsAsTimelineTabPermissionsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__base
          .serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__base
              .serializer,
          json);
}

abstract class GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asLockPermission
    implements
        Built<
            GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asLockPermission,
            GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asLockPermissionBuilder>,
        GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions,
        _i7.GLockPermissionFields {
  GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asLockPermission._();

  factory GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asLockPermission(
          [Function(
                  GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asLockPermissionBuilder
                      b)
              updates]) =
      _$GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asLockPermission;

  static void _initializeBuilder(
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asLockPermissionBuilder
              b) =>
      b..G__typename = 'LockPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get locked;
  static Serializer<
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asLockPermission>
      get serializer =>
          _$gAppTrackerTabsDataAppTrackerTabsAsTimelineTabPermissionsAsLockPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asLockPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asLockPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asLockPermission
              .serializer,
          json);
}

abstract class GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asPaginationPermission
    implements
        Built<
            GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asPaginationPermission,
            GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asPaginationPermissionBuilder>,
        GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions,
        _i7.GPaginationPermissionFields {
  GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asPaginationPermission._();

  factory GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asPaginationPermission(
          [Function(
                  GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asPaginationPermissionBuilder
                      b)
              updates]) =
      _$GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asPaginationPermission;

  static void _initializeBuilder(
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asPaginationPermissionBuilder
              b) =>
      b..G__typename = 'PaginationPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get rowLimit;
  bool get lockNextPage;
  bool get lockPreviousPage;
  static Serializer<
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asPaginationPermission>
      get serializer =>
          _$gAppTrackerTabsDataAppTrackerTabsAsTimelineTabPermissionsAsPaginationPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asPaginationPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asPaginationPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asPaginationPermission
              .serializer,
          json);
}

abstract class GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asFrequencyPermission
    implements
        Built<
            GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asFrequencyPermission,
            GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asFrequencyPermissionBuilder>,
        GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions,
        _i7.GFrequencyPermissionFields {
  GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asFrequencyPermission._();

  factory GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asFrequencyPermission(
          [Function(
                  GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asFrequencyPermissionBuilder
                      b)
              updates]) =
      _$GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asFrequencyPermission;

  static void _initializeBuilder(
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asFrequencyPermissionBuilder
              b) =>
      b..G__typename = 'FrequencyPermission';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get used;
  int get total;
  int get remaining;
  static Serializer<
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asFrequencyPermission>
      get serializer =>
          _$gAppTrackerTabsDataAppTrackerTabsAsTimelineTabPermissionsAsFrequencyPermissionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asFrequencyPermission
          .serializer,
      this) as Map<String, dynamic>);
  static GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asFrequencyPermission?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GAppTrackerTabsData_appTrackerTabs__asTimelineTab_permissions__asFrequencyPermission
              .serializer,
          json);
}

abstract class GTrackTagsData
    implements Built<GTrackTagsData, GTrackTagsDataBuilder> {
  GTrackTagsData._();

  factory GTrackTagsData([Function(GTrackTagsDataBuilder b) updates]) =
      _$GTrackTagsData;

  static void _initializeBuilder(GTrackTagsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GTrackTagsData_appTrackerTags>? get appTrackerTags;
  static Serializer<GTrackTagsData> get serializer =>
      _$gTrackTagsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GTrackTagsData.serializer, this)
          as Map<String, dynamic>);
  static GTrackTagsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GTrackTagsData.serializer, json);
}

abstract class GTrackTagsData_appTrackerTags
    implements
        Built<GTrackTagsData_appTrackerTags,
            GTrackTagsData_appTrackerTagsBuilder> {
  GTrackTagsData_appTrackerTags._();

  factory GTrackTagsData_appTrackerTags(
          [Function(GTrackTagsData_appTrackerTagsBuilder b) updates]) =
      _$GTrackTagsData_appTrackerTags;

  static void _initializeBuilder(GTrackTagsData_appTrackerTagsBuilder b) =>
      b..G__typename = 'TrackerTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get name;
  static Serializer<GTrackTagsData_appTrackerTags> get serializer =>
      _$gTrackTagsDataAppTrackerTagsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GTrackTagsData_appTrackerTags.serializer, this) as Map<String, dynamic>);
  static GTrackTagsData_appTrackerTags? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GTrackTagsData_appTrackerTags.serializer, json);
}

abstract class GTrackedEntitiesData
    implements Built<GTrackedEntitiesData, GTrackedEntitiesDataBuilder> {
  GTrackedEntitiesData._();

  factory GTrackedEntitiesData(
          [Function(GTrackedEntitiesDataBuilder b) updates]) =
      _$GTrackedEntitiesData;

  static void _initializeBuilder(GTrackedEntitiesDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GTrackedEntitiesData_trackedEntities? get trackedEntities;
  static Serializer<GTrackedEntitiesData> get serializer =>
      _$gTrackedEntitiesDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GTrackedEntitiesData.serializer, this)
          as Map<String, dynamic>);
  static GTrackedEntitiesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GTrackedEntitiesData.serializer, json);
}

abstract class GTrackedEntitiesData_trackedEntities
    implements
        Built<GTrackedEntitiesData_trackedEntities,
            GTrackedEntitiesData_trackedEntitiesBuilder> {
  GTrackedEntitiesData_trackedEntities._();

  factory GTrackedEntitiesData_trackedEntities(
          [Function(GTrackedEntitiesData_trackedEntitiesBuilder b) updates]) =
      _$GTrackedEntitiesData_trackedEntities;

  static void _initializeBuilder(
          GTrackedEntitiesData_trackedEntitiesBuilder b) =>
      b..G__typename = 'EntityConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get totalCount;
  BuiltList<GTrackedEntitiesData_trackedEntities_nodes>? get nodes;
  GTrackedEntitiesData_trackedEntities_pageInfo get pageInfo;
  static Serializer<GTrackedEntitiesData_trackedEntities> get serializer =>
      _$gTrackedEntitiesDataTrackedEntitiesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GTrackedEntitiesData_trackedEntities.serializer, this)
      as Map<String, dynamic>);
  static GTrackedEntitiesData_trackedEntities? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GTrackedEntitiesData_trackedEntities.serializer, json);
}

abstract class GTrackedEntitiesData_trackedEntities_nodes
    implements
        Built<GTrackedEntitiesData_trackedEntities_nodes,
            GTrackedEntitiesData_trackedEntities_nodesBuilder>,
        _i3.GEntityFields {
  GTrackedEntitiesData_trackedEntities_nodes._();

  factory GTrackedEntitiesData_trackedEntities_nodes(
      [Function(GTrackedEntitiesData_trackedEntities_nodesBuilder b)
          updates]) = _$GTrackedEntitiesData_trackedEntities_nodes;

  static void _initializeBuilder(
          GTrackedEntitiesData_trackedEntities_nodesBuilder b) =>
      b..G__typename = 'Entity';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get entityId;
  _i2.GEntityType get entityType;
  String get entityName;
  String? get portraitURL;
  static Serializer<GTrackedEntitiesData_trackedEntities_nodes>
      get serializer => _$gTrackedEntitiesDataTrackedEntitiesNodesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GTrackedEntitiesData_trackedEntities_nodes.serializer, this)
      as Map<String, dynamic>);
  static GTrackedEntitiesData_trackedEntities_nodes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GTrackedEntitiesData_trackedEntities_nodes.serializer, json);
}

abstract class GTrackedEntitiesData_trackedEntities_pageInfo
    implements
        Built<GTrackedEntitiesData_trackedEntities_pageInfo,
            GTrackedEntitiesData_trackedEntities_pageInfoBuilder>,
        _i6.GPageInfoFields {
  GTrackedEntitiesData_trackedEntities_pageInfo._();

  factory GTrackedEntitiesData_trackedEntities_pageInfo(
      [Function(GTrackedEntitiesData_trackedEntities_pageInfoBuilder b)
          updates]) = _$GTrackedEntitiesData_trackedEntities_pageInfo;

  static void _initializeBuilder(
          GTrackedEntitiesData_trackedEntities_pageInfoBuilder b) =>
      b..G__typename = 'PageInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get hasPreviousPage;
  bool get hasNextPage;
  String? get startCursor;
  String? get endCursor;
  static Serializer<GTrackedEntitiesData_trackedEntities_pageInfo>
      get serializer => _$gTrackedEntitiesDataTrackedEntitiesPageInfoSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GTrackedEntitiesData_trackedEntities_pageInfo.serializer, this)
      as Map<String, dynamic>);
  static GTrackedEntitiesData_trackedEntities_pageInfo? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GTrackedEntitiesData_trackedEntities_pageInfo.serializer, json);
}

abstract class GTrackableThemeData
    implements Built<GTrackableThemeData, GTrackableThemeDataBuilder> {
  GTrackableThemeData._();

  factory GTrackableThemeData(
      [Function(GTrackableThemeDataBuilder b) updates]) = _$GTrackableThemeData;

  static void _initializeBuilder(GTrackableThemeDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GTrackableThemeData_appTrackableTheme? get appTrackableTheme;
  static Serializer<GTrackableThemeData> get serializer =>
      _$gTrackableThemeDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GTrackableThemeData.serializer, this)
          as Map<String, dynamic>);
  static GTrackableThemeData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GTrackableThemeData.serializer, json);
}

abstract class GTrackableThemeData_appTrackableTheme
    implements
        Built<GTrackableThemeData_appTrackableTheme,
            GTrackableThemeData_appTrackableThemeBuilder> {
  GTrackableThemeData_appTrackableTheme._();

  factory GTrackableThemeData_appTrackableTheme(
          [Function(GTrackableThemeData_appTrackableThemeBuilder b) updates]) =
      _$GTrackableThemeData_appTrackableTheme;

  static void _initializeBuilder(
          GTrackableThemeData_appTrackableThemeBuilder b) =>
      b..G__typename = 'TrackableTheme';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  _i2.GTrackerTheme get trackerTheme;
  bool get isTracked;
  static Serializer<GTrackableThemeData_appTrackableTheme> get serializer =>
      _$gTrackableThemeDataAppTrackableThemeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GTrackableThemeData_appTrackableTheme.serializer, this)
      as Map<String, dynamic>);
  static GTrackableThemeData_appTrackableTheme? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GTrackableThemeData_appTrackableTheme.serializer, json);
}

abstract class GAppTimelineRowNodeFields {
  String get G__typename;
  int get time;
  String get data;
  GAppTimelineRowNodeFields_entity? get entity;
  BuiltList<GAppTimelineRowNodeFields_tags>? get tags;
  Map<String, dynamic> toJson();
}

abstract class GAppTimelineRowNodeFields_entity implements _i3.GEntityFields {
  String get G__typename;
  String? get entityId;
  _i2.GEntityType get entityType;
  String get entityName;
  String? get portraitURL;
  Map<String, dynamic> toJson();
}

abstract class GAppTimelineRowNodeFields_tags {
  String get G__typename;
}

abstract class GAppTimelineRowNodeFields_tags__base
    implements GAppTimelineRowNodeFields_tags {
  String get G__typename;
  Map<String, dynamic> toJson();
}

abstract class GAppTimelineRowNodeFields_tags__asQuickSearchTag
    implements GAppTimelineRowNodeFields_tags, _i5.GQuickSearchTagFields {
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  Map<String, dynamic> toJson();
}

abstract class GAppTimelineRowNodeFields_tags__asTextTag
    implements GAppTimelineRowNodeFields_tags, _i5.GTextTagFields {
  String get G__typename;
  String? get name;
  GAppTimelineRowNodeFields_tags__asTextTag_action? get action;
  Map<String, dynamic> toJson();
}

abstract class GAppTimelineRowNodeFields_tags__asTextTag_action
    implements _i5.GTextTagFields_action {
  String get G__typename;
  String get name;
  _i2.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  Map<String, dynamic> toJson();
}

abstract class GAppTimelineRowNodeFields_tags__asRiskTag
    implements GAppTimelineRowNodeFields_tags, _i5.GRiskTagFields {
  String get G__typename;
  int? get level;
  Map<String, dynamic> toJson();
}

abstract class GAppTimelineRowNodeFieldsData
    implements
        Built<GAppTimelineRowNodeFieldsData,
            GAppTimelineRowNodeFieldsDataBuilder>,
        GAppTimelineRowNodeFields {
  GAppTimelineRowNodeFieldsData._();

  factory GAppTimelineRowNodeFieldsData(
          [Function(GAppTimelineRowNodeFieldsDataBuilder b) updates]) =
      _$GAppTimelineRowNodeFieldsData;

  static void _initializeBuilder(GAppTimelineRowNodeFieldsDataBuilder b) =>
      b..G__typename = 'AppTimelineRowNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get time;
  String get data;
  GAppTimelineRowNodeFieldsData_entity? get entity;
  BuiltList<GAppTimelineRowNodeFieldsData_tags>? get tags;
  static Serializer<GAppTimelineRowNodeFieldsData> get serializer =>
      _$gAppTimelineRowNodeFieldsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAppTimelineRowNodeFieldsData.serializer, this) as Map<String, dynamic>);
  static GAppTimelineRowNodeFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAppTimelineRowNodeFieldsData.serializer, json);
}

abstract class GAppTimelineRowNodeFieldsData_entity
    implements
        Built<GAppTimelineRowNodeFieldsData_entity,
            GAppTimelineRowNodeFieldsData_entityBuilder>,
        GAppTimelineRowNodeFields_entity,
        _i3.GEntityFields {
  GAppTimelineRowNodeFieldsData_entity._();

  factory GAppTimelineRowNodeFieldsData_entity(
          [Function(GAppTimelineRowNodeFieldsData_entityBuilder b) updates]) =
      _$GAppTimelineRowNodeFieldsData_entity;

  static void _initializeBuilder(
          GAppTimelineRowNodeFieldsData_entityBuilder b) =>
      b..G__typename = 'Entity';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get entityId;
  _i2.GEntityType get entityType;
  String get entityName;
  String? get portraitURL;
  static Serializer<GAppTimelineRowNodeFieldsData_entity> get serializer =>
      _$gAppTimelineRowNodeFieldsDataEntitySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GAppTimelineRowNodeFieldsData_entity.serializer, this)
      as Map<String, dynamic>);
  static GAppTimelineRowNodeFieldsData_entity? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTimelineRowNodeFieldsData_entity.serializer, json);
}

abstract class GAppTimelineRowNodeFieldsData_tags
    implements GAppTimelineRowNodeFields_tags {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GAppTimelineRowNodeFieldsData_tags> get serializer =>
      _i4.InlineFragmentSerializer<GAppTimelineRowNodeFieldsData_tags>(
          'GAppTimelineRowNodeFieldsData_tags',
          GAppTimelineRowNodeFieldsData_tags__base, [
        GAppTimelineRowNodeFieldsData_tags__asQuickSearchTag,
        GAppTimelineRowNodeFieldsData_tags__asTextTag,
        GAppTimelineRowNodeFieldsData_tags__asRiskTag
      ]);
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GAppTimelineRowNodeFieldsData_tags.serializer, this)
      as Map<String, dynamic>);
  static GAppTimelineRowNodeFieldsData_tags? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAppTimelineRowNodeFieldsData_tags.serializer, json);
}

abstract class GAppTimelineRowNodeFieldsData_tags__base
    implements
        Built<GAppTimelineRowNodeFieldsData_tags__base,
            GAppTimelineRowNodeFieldsData_tags__baseBuilder>,
        GAppTimelineRowNodeFieldsData_tags {
  GAppTimelineRowNodeFieldsData_tags__base._();

  factory GAppTimelineRowNodeFieldsData_tags__base(
      [Function(GAppTimelineRowNodeFieldsData_tags__baseBuilder b)
          updates]) = _$GAppTimelineRowNodeFieldsData_tags__base;

  static void _initializeBuilder(
          GAppTimelineRowNodeFieldsData_tags__baseBuilder b) =>
      b..G__typename = 'Tag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GAppTimelineRowNodeFieldsData_tags__base> get serializer =>
      _$gAppTimelineRowNodeFieldsDataTagsBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAppTimelineRowNodeFieldsData_tags__base.serializer, this)
      as Map<String, dynamic>);
  static GAppTimelineRowNodeFieldsData_tags__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTimelineRowNodeFieldsData_tags__base.serializer, json);
}

abstract class GAppTimelineRowNodeFieldsData_tags__asQuickSearchTag
    implements
        Built<GAppTimelineRowNodeFieldsData_tags__asQuickSearchTag,
            GAppTimelineRowNodeFieldsData_tags__asQuickSearchTagBuilder>,
        GAppTimelineRowNodeFieldsData_tags,
        _i5.GQuickSearchTagFields {
  GAppTimelineRowNodeFieldsData_tags__asQuickSearchTag._();

  factory GAppTimelineRowNodeFieldsData_tags__asQuickSearchTag(
      [Function(GAppTimelineRowNodeFieldsData_tags__asQuickSearchTagBuilder b)
          updates]) = _$GAppTimelineRowNodeFieldsData_tags__asQuickSearchTag;

  static void _initializeBuilder(
          GAppTimelineRowNodeFieldsData_tags__asQuickSearchTagBuilder b) =>
      b..G__typename = 'QuickSearchTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  static Serializer<GAppTimelineRowNodeFieldsData_tags__asQuickSearchTag>
      get serializer =>
          _$gAppTimelineRowNodeFieldsDataTagsAsQuickSearchTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAppTimelineRowNodeFieldsData_tags__asQuickSearchTag.serializer, this)
      as Map<String, dynamic>);
  static GAppTimelineRowNodeFieldsData_tags__asQuickSearchTag? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTimelineRowNodeFieldsData_tags__asQuickSearchTag.serializer,
          json);
}

abstract class GAppTimelineRowNodeFieldsData_tags__asTextTag
    implements
        Built<GAppTimelineRowNodeFieldsData_tags__asTextTag,
            GAppTimelineRowNodeFieldsData_tags__asTextTagBuilder>,
        GAppTimelineRowNodeFieldsData_tags,
        _i5.GTextTagFields {
  GAppTimelineRowNodeFieldsData_tags__asTextTag._();

  factory GAppTimelineRowNodeFieldsData_tags__asTextTag(
      [Function(GAppTimelineRowNodeFieldsData_tags__asTextTagBuilder b)
          updates]) = _$GAppTimelineRowNodeFieldsData_tags__asTextTag;

  static void _initializeBuilder(
          GAppTimelineRowNodeFieldsData_tags__asTextTagBuilder b) =>
      b..G__typename = 'TextTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get name;
  GAppTimelineRowNodeFieldsData_tags__asTextTag_action? get action;
  static Serializer<GAppTimelineRowNodeFieldsData_tags__asTextTag>
      get serializer => _$gAppTimelineRowNodeFieldsDataTagsAsTextTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAppTimelineRowNodeFieldsData_tags__asTextTag.serializer, this)
      as Map<String, dynamic>);
  static GAppTimelineRowNodeFieldsData_tags__asTextTag? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTimelineRowNodeFieldsData_tags__asTextTag.serializer, json);
}

abstract class GAppTimelineRowNodeFieldsData_tags__asTextTag_action
    implements
        Built<GAppTimelineRowNodeFieldsData_tags__asTextTag_action,
            GAppTimelineRowNodeFieldsData_tags__asTextTag_actionBuilder>,
        _i5.GTextTagFields_action {
  GAppTimelineRowNodeFieldsData_tags__asTextTag_action._();

  factory GAppTimelineRowNodeFieldsData_tags__asTextTag_action(
      [Function(GAppTimelineRowNodeFieldsData_tags__asTextTag_actionBuilder b)
          updates]) = _$GAppTimelineRowNodeFieldsData_tags__asTextTag_action;

  static void _initializeBuilder(
          GAppTimelineRowNodeFieldsData_tags__asTextTag_actionBuilder b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  _i2.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  static Serializer<GAppTimelineRowNodeFieldsData_tags__asTextTag_action>
      get serializer =>
          _$gAppTimelineRowNodeFieldsDataTagsAsTextTagActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAppTimelineRowNodeFieldsData_tags__asTextTag_action.serializer, this)
      as Map<String, dynamic>);
  static GAppTimelineRowNodeFieldsData_tags__asTextTag_action? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTimelineRowNodeFieldsData_tags__asTextTag_action.serializer,
          json);
}

abstract class GAppTimelineRowNodeFieldsData_tags__asRiskTag
    implements
        Built<GAppTimelineRowNodeFieldsData_tags__asRiskTag,
            GAppTimelineRowNodeFieldsData_tags__asRiskTagBuilder>,
        GAppTimelineRowNodeFieldsData_tags,
        _i5.GRiskTagFields {
  GAppTimelineRowNodeFieldsData_tags__asRiskTag._();

  factory GAppTimelineRowNodeFieldsData_tags__asRiskTag(
      [Function(GAppTimelineRowNodeFieldsData_tags__asRiskTagBuilder b)
          updates]) = _$GAppTimelineRowNodeFieldsData_tags__asRiskTag;

  static void _initializeBuilder(
          GAppTimelineRowNodeFieldsData_tags__asRiskTagBuilder b) =>
      b..G__typename = 'RiskTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get level;
  static Serializer<GAppTimelineRowNodeFieldsData_tags__asRiskTag>
      get serializer => _$gAppTimelineRowNodeFieldsDataTagsAsRiskTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAppTimelineRowNodeFieldsData_tags__asRiskTag.serializer, this)
      as Map<String, dynamic>);
  static GAppTimelineRowNodeFieldsData_tags__asRiskTag? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAppTimelineRowNodeFieldsData_tags__asRiskTag.serializer, json);
}
