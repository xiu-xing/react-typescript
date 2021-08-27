// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'news_nodes_fragment.var.gql.g.dart';

abstract class GNewsFieldsVars
    implements Built<GNewsFieldsVars, GNewsFieldsVarsBuilder> {
  GNewsFieldsVars._();

  factory GNewsFieldsVars([Function(GNewsFieldsVarsBuilder b) updates]) =
      _$GNewsFieldsVars;

  static Serializer<GNewsFieldsVars> get serializer =>
      _$gNewsFieldsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GNewsFieldsVars.serializer, this)
          as Map<String, dynamic>);
  static GNewsFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GNewsFieldsVars.serializer, json);
}
