// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/queries/invitation/invitation.ast.gql.dart'
    as _i5;
import 'package:rime_app/graphql/queries/invitation/invitation.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/queries/invitation/invitation.var.gql.dart'
    as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'invitation.req.gql.g.dart';

abstract class GInvitationReq
    implements
        Built<GInvitationReq, GInvitationReqBuilder>,
        _i1.OperationRequest<_i2.GInvitationData, _i3.GInvitationVars> {
  GInvitationReq._();

  factory GInvitationReq([Function(GInvitationReqBuilder b) updates]) =
      _$GInvitationReq;

  static void _initializeBuilder(GInvitationReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'Invitation')
    ..executeOnListen = true;
  _i3.GInvitationVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GInvitationData? Function(_i2.GInvitationData?, _i2.GInvitationData?)?
      get updateResult;
  _i2.GInvitationData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GInvitationData? parseData(Map<String, dynamic> json) =>
      _i2.GInvitationData.fromJson(json);
  static Serializer<GInvitationReq> get serializer =>
      _$gInvitationReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GInvitationReq.serializer, this)
          as Map<String, dynamic>);
  static GInvitationReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GInvitationReq.serializer, json);
}

abstract class GInvitationDetailReq
    implements
        Built<GInvitationDetailReq, GInvitationDetailReqBuilder>,
        _i1.OperationRequest<_i2.GInvitationDetailData,
            _i3.GInvitationDetailVars> {
  GInvitationDetailReq._();

  factory GInvitationDetailReq(
          [Function(GInvitationDetailReqBuilder b) updates]) =
      _$GInvitationDetailReq;

  static void _initializeBuilder(GInvitationDetailReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'InvitationDetail')
    ..executeOnListen = true;
  _i3.GInvitationDetailVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GInvitationDetailData? Function(
      _i2.GInvitationDetailData?, _i2.GInvitationDetailData?)? get updateResult;
  _i2.GInvitationDetailData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GInvitationDetailData? parseData(Map<String, dynamic> json) =>
      _i2.GInvitationDetailData.fromJson(json);
  static Serializer<GInvitationDetailReq> get serializer =>
      _$gInvitationDetailReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GInvitationDetailReq.serializer, this)
          as Map<String, dynamic>);
  static GInvitationDetailReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GInvitationDetailReq.serializer, json);
}
