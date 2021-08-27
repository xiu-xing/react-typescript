// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'entity_fragment.var.gql.g.dart';

abstract class GEntityFieldsVars
    implements Built<GEntityFieldsVars, GEntityFieldsVarsBuilder> {
  GEntityFieldsVars._();

  factory GEntityFieldsVars([Function(GEntityFieldsVarsBuilder b) updates]) =
      _$GEntityFieldsVars;

  static Serializer<GEntityFieldsVars> get serializer =>
      _$gEntityFieldsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GEntityFieldsVars.serializer, this)
          as Map<String, dynamic>);
  static GEntityFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GEntityFieldsVars.serializer, json);
}
