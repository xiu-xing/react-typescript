// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/mutations/business_card/business_card.ast.gql.dart'
    as _i5;
import 'package:rime_app/graphql/mutations/business_card/business_card.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/mutations/business_card/business_card.var.gql.dart'
    as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'business_card.req.gql.g.dart';

abstract class GCreateBusinessCardApprovalTicketReq
    implements
        Built<GCreateBusinessCardApprovalTicketReq,
            GCreateBusinessCardApprovalTicketReqBuilder>,
        _i1.OperationRequest<_i2.GCreateBusinessCardApprovalTicketData,
            _i3.GCreateBusinessCardApprovalTicketVars> {
  GCreateBusinessCardApprovalTicketReq._();

  factory GCreateBusinessCardApprovalTicketReq(
          [Function(GCreateBusinessCardApprovalTicketReqBuilder b) updates]) =
      _$GCreateBusinessCardApprovalTicketReq;

  static void _initializeBuilder(
          GCreateBusinessCardApprovalTicketReqBuilder b) =>
      b
        ..operation = _i4.Operation(
            document: _i5.document,
            operationName: 'CreateBusinessCardApprovalTicket')
        ..executeOnListen = true;
  _i3.GCreateBusinessCardApprovalTicketVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GCreateBusinessCardApprovalTicketData? Function(
      _i2.GCreateBusinessCardApprovalTicketData?,
      _i2.GCreateBusinessCardApprovalTicketData?)? get updateResult;
  _i2.GCreateBusinessCardApprovalTicketData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GCreateBusinessCardApprovalTicketData? parseData(
          Map<String, dynamic> json) =>
      _i2.GCreateBusinessCardApprovalTicketData.fromJson(json);
  static Serializer<GCreateBusinessCardApprovalTicketReq> get serializer =>
      _$gCreateBusinessCardApprovalTicketReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers
          .serializeWith(GCreateBusinessCardApprovalTicketReq.serializer, this)
      as Map<String, dynamic>);
  static GCreateBusinessCardApprovalTicketReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
          GCreateBusinessCardApprovalTicketReq.serializer, json);
}

abstract class GCreateVerificationCodeReq
    implements
        Built<GCreateVerificationCodeReq, GCreateVerificationCodeReqBuilder>,
        _i1.OperationRequest<_i2.GCreateVerificationCodeData,
            _i3.GCreateVerificationCodeVars> {
  GCreateVerificationCodeReq._();

  factory GCreateVerificationCodeReq(
          [Function(GCreateVerificationCodeReqBuilder b) updates]) =
      _$GCreateVerificationCodeReq;

  static void _initializeBuilder(GCreateVerificationCodeReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'CreateVerificationCode')
    ..executeOnListen = true;
  _i3.GCreateVerificationCodeVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GCreateVerificationCodeData? Function(
          _i2.GCreateVerificationCodeData?, _i2.GCreateVerificationCodeData?)?
      get updateResult;
  _i2.GCreateVerificationCodeData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GCreateVerificationCodeData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateVerificationCodeData.fromJson(json);
  static Serializer<GCreateVerificationCodeReq> get serializer =>
      _$gCreateVerificationCodeReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
      GCreateVerificationCodeReq.serializer, this) as Map<String, dynamic>);
  static GCreateVerificationCodeReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GCreateVerificationCodeReq.serializer, json);
}

abstract class GVerifyCodeAndApproveJoinRequestReq
    implements
        Built<GVerifyCodeAndApproveJoinRequestReq,
            GVerifyCodeAndApproveJoinRequestReqBuilder>,
        _i1.OperationRequest<_i2.GVerifyCodeAndApproveJoinRequestData,
            _i3.GVerifyCodeAndApproveJoinRequestVars> {
  GVerifyCodeAndApproveJoinRequestReq._();

  factory GVerifyCodeAndApproveJoinRequestReq(
          [Function(GVerifyCodeAndApproveJoinRequestReqBuilder b) updates]) =
      _$GVerifyCodeAndApproveJoinRequestReq;

  static void _initializeBuilder(
          GVerifyCodeAndApproveJoinRequestReqBuilder b) =>
      b
        ..operation = _i4.Operation(
            document: _i5.document,
            operationName: 'VerifyCodeAndApproveJoinRequest')
        ..executeOnListen = true;
  _i3.GVerifyCodeAndApproveJoinRequestVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GVerifyCodeAndApproveJoinRequestData? Function(
      _i2.GVerifyCodeAndApproveJoinRequestData?,
      _i2.GVerifyCodeAndApproveJoinRequestData?)? get updateResult;
  _i2.GVerifyCodeAndApproveJoinRequestData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GVerifyCodeAndApproveJoinRequestData? parseData(
          Map<String, dynamic> json) =>
      _i2.GVerifyCodeAndApproveJoinRequestData.fromJson(json);
  static Serializer<GVerifyCodeAndApproveJoinRequestReq> get serializer =>
      _$gVerifyCodeAndApproveJoinRequestReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers
          .serializeWith(GVerifyCodeAndApproveJoinRequestReq.serializer, this)
      as Map<String, dynamic>);
  static GVerifyCodeAndApproveJoinRequestReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
          GVerifyCodeAndApproveJoinRequestReq.serializer, json);
}

abstract class GCreateVerificationCodeByJoinRequestReq
    implements
        Built<GCreateVerificationCodeByJoinRequestReq,
            GCreateVerificationCodeByJoinRequestReqBuilder>,
        _i1.OperationRequest<_i2.GCreateVerificationCodeByJoinRequestData,
            _i3.GCreateVerificationCodeByJoinRequestVars> {
  GCreateVerificationCodeByJoinRequestReq._();

  factory GCreateVerificationCodeByJoinRequestReq(
      [Function(GCreateVerificationCodeByJoinRequestReqBuilder b)
          updates]) = _$GCreateVerificationCodeByJoinRequestReq;

  static void _initializeBuilder(
          GCreateVerificationCodeByJoinRequestReqBuilder b) =>
      b
        ..operation = _i4.Operation(
            document: _i5.document,
            operationName: 'CreateVerificationCodeByJoinRequest')
        ..executeOnListen = true;
  _i3.GCreateVerificationCodeByJoinRequestVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GCreateVerificationCodeByJoinRequestData? Function(
      _i2.GCreateVerificationCodeByJoinRequestData?,
      _i2.GCreateVerificationCodeByJoinRequestData?)? get updateResult;
  _i2.GCreateVerificationCodeByJoinRequestData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GCreateVerificationCodeByJoinRequestData? parseData(
          Map<String, dynamic> json) =>
      _i2.GCreateVerificationCodeByJoinRequestData.fromJson(json);
  static Serializer<GCreateVerificationCodeByJoinRequestReq> get serializer =>
      _$gCreateVerificationCodeByJoinRequestReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
          GCreateVerificationCodeByJoinRequestReq.serializer, this)
      as Map<String, dynamic>);
  static GCreateVerificationCodeByJoinRequestReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
          GCreateVerificationCodeByJoinRequestReq.serializer, json);
}
