// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/queries/key_value_map/key_value_map.ast.gql.dart'
    as _i5;
import 'package:rime_app/graphql/queries/key_value_map/key_value_map.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/queries/key_value_map/key_value_map.var.gql.dart'
    as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'key_value_map.req.gql.g.dart';

abstract class GKeyValueMapReq
    implements
        Built<GKeyValueMapReq, GKeyValueMapReqBuilder>,
        _i1.OperationRequest<_i2.GKeyValueMapData, _i3.GKeyValueMapVars> {
  GKeyValueMapReq._();

  factory GKeyValueMapReq([Function(GKeyValueMapReqBuilder b) updates]) =
      _$GKeyValueMapReq;

  static void _initializeBuilder(GKeyValueMapReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'KeyValueMap')
    ..executeOnListen = true;
  _i3.GKeyValueMapVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GKeyValueMapData? Function(_i2.GKeyValueMapData?, _i2.GKeyValueMapData?)?
      get updateResult;
  _i2.GKeyValueMapData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GKeyValueMapData? parseData(Map<String, dynamic> json) =>
      _i2.GKeyValueMapData.fromJson(json);
  static Serializer<GKeyValueMapReq> get serializer =>
      _$gKeyValueMapReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GKeyValueMapReq.serializer, this)
          as Map<String, dynamic>);
  static GKeyValueMapReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GKeyValueMapReq.serializer, json);
}
