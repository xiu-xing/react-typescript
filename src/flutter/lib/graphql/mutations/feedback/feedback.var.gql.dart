// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'feedback.var.gql.g.dart';

abstract class GGiveFeedbackVars
    implements Built<GGiveFeedbackVars, GGiveFeedbackVarsBuilder> {
  GGiveFeedbackVars._();

  factory GGiveFeedbackVars([Function(GGiveFeedbackVarsBuilder b) updates]) =
      _$GGiveFeedbackVars;

  String get problemDescription;
  String? get phoneNumber;
  BuiltList<String>? get images;
  static Serializer<GGiveFeedbackVars> get serializer =>
      _$gGiveFeedbackVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GGiveFeedbackVars.serializer, this)
          as Map<String, dynamic>);
  static GGiveFeedbackVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GGiveFeedbackVars.serializer, json);
}
