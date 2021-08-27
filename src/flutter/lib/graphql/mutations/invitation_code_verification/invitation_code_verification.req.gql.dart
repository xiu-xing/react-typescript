// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/mutations/invitation_code_verification/invitation_code_verification.ast.gql.dart'
    as _i5;
import 'package:rime_app/graphql/mutations/invitation_code_verification/invitation_code_verification.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/mutations/invitation_code_verification/invitation_code_verification.var.gql.dart'
    as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'invitation_code_verification.req.gql.g.dart';

abstract class GInvitationCodeVerifyReq
    implements
        Built<GInvitationCodeVerifyReq, GInvitationCodeVerifyReqBuilder>,
        _i1.OperationRequest<_i2.GInvitationCodeVerifyData,
            _i3.GInvitationCodeVerifyVars> {
  GInvitationCodeVerifyReq._();

  factory GInvitationCodeVerifyReq(
          [Function(GInvitationCodeVerifyReqBuilder b) updates]) =
      _$GInvitationCodeVerifyReq;

  static void _initializeBuilder(GInvitationCodeVerifyReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'InvitationCodeVerify')
    ..executeOnListen = true;
  _i3.GInvitationCodeVerifyVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GInvitationCodeVerifyData? Function(
          _i2.GInvitationCodeVerifyData?, _i2.GInvitationCodeVerifyData?)?
      get updateResult;
  _i2.GInvitationCodeVerifyData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GInvitationCodeVerifyData? parseData(Map<String, dynamic> json) =>
      _i2.GInvitationCodeVerifyData.fromJson(json);
  static Serializer<GInvitationCodeVerifyReq> get serializer =>
      _$gInvitationCodeVerifyReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GInvitationCodeVerifyReq.serializer, this)
          as Map<String, dynamic>);
  static GInvitationCodeVerifyReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GInvitationCodeVerifyReq.serializer, json);
}
