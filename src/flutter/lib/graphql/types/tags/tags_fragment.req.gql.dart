// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;
import 'package:rime_app/graphql/types/tags/tags_fragment.ast.gql.dart' as _i4;
import 'package:rime_app/graphql/types/tags/tags_fragment.data.gql.dart' as _i2;
import 'package:rime_app/graphql/types/tags/tags_fragment.var.gql.dart' as _i3;

part 'tags_fragment.req.gql.g.dart';

abstract class GTextTagFieldsReq
    implements
        Built<GTextTagFieldsReq, GTextTagFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GTextTagFieldsData, _i3.GTextTagFieldsVars> {
  GTextTagFieldsReq._();

  factory GTextTagFieldsReq([Function(GTextTagFieldsReqBuilder b) updates]) =
      _$GTextTagFieldsReq;

  static void _initializeBuilder(GTextTagFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'TextTagFields';
  _i3.GTextTagFieldsVars get vars;
  _i5.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GTextTagFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GTextTagFieldsData.fromJson(json);
  static Serializer<GTextTagFieldsReq> get serializer =>
      _$gTextTagFieldsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GTextTagFieldsReq.serializer, this)
          as Map<String, dynamic>);
  static GTextTagFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GTextTagFieldsReq.serializer, json);
}

abstract class GRiskTagFieldsReq
    implements
        Built<GRiskTagFieldsReq, GRiskTagFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GRiskTagFieldsData, _i3.GRiskTagFieldsVars> {
  GRiskTagFieldsReq._();

  factory GRiskTagFieldsReq([Function(GRiskTagFieldsReqBuilder b) updates]) =
      _$GRiskTagFieldsReq;

  static void _initializeBuilder(GRiskTagFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'RiskTagFields';
  _i3.GRiskTagFieldsVars get vars;
  _i5.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GRiskTagFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GRiskTagFieldsData.fromJson(json);
  static Serializer<GRiskTagFieldsReq> get serializer =>
      _$gRiskTagFieldsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GRiskTagFieldsReq.serializer, this)
          as Map<String, dynamic>);
  static GRiskTagFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GRiskTagFieldsReq.serializer, json);
}

abstract class GQuickSearchTagFieldsReq
    implements
        Built<GQuickSearchTagFieldsReq, GQuickSearchTagFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GQuickSearchTagFieldsData,
            _i3.GQuickSearchTagFieldsVars> {
  GQuickSearchTagFieldsReq._();

  factory GQuickSearchTagFieldsReq(
          [Function(GQuickSearchTagFieldsReqBuilder b) updates]) =
      _$GQuickSearchTagFieldsReq;

  static void _initializeBuilder(GQuickSearchTagFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'QuickSearchTagFields';
  _i3.GQuickSearchTagFieldsVars get vars;
  _i5.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GQuickSearchTagFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GQuickSearchTagFieldsData.fromJson(json);
  static Serializer<GQuickSearchTagFieldsReq> get serializer =>
      _$gQuickSearchTagFieldsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GQuickSearchTagFieldsReq.serializer, this)
          as Map<String, dynamic>);
  static GQuickSearchTagFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GQuickSearchTagFieldsReq.serializer, json);
}
