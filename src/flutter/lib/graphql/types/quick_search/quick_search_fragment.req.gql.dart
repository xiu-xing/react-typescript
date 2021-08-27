// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;
import 'package:rime_app/graphql/types/quick_search/quick_search_fragment.ast.gql.dart'
    as _i4;
import 'package:rime_app/graphql/types/quick_search/quick_search_fragment.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/types/quick_search/quick_search_fragment.var.gql.dart'
    as _i3;

part 'quick_search_fragment.req.gql.g.dart';

abstract class GQuickSearchEntityNodeFieldsReq
    implements
        Built<GQuickSearchEntityNodeFieldsReq,
            GQuickSearchEntityNodeFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GQuickSearchEntityNodeFieldsData,
            _i3.GQuickSearchEntityNodeFieldsVars> {
  GQuickSearchEntityNodeFieldsReq._();

  factory GQuickSearchEntityNodeFieldsReq(
          [Function(GQuickSearchEntityNodeFieldsReqBuilder b) updates]) =
      _$GQuickSearchEntityNodeFieldsReq;

  static void _initializeBuilder(GQuickSearchEntityNodeFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'QuickSearchEntityNodeFields';
  _i3.GQuickSearchEntityNodeFieldsVars get vars;
  _i5.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GQuickSearchEntityNodeFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GQuickSearchEntityNodeFieldsData.fromJson(json);
  static Serializer<GQuickSearchEntityNodeFieldsReq> get serializer =>
      _$gQuickSearchEntityNodeFieldsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers
          .serializeWith(GQuickSearchEntityNodeFieldsReq.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchEntityNodeFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GQuickSearchEntityNodeFieldsReq.serializer, json);
}

abstract class GQuickSearchInfoFlowNodeFieldsReq
    implements
        Built<GQuickSearchInfoFlowNodeFieldsReq,
            GQuickSearchInfoFlowNodeFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GQuickSearchInfoFlowNodeFieldsData,
            _i3.GQuickSearchInfoFlowNodeFieldsVars> {
  GQuickSearchInfoFlowNodeFieldsReq._();

  factory GQuickSearchInfoFlowNodeFieldsReq(
          [Function(GQuickSearchInfoFlowNodeFieldsReqBuilder b) updates]) =
      _$GQuickSearchInfoFlowNodeFieldsReq;

  static void _initializeBuilder(GQuickSearchInfoFlowNodeFieldsReqBuilder b) =>
      b
        ..document = _i4.document
        ..fragmentName = 'QuickSearchInfoFlowNodeFields';
  _i3.GQuickSearchInfoFlowNodeFieldsVars get vars;
  _i5.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GQuickSearchInfoFlowNodeFieldsData? parseData(
          Map<String, dynamic> json) =>
      _i2.GQuickSearchInfoFlowNodeFieldsData.fromJson(json);
  static Serializer<GQuickSearchInfoFlowNodeFieldsReq> get serializer =>
      _$gQuickSearchInfoFlowNodeFieldsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers
          .serializeWith(GQuickSearchInfoFlowNodeFieldsReq.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchInfoFlowNodeFieldsReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GQuickSearchInfoFlowNodeFieldsReq.serializer, json);
}
