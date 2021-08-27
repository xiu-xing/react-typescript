// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/queries/realm_suggestions/realm_suggestions.ast.gql.dart'
    as _i5;
import 'package:rime_app/graphql/queries/realm_suggestions/realm_suggestions.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/queries/realm_suggestions/realm_suggestions.var.gql.dart'
    as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'realm_suggestions.req.gql.g.dart';

abstract class GRealmSuggestionsReq
    implements
        Built<GRealmSuggestionsReq, GRealmSuggestionsReqBuilder>,
        _i1.OperationRequest<_i2.GRealmSuggestionsData,
            _i3.GRealmSuggestionsVars> {
  GRealmSuggestionsReq._();

  factory GRealmSuggestionsReq(
          [Function(GRealmSuggestionsReqBuilder b) updates]) =
      _$GRealmSuggestionsReq;

  static void _initializeBuilder(GRealmSuggestionsReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'RealmSuggestions')
    ..executeOnListen = true;
  _i3.GRealmSuggestionsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GRealmSuggestionsData? Function(
      _i2.GRealmSuggestionsData?, _i2.GRealmSuggestionsData?)? get updateResult;
  _i2.GRealmSuggestionsData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GRealmSuggestionsData? parseData(Map<String, dynamic> json) =>
      _i2.GRealmSuggestionsData.fromJson(json);
  static Serializer<GRealmSuggestionsReq> get serializer =>
      _$gRealmSuggestionsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GRealmSuggestionsReq.serializer, this)
          as Map<String, dynamic>);
  static GRealmSuggestionsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GRealmSuggestionsReq.serializer, json);
}
