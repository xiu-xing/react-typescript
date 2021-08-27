// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/mutations/create_ticket/create_ticket.ast.gql.dart'
    as _i5;
import 'package:rime_app/graphql/mutations/create_ticket/create_ticket.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/mutations/create_ticket/create_ticket.var.gql.dart'
    as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'create_ticket.req.gql.g.dart';

abstract class GCreateTicketReq
    implements
        Built<GCreateTicketReq, GCreateTicketReqBuilder>,
        _i1.OperationRequest<_i2.GCreateTicketData, _i3.GCreateTicketVars> {
  GCreateTicketReq._();

  factory GCreateTicketReq([Function(GCreateTicketReqBuilder b) updates]) =
      _$GCreateTicketReq;

  static void _initializeBuilder(GCreateTicketReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'CreateTicket')
    ..executeOnListen = true;
  _i3.GCreateTicketVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GCreateTicketData? Function(
      _i2.GCreateTicketData?, _i2.GCreateTicketData?)? get updateResult;
  _i2.GCreateTicketData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GCreateTicketData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateTicketData.fromJson(json);
  static Serializer<GCreateTicketReq> get serializer =>
      _$gCreateTicketReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GCreateTicketReq.serializer, this)
          as Map<String, dynamic>);
  static GCreateTicketReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GCreateTicketReq.serializer, json);
}
