// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i2;

part 'tracker.var.gql.g.dart';

abstract class GTrackEntityVars
    implements Built<GTrackEntityVars, GTrackEntityVarsBuilder> {
  GTrackEntityVars._();

  factory GTrackEntityVars([Function(GTrackEntityVarsBuilder b) updates]) =
      _$GTrackEntityVars;

  _i1.GTrackerTheme get trackerTheme;
  BuiltList<_i1.GEntityInput> get entities;
  static Serializer<GTrackEntityVars> get serializer =>
      _$gTrackEntityVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GTrackEntityVars.serializer, this)
          as Map<String, dynamic>);
  static GTrackEntityVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GTrackEntityVars.serializer, json);
}

abstract class GUnTrackEntityByEntityIDVars
    implements
        Built<GUnTrackEntityByEntityIDVars,
            GUnTrackEntityByEntityIDVarsBuilder> {
  GUnTrackEntityByEntityIDVars._();

  factory GUnTrackEntityByEntityIDVars(
          [Function(GUnTrackEntityByEntityIDVarsBuilder b) updates]) =
      _$GUnTrackEntityByEntityIDVars;

  _i1.GEntityInput get entity;
  static Serializer<GUnTrackEntityByEntityIDVars> get serializer =>
      _$gUnTrackEntityByEntityIDVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
      GUnTrackEntityByEntityIDVars.serializer, this) as Map<String, dynamic>);
  static GUnTrackEntityByEntityIDVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers
          .deserializeWith(GUnTrackEntityByEntityIDVars.serializer, json);
}
