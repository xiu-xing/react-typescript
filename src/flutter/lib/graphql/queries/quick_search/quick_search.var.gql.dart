// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'quick_search.var.gql.g.dart';

abstract class GQuickSearchTrendingVars
    implements
        Built<GQuickSearchTrendingVars, GQuickSearchTrendingVarsBuilder> {
  GQuickSearchTrendingVars._();

  factory GQuickSearchTrendingVars(
          [Function(GQuickSearchTrendingVarsBuilder b) updates]) =
      _$GQuickSearchTrendingVars;

  int? get first;
  int? get last;
  String? get after;
  String? get before;
  static Serializer<GQuickSearchTrendingVars> get serializer =>
      _$gQuickSearchTrendingVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GQuickSearchTrendingVars.serializer, this)
          as Map<String, dynamic>);
  static GQuickSearchTrendingVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GQuickSearchTrendingVars.serializer, json);
}

abstract class GQuickSearchLatestViewVars
    implements
        Built<GQuickSearchLatestViewVars, GQuickSearchLatestViewVarsBuilder> {
  GQuickSearchLatestViewVars._();

  factory GQuickSearchLatestViewVars(
          [Function(GQuickSearchLatestViewVarsBuilder b) updates]) =
      _$GQuickSearchLatestViewVars;

  int? get first;
  int? get last;
  String? get after;
  String? get before;
  static Serializer<GQuickSearchLatestViewVars> get serializer =>
      _$gQuickSearchLatestViewVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQuickSearchLatestViewVars.serializer, this) as Map<String, dynamic>);
  static GQuickSearchLatestViewVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GQuickSearchLatestViewVars.serializer, json);
}

abstract class GQuickSearchTabsVars
    implements Built<GQuickSearchTabsVars, GQuickSearchTabsVarsBuilder> {
  GQuickSearchTabsVars._();

  factory GQuickSearchTabsVars(
          [Function(GQuickSearchTabsVarsBuilder b) updates]) =
      _$GQuickSearchTabsVars;

  static Serializer<GQuickSearchTabsVars> get serializer =>
      _$gQuickSearchTabsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GQuickSearchTabsVars.serializer, this)
          as Map<String, dynamic>);
  static GQuickSearchTabsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GQuickSearchTabsVars.serializer, json);
}

abstract class GQuickSearchVars
    implements Built<GQuickSearchVars, GQuickSearchVarsBuilder> {
  GQuickSearchVars._();

  factory GQuickSearchVars([Function(GQuickSearchVarsBuilder b) updates]) =
      _$GQuickSearchVars;

  String get query;
  String get searchType;
  int? get first;
  int? get last;
  String? get after;
  String? get before;
  static Serializer<GQuickSearchVars> get serializer =>
      _$gQuickSearchVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GQuickSearchVars.serializer, this)
          as Map<String, dynamic>);
  static GQuickSearchVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GQuickSearchVars.serializer, json);
}

abstract class GIncrementEntityClickThroughVars
    implements
        Built<GIncrementEntityClickThroughVars,
            GIncrementEntityClickThroughVarsBuilder> {
  GIncrementEntityClickThroughVars._();

  factory GIncrementEntityClickThroughVars(
          [Function(GIncrementEntityClickThroughVarsBuilder b) updates]) =
      _$GIncrementEntityClickThroughVars;

  String get nodeId;
  String get searchType;
  static Serializer<GIncrementEntityClickThroughVars> get serializer =>
      _$gIncrementEntityClickThroughVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GIncrementEntityClickThroughVars.serializer, this)
      as Map<String, dynamic>);
  static GIncrementEntityClickThroughVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GIncrementEntityClickThroughVars.serializer, json);
}
