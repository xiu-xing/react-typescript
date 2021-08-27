// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/queries/tracker/tracker.ast.gql.dart' as _i5;
import 'package:rime_app/graphql/queries/tracker/tracker.data.gql.dart' as _i2;
import 'package:rime_app/graphql/queries/tracker/tracker.var.gql.dart' as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'tracker.req.gql.g.dart';

abstract class GTrackerRecommendationsReq
    implements
        Built<GTrackerRecommendationsReq, GTrackerRecommendationsReqBuilder>,
        _i1.OperationRequest<_i2.GTrackerRecommendationsData,
            _i3.GTrackerRecommendationsVars> {
  GTrackerRecommendationsReq._();

  factory GTrackerRecommendationsReq(
          [Function(GTrackerRecommendationsReqBuilder b) updates]) =
      _$GTrackerRecommendationsReq;

  static void _initializeBuilder(GTrackerRecommendationsReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'TrackerRecommendations')
    ..executeOnListen = true;
  _i3.GTrackerRecommendationsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GTrackerRecommendationsData? Function(
          _i2.GTrackerRecommendationsData?, _i2.GTrackerRecommendationsData?)?
      get updateResult;
  _i2.GTrackerRecommendationsData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GTrackerRecommendationsData? parseData(Map<String, dynamic> json) =>
      _i2.GTrackerRecommendationsData.fromJson(json);
  static Serializer<GTrackerRecommendationsReq> get serializer =>
      _$gTrackerRecommendationsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
      GTrackerRecommendationsReq.serializer, this) as Map<String, dynamic>);
  static GTrackerRecommendationsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GTrackerRecommendationsReq.serializer, json);
}

abstract class GTrackedEntityCountReq
    implements
        Built<GTrackedEntityCountReq, GTrackedEntityCountReqBuilder>,
        _i1.OperationRequest<_i2.GTrackedEntityCountData,
            _i3.GTrackedEntityCountVars> {
  GTrackedEntityCountReq._();

  factory GTrackedEntityCountReq(
          [Function(GTrackedEntityCountReqBuilder b) updates]) =
      _$GTrackedEntityCountReq;

  static void _initializeBuilder(GTrackedEntityCountReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'TrackedEntityCount')
    ..executeOnListen = true;
  _i3.GTrackedEntityCountVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GTrackedEntityCountData? Function(
          _i2.GTrackedEntityCountData?, _i2.GTrackedEntityCountData?)?
      get updateResult;
  _i2.GTrackedEntityCountData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GTrackedEntityCountData? parseData(Map<String, dynamic> json) =>
      _i2.GTrackedEntityCountData.fromJson(json);
  static Serializer<GTrackedEntityCountReq> get serializer =>
      _$gTrackedEntityCountReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GTrackedEntityCountReq.serializer, this)
          as Map<String, dynamic>);
  static GTrackedEntityCountReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GTrackedEntityCountReq.serializer, json);
}

abstract class GAppTrackerTimelineReq
    implements
        Built<GAppTrackerTimelineReq, GAppTrackerTimelineReqBuilder>,
        _i1.OperationRequest<_i2.GAppTrackerTimelineData,
            _i3.GAppTrackerTimelineVars> {
  GAppTrackerTimelineReq._();

  factory GAppTrackerTimelineReq(
          [Function(GAppTrackerTimelineReqBuilder b) updates]) =
      _$GAppTrackerTimelineReq;

  static void _initializeBuilder(GAppTrackerTimelineReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'AppTrackerTimeline')
    ..executeOnListen = true;
  _i3.GAppTrackerTimelineVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GAppTrackerTimelineData? Function(
          _i2.GAppTrackerTimelineData?, _i2.GAppTrackerTimelineData?)?
      get updateResult;
  _i2.GAppTrackerTimelineData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GAppTrackerTimelineData? parseData(Map<String, dynamic> json) =>
      _i2.GAppTrackerTimelineData.fromJson(json);
  static Serializer<GAppTrackerTimelineReq> get serializer =>
      _$gAppTrackerTimelineReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GAppTrackerTimelineReq.serializer, this)
          as Map<String, dynamic>);
  static GAppTrackerTimelineReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GAppTrackerTimelineReq.serializer, json);
}

abstract class GAppTrackerTabsReq
    implements
        Built<GAppTrackerTabsReq, GAppTrackerTabsReqBuilder>,
        _i1.OperationRequest<_i2.GAppTrackerTabsData, _i3.GAppTrackerTabsVars> {
  GAppTrackerTabsReq._();

  factory GAppTrackerTabsReq([Function(GAppTrackerTabsReqBuilder b) updates]) =
      _$GAppTrackerTabsReq;

  static void _initializeBuilder(GAppTrackerTabsReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'AppTrackerTabs')
    ..executeOnListen = true;
  _i3.GAppTrackerTabsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GAppTrackerTabsData? Function(
      _i2.GAppTrackerTabsData?, _i2.GAppTrackerTabsData?)? get updateResult;
  _i2.GAppTrackerTabsData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GAppTrackerTabsData? parseData(Map<String, dynamic> json) =>
      _i2.GAppTrackerTabsData.fromJson(json);
  static Serializer<GAppTrackerTabsReq> get serializer =>
      _$gAppTrackerTabsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GAppTrackerTabsReq.serializer, this)
          as Map<String, dynamic>);
  static GAppTrackerTabsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GAppTrackerTabsReq.serializer, json);
}

