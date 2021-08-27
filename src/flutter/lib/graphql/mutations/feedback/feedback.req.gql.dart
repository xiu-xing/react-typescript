// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/mutations/feedback/feedback.ast.gql.dart'
    as _i5;
import 'package:rime_app/graphql/mutations/feedback/feedback.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/mutations/feedback/feedback.var.gql.dart'
    as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'feedback.req.gql.g.dart';

abstract class GGiveFeedbackReq
    implements
        Built<GGiveFeedbackReq, GGiveFeedbackReqBuilder>,
        _i1.OperationRequest<_i2.GGiveFeedbackData, _i3.GGiveFeedbackVars> {
  GGiveFeedbackReq._();

  factory GGiveFeedbackReq([Function(GGiveFeedbackReqBuilder b) updates]) =
      _$GGiveFeedbackReq;

  static void _initializeBuilder(GGiveFeedbackReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'GiveFeedback')
    ..executeOnListen = true;
  _i3.GGiveFeedbackVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GGiveFeedbackData? Function(
      _i2.GGiveFeedbackData?, _i2.GGiveFeedbackData?)? get updateResult;
  _i2.GGiveFeedbackData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GGiveFeedbackData? parseData(Map<String, dynamic> json) =>
      _i2.GGiveFeedbackData.fromJson(json);
  static Serializer<GGiveFeedbackReq> get serializer =>
      _$gGiveFeedbackReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GGiveFeedbackReq.serializer, this)
          as Map<String, dynamic>);
  static GGiveFeedbackReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GGiveFeedbackReq.serializer, json);
}
