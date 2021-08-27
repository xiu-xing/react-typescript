// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i2;

part 'market.var.gql.g.dart';

abstract class GCommodityVars
    implements Built<GCommodityVars, GCommodityVarsBuilder> {
  GCommodityVars._();

  factory GCommodityVars([Function(GCommodityVarsBuilder b) updates]) =
      _$GCommodityVars;

  _i1.GOSType get osType;
  static Serializer<GCommodityVars> get serializer =>
      _$gCommodityVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GCommodityVars.serializer, this)
          as Map<String, dynamic>);
  static GCommodityVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GCommodityVars.serializer, json);
}

abstract class GCheckPaymentVars
    implements Built<GCheckPaymentVars, GCheckPaymentVarsBuilder> {
  GCheckPaymentVars._();

  factory GCheckPaymentVars([Function(GCheckPaymentVarsBuilder b) updates]) =
      _$GCheckPaymentVars;

  String get orderID;
  static Serializer<GCheckPaymentVars> get serializer =>
      _$gCheckPaymentVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GCheckPaymentVars.serializer, this)
          as Map<String, dynamic>);
  static GCheckPaymentVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GCheckPaymentVars.serializer, json);
}

abstract class GUserOrdersVars
    implements Built<GUserOrdersVars, GUserOrdersVarsBuilder> {
  GUserOrdersVars._();

  factory GUserOrdersVars([Function(GUserOrdersVarsBuilder b) updates]) =
      _$GUserOrdersVars;

  int get offset;
  int get limit;
  static Serializer<GUserOrdersVars> get serializer =>
      _$gUserOrdersVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GUserOrdersVars.serializer, this)
          as Map<String, dynamic>);
  static GUserOrdersVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GUserOrdersVars.serializer, json);
}

abstract class GOrderByIDVars
    implements Built<GOrderByIDVars, GOrderByIDVarsBuilder> {
  GOrderByIDVars._();

  factory GOrderByIDVars([Function(GOrderByIDVarsBuilder b) updates]) =
      _$GOrderByIDVars;

  String get orderID;
  static Serializer<GOrderByIDVars> get serializer =>
      _$gOrderByIDVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GOrderByIDVars.serializer, this)
          as Map<String, dynamic>);
  static GOrderByIDVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GOrderByIDVars.serializer, json);
}
