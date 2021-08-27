// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i2;

part 'news_list.var.gql.g.dart';

abstract class GNewsListVars
    implements Built<GNewsListVars, GNewsListVarsBuilder> {
  GNewsListVars._();

  factory GNewsListVars([Function(GNewsListVarsBuilder b) updates]) =
      _$GNewsListVars;

  int? get first;
  String? get after;
  BuiltList<String>? get keywords;
  BuiltList<_i1.GEntityInput> get entities;
  String? get startTime;
  String? get endTime;
  static Serializer<GNewsListVars> get serializer => _$gNewsListVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GNewsListVars.serializer, this)
          as Map<String, dynamic>);
  static GNewsListVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GNewsListVars.serializer, json);
}
