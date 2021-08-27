// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'tags_fragment.var.gql.g.dart';

abstract class GTextTagFieldsVars
    implements Built<GTextTagFieldsVars, GTextTagFieldsVarsBuilder> {
  GTextTagFieldsVars._();

  factory GTextTagFieldsVars([Function(GTextTagFieldsVarsBuilder b) updates]) =
      _$GTextTagFieldsVars;

  static Serializer<GTextTagFieldsVars> get serializer =>
      _$gTextTagFieldsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GTextTagFieldsVars.serializer, this)
          as Map<String, dynamic>);
  static GTextTagFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GTextTagFieldsVars.serializer, json);
}

abstract class GRiskTagFieldsVars
    implements Built<GRiskTagFieldsVars, GRiskTagFieldsVarsBuilder> {
  GRiskTagFieldsVars._();

  factory GRiskTagFieldsVars([Function(GRiskTagFieldsVarsBuilder b) updates]) =
      _$GRiskTagFieldsVars;

  static Serializer<GRiskTagFieldsVars> get serializer =>
      _$gRiskTagFieldsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GRiskTagFieldsVars.serializer, this)
          as Map<String, dynamic>);
  static GRiskTagFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GRiskTagFieldsVars.serializer, json);
}

abstract class GQuickSearchTagFieldsVars
    implements
        Built<GQuickSearchTagFieldsVars, GQuickSearchTagFieldsVarsBuilder> {
  GQuickSearchTagFieldsVars._();

  factory GQuickSearchTagFieldsVars(
          [Function(GQuickSearchTagFieldsVarsBuilder b) updates]) =
      _$GQuickSearchTagFieldsVars;

  static Serializer<GQuickSearchTagFieldsVars> get serializer =>
      _$gQuickSearchTagFieldsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GQuickSearchTagFieldsVars.serializer, this)
          as Map<String, dynamic>);
  static GQuickSearchTagFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GQuickSearchTagFieldsVars.serializer, json);
}
