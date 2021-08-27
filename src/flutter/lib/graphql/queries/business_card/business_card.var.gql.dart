// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'business_card.var.gql.g.dart';

abstract class GBusinessCardDetailVars
    implements Built<GBusinessCardDetailVars, GBusinessCardDetailVarsBuilder> {
  GBusinessCardDetailVars._();

  factory GBusinessCardDetailVars(
          [Function(GBusinessCardDetailVarsBuilder b) updates]) =
      _$GBusinessCardDetailVars;

  static Serializer<GBusinessCardDetailVars> get serializer =>
      _$gBusinessCardDetailVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GBusinessCardDetailVars.serializer, this)
          as Map<String, dynamic>);
  static GBusinessCardDetailVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GBusinessCardDetailVars.serializer, json);
}
