// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'team.var.gql.g.dart';

abstract class GTeamsVars implements Built<GTeamsVars, GTeamsVarsBuilder> {
  GTeamsVars._();

  factory GTeamsVars([Function(GTeamsVarsBuilder b) updates]) = _$GTeamsVars;

  static Serializer<GTeamsVars> get serializer => _$gTeamsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GTeamsVars.serializer, this)
          as Map<String, dynamic>);
  static GTeamsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GTeamsVars.serializer, json);
}

abstract class GIsEmailBindingRequiredVars
    implements
        Built<GIsEmailBindingRequiredVars, GIsEmailBindingRequiredVarsBuilder> {
  GIsEmailBindingRequiredVars._();

  factory GIsEmailBindingRequiredVars(
          [Function(GIsEmailBindingRequiredVarsBuilder b) updates]) =
      _$GIsEmailBindingRequiredVars;

  static Serializer<GIsEmailBindingRequiredVars> get serializer =>
      _$gIsEmailBindingRequiredVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GIsEmailBindingRequiredVars.serializer, this) as Map<String, dynamic>);
  static GIsEmailBindingRequiredVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GIsEmailBindingRequiredVars.serializer, json);
}
