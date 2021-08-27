// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;
import 'package:rime_app/graphql/types/entity/entity_fragment.ast.gql.dart'
    as _i4;
import 'package:rime_app/graphql/types/entity/entity_fragment.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/types/entity/entity_fragment.var.gql.dart'
    as _i3;

part 'entity_fragment.req.gql.g.dart';

abstract class GEntityFieldsReq
    implements
        Built<GEntityFieldsReq, GEntityFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GEntityFieldsData, _i3.GEntityFieldsVars> {
  GEntityFieldsReq._();

  factory GEntityFieldsReq([Function(GEntityFieldsReqBuilder b) updates]) =
      _$GEntityFieldsReq;

  static void _initializeBuilder(GEntityFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'EntityFields';
  _i3.GEntityFieldsVars get vars;
  _i5.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GEntityFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GEntityFieldsData.fromJson(json);
  static Serializer<GEntityFieldsReq> get serializer =>
      _$gEntityFieldsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GEntityFieldsReq.serializer, this)
          as Map<String, dynamic>);
  static GEntityFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GEntityFieldsReq.serializer, json);
}
