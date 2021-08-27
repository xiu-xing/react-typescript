// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;
import 'package:rime_app/graphql/types/page_info/page_info.ast.gql.dart' as _i4;
import 'package:rime_app/graphql/types/page_info/page_info.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/types/page_info/page_info.var.gql.dart' as _i3;

part 'page_info.req.gql.g.dart';

abstract class GPageInfoFieldsReq
    implements
        Built<GPageInfoFieldsReq, GPageInfoFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GPageInfoFieldsData, _i3.GPageInfoFieldsVars> {
  GPageInfoFieldsReq._();

  factory GPageInfoFieldsReq([Function(GPageInfoFieldsReqBuilder b) updates]) =
      _$GPageInfoFieldsReq;

  static void _initializeBuilder(GPageInfoFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'PageInfoFields';
  _i3.GPageInfoFieldsVars get vars;
  _i5.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GPageInfoFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GPageInfoFieldsData.fromJson(json);
  static Serializer<GPageInfoFieldsReq> get serializer =>
      _$gPageInfoFieldsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GPageInfoFieldsReq.serializer, this)
          as Map<String, dynamic>);
  static GPageInfoFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GPageInfoFieldsReq.serializer, json);
}
