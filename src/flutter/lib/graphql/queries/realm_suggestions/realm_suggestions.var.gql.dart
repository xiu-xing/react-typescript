// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'realm_suggestions.var.gql.g.dart';

abstract class GRealmSuggestionsVars
    implements Built<GRealmSuggestionsVars, GRealmSuggestionsVarsBuilder> {
  GRealmSuggestionsVars._();

  factory GRealmSuggestionsVars(
          [Function(GRealmSuggestionsVarsBuilder b) updates]) =
      _$GRealmSuggestionsVars;

  int? get first;
  int? get last;
  String? get after;
  String? get before;
  String get suggestionId;
  String get query;
  static Serializer<GRealmSuggestionsVars> get serializer =>
      _$gRealmSuggestionsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GRealmSuggestionsVars.serializer, this)
          as Map<String, dynamic>);
  static GRealmSuggestionsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GRealmSuggestionsVars.serializer, json);
}
