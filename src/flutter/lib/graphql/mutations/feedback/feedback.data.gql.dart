// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'feedback.data.gql.g.dart';

abstract class GGiveFeedbackData
    implements Built<GGiveFeedbackData, GGiveFeedbackDataBuilder> {
  GGiveFeedbackData._();

  factory GGiveFeedbackData([Function(GGiveFeedbackDataBuilder b) updates]) =
      _$GGiveFeedbackData;

  static void _initializeBuilder(GGiveFeedbackDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get giveFeedback;
  static Serializer<GGiveFeedbackData> get serializer =>
      _$gGiveFeedbackDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GGiveFeedbackData.serializer, this)
          as Map<String, dynamic>);
  static GGiveFeedbackData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GGiveFeedbackData.serializer, json);
}