abstract class GTrackTagsReq
    implements
        Built<GTrackTagsReq, GTrackTagsReqBuilder>,
        _i1.OperationRequest<_i2.GTrackTagsData, _i3.GTrackTagsVars> {
  GTrackTagsReq._();

  factory GTrackTagsReq([Function(GTrackTagsReqBuilder b) updates]) =
      _$GTrackTagsReq;

  static void _initializeBuilder(GTrackTagsReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'TrackTags')
    ..executeOnListen = true;
  _i3.GTrackTagsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GTrackTagsData? Function(_i2.GTrackTagsData?, _i2.GTrackTagsData?)?
      get updateResult;
  _i2.GTrackTagsData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GTrackTagsData? parseData(Map<String, dynamic> json) =>
      _i2.GTrackTagsData.fromJson(json);
  static Serializer<GTrackTagsReq> get serializer => _$gTrackTagsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GTrackTagsReq.serializer, this)
          as Map<String, dynamic>);
  static GTrackTagsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GTrackTagsReq.serializer, json);
}

abstract class GTrackedEntitiesReq
    implements
        Built<GTrackedEntitiesReq, GTrackedEntitiesReqBuilder>,
        _i1.OperationRequest<_i2.GTrackedEntitiesData,
            _i3.GTrackedEntitiesVars> {
  GTrackedEntitiesReq._();

  factory GTrackedEntitiesReq(
      [Function(GTrackedEntitiesReqBuilder b) updates]) = _$GTrackedEntitiesReq;

  static void _initializeBuilder(GTrackedEntitiesReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'TrackedEntities')
    ..executeOnListen = true;
  _i3.GTrackedEntitiesVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GTrackedEntitiesData? Function(
      _i2.GTrackedEntitiesData?, _i2.GTrackedEntitiesData?)? get updateResult;
  _i2.GTrackedEntitiesData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GTrackedEntitiesData? parseData(Map<String, dynamic> json) =>
      _i2.GTrackedEntitiesData.fromJson(json);
  static Serializer<GTrackedEntitiesReq> get serializer =>
      _$gTrackedEntitiesReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GTrackedEntitiesReq.serializer, this)
          as Map<String, dynamic>);
  static GTrackedEntitiesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GTrackedEntitiesReq.serializer, json);
}

abstract class GTrackableThemeReq
    implements
        Built<GTrackableThemeReq, GTrackableThemeReqBuilder>,
        _i1.OperationRequest<_i2.GTrackableThemeData, _i3.GTrackableThemeVars> {
  GTrackableThemeReq._();

  factory GTrackableThemeReq([Function(GTrackableThemeReqBuilder b) updates]) =
      _$GTrackableThemeReq;

  static void _initializeBuilder(GTrackableThemeReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'TrackableTheme')
    ..executeOnListen = true;
  _i3.GTrackableThemeVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GTrackableThemeData? Function(
      _i2.GTrackableThemeData?, _i2.GTrackableThemeData?)? get updateResult;
  _i2.GTrackableThemeData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GTrackableThemeData? parseData(Map<String, dynamic> json) =>
      _i2.GTrackableThemeData.fromJson(json);
  static Serializer<GTrackableThemeReq> get serializer =>
      _$gTrackableThemeReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GTrackableThemeReq.serializer, this)
          as Map<String, dynamic>);
  static GTrackableThemeReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GTrackableThemeReq.serializer, json);
}

abstract class GAppTimelineRowNodeFieldsReq
    implements
        Built<GAppTimelineRowNodeFieldsReq,
            GAppTimelineRowNodeFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GAppTimelineRowNodeFieldsData,
            _i3.GAppTimelineRowNodeFieldsVars> {
  GAppTimelineRowNodeFieldsReq._();

  factory GAppTimelineRowNodeFieldsReq(
          [Function(GAppTimelineRowNodeFieldsReqBuilder b) updates]) =
      _$GAppTimelineRowNodeFieldsReq;

  static void _initializeBuilder(GAppTimelineRowNodeFieldsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'AppTimelineRowNodeFields';
  _i3.GAppTimelineRowNodeFieldsVars get vars;
  _i7.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GAppTimelineRowNodeFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GAppTimelineRowNodeFieldsData.fromJson(json);
  static Serializer<GAppTimelineRowNodeFieldsReq> get serializer =>
      _$gAppTimelineRowNodeFieldsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
      GAppTimelineRowNodeFieldsReq.serializer, this) as Map<String, dynamic>);
  static GAppTimelineRowNodeFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GAppTimelineRowNodeFieldsReq.serializer, json);
}
