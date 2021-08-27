// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'quick_search_fragment.var.gql.g.dart';

abstract class GQuickSearchEntityNodeFieldsVars
    implements
        Built<GQuickSearchEntityNodeFieldsVars,
            GQuickSearchEntityNodeFieldsVarsBuilder> {
  GQuickSearchEntityNodeFieldsVars._();

  factory GQuickSearchEntityNodeFieldsVars(
          [Function(GQuickSearchEntityNodeFieldsVarsBuilder b) updates]) =
      _$GQuickSearchEntityNodeFieldsVars;

  static Serializer<GQuickSearchEntityNodeFieldsVars> get serializer =>
      _$gQuickSearchEntityNodeFieldsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GQuickSearchEntityNodeFieldsVars.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchEntityNodeFieldsVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GQuickSearchEntityNodeFieldsVars.serializer, json);
}

abstract class GQuickSearchInfoFlowNodeFieldsVars
    implements
        Built<GQuickSearchInfoFlowNodeFieldsVars,
            GQuickSearchInfoFlowNodeFieldsVarsBuilder> {
  GQuickSearchInfoFlowNodeFieldsVars._();

  factory GQuickSearchInfoFlowNodeFieldsVars(
          [Function(GQuickSearchInfoFlowNodeFieldsVarsBuilder b) updates]) =
      _$GQuickSearchInfoFlowNodeFieldsVars;

  static Serializer<GQuickSearchInfoFlowNodeFieldsVars> get serializer =>
      _$gQuickSearchInfoFlowNodeFieldsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GQuickSearchInfoFlowNodeFieldsVars.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchInfoFlowNodeFieldsVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GQuickSearchInfoFlowNodeFieldsVars.serializer, json);
}
