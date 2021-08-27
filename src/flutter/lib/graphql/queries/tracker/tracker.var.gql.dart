// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i2;

part 'tracker.var.gql.g.dart';

abstract class GTrackerRecommendationsVars
    implements
        Built<GTrackerRecommendationsVars, GTrackerRecommendationsVarsBuilder> {
  GTrackerRecommendationsVars._();

  factory GTrackerRecommendationsVars(
          [Function(GTrackerRecommendationsVarsBuilder b) updates]) =
      _$GTrackerRecommendationsVars;

  _i1.GTrackerTheme get trackerTheme;
  static Serializer<GTrackerRecommendationsVars> get serializer =>
      _$gTrackerRecommendationsVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
      GTrackerRecommendationsVars.serializer, this) as Map<String, dynamic>);
  static GTrackerRecommendationsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers
          .deserializeWith(GTrackerRecommendationsVars.serializer, json);
}

abstract class GTrackedEntityCountVars
    implements Built<GTrackedEntityCountVars, GTrackedEntityCountVarsBuilder> {
  GTrackedEntityCountVars._();

  factory GTrackedEntityCountVars(
          [Function(GTrackedEntityCountVarsBuilder b) updates]) =
      _$GTrackedEntityCountVars;

  _i1.GTrackerTheme get trackerTheme;
  static Serializer<GTrackedEntityCountVars> get serializer =>
      _$gTrackedEntityCountVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GTrackedEntityCountVars.serializer, this)
          as Map<String, dynamic>);
  static GTrackedEntityCountVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GTrackedEntityCountVars.serializer, json);
}

abstract class GAppTrackerTimelineVars
    implements Built<GAppTrackerTimelineVars, GAppTrackerTimelineVarsBuilder> {
  GAppTrackerTimelineVars._();

  factory GAppTrackerTimelineVars(
          [Function(GAppTrackerTimelineVarsBuilder b) updates]) =
      _$GAppTrackerTimelineVars;

  String get timelineID;
  int? get first;
  String? get after;
  int? get last;
  String? get before;
  _i1.GTrackerTheme get trackerTheme;
  _i1.GFilterInputs? get filters;
  static Serializer<GAppTrackerTimelineVars> get serializer =>
      _$gAppTrackerTimelineVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GAppTrackerTimelineVars.serializer, this)
          as Map<String, dynamic>);
  static GAppTrackerTimelineVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GAppTrackerTimelineVars.serializer, json);
}

abstract class GAppTrackerTabsVars
    implements Built<GAppTrackerTabsVars, GAppTrackerTabsVarsBuilder> {
  GAppTrackerTabsVars._();

  factory GAppTrackerTabsVars(
      [Function(GAppTrackerTabsVarsBuilder b) updates]) = _$GAppTrackerTabsVars;

  _i1.GTrackerTheme get trackerTheme;
  static Serializer<GAppTrackerTabsVars> get serializer =>
      _$gAppTrackerTabsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GAppTrackerTabsVars.serializer, this)
          as Map<String, dynamic>);
  static GAppTrackerTabsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GAppTrackerTabsVars.serializer, json);
}

abstract class GTrackTagsVars
    implements Built<GTrackTagsVars, GTrackTagsVarsBuilder> {
  GTrackTagsVars._();

  factory GTrackTagsVars([Function(GTrackTagsVarsBuilder b) updates]) =
      _$GTrackTagsVars;

  _i1.GTrackerTheme get trackerTheme;
  static Serializer<GTrackTagsVars> get serializer =>
      _$gTrackTagsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GTrackTagsVars.serializer, this)
          as Map<String, dynamic>);
  static GTrackTagsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GTrackTagsVars.serializer, json);
}

abstract class GTrackedEntitiesVars
    implements Built<GTrackedEntitiesVars, GTrackedEntitiesVarsBuilder> {
  GTrackedEntitiesVars._();

  factory GTrackedEntitiesVars(
          [Function(GTrackedEntitiesVarsBuilder b) updates]) =
      _$GTrackedEntitiesVars;

  _i1.GTrackerTheme get trackerTheme;
  int? get first;
  String? get after;
  static Serializer<GTrackedEntitiesVars> get serializer =>
      _$gTrackedEntitiesVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GTrackedEntitiesVars.serializer, this)
          as Map<String, dynamic>);
  static GTrackedEntitiesVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GTrackedEntitiesVars.serializer, json);
}

abstract class GTrackableThemeVars
    implements Built<GTrackableThemeVars, GTrackableThemeVarsBuilder> {
  GTrackableThemeVars._();

  factory GTrackableThemeVars(
      [Function(GTrackableThemeVarsBuilder b) updates]) = _$GTrackableThemeVars;

  String get entityID;
  _i1.GEntityType get entityType;
  static Serializer<GTrackableThemeVars> get serializer =>
      _$gTrackableThemeVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GTrackableThemeVars.serializer, this)
          as Map<String, dynamic>);
  static GTrackableThemeVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GTrackableThemeVars.serializer, json);
}

abstract class GAppTimelineRowNodeFieldsVars
    implements
        Built<GAppTimelineRowNodeFieldsVars,
            GAppTimelineRowNodeFieldsVarsBuilder> {
  GAppTimelineRowNodeFieldsVars._();

  factory GAppTimelineRowNodeFieldsVars(
          [Function(GAppTimelineRowNodeFieldsVarsBuilder b) updates]) =
      _$GAppTimelineRowNodeFieldsVars;

  static Serializer<GAppTimelineRowNodeFieldsVars> get serializer =>
      _$gAppTimelineRowNodeFieldsVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
      GAppTimelineRowNodeFieldsVars.serializer, this) as Map<String, dynamic>);
  static GAppTimelineRowNodeFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers
          .deserializeWith(GAppTimelineRowNodeFieldsVars.serializer, json);
}
