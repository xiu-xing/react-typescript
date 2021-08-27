// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;
import 'package:rime_app/graphql/types/news/news_nodes_fragment.ast.gql.dart'
    as _i4;
import 'package:rime_app/graphql/types/news/news_nodes_fragment.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/types/news/news_nodes_fragment.var.gql.dart'
    as _i3;

part 'news_nodes_fragment.req.gql.g.dart';

abstract class GNewsFieldsReq
    implements
        Built<GNewsFieldsReq, GNewsFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GNewsFieldsData, _i3.GNewsFieldsVars> {
  GNewsFieldsReq._();

  factory GNewsFieldsReq([Function(GNewsFieldsReqBuilder b) updates]) =
      _$GNewsFieldsReq;

  static void _initializeBuilder(GNewsFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'NewsFields';
  _i3.GNewsFieldsVars get vars;
  _i5.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GNewsFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GNewsFieldsData.fromJson(json);
  static Serializer<GNewsFieldsReq> get serializer =>
      _$gNewsFieldsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GNewsFieldsReq.serializer, this)
          as Map<String, dynamic>);
  static GNewsFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GNewsFieldsReq.serializer, json);
}
