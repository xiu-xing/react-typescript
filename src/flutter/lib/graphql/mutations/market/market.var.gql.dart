// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i2;

part 'market.var.gql.g.dart';

abstract class GCreateOrderVars
    implements Built<GCreateOrderVars, GCreateOrderVarsBuilder> {
  GCreateOrderVars._();

  factory GCreateOrderVars([Function(GCreateOrderVarsBuilder b) updates]) =
      _$GCreateOrderVars;

  _i1.GCreateOrderRequest get input;
  static Serializer<GCreateOrderVars> get serializer =>
      _$gCreateOrderVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GCreateOrderVars.serializer, this)
          as Map<String, dynamic>);
  static GCreateOrderVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GCreateOrderVars.serializer, json);
}

abstract class GPayOrderVars
    implements Built<GPayOrderVars, GPayOrderVarsBuilder> {
  GPayOrderVars._();

  factory GPayOrderVars([Function(GPayOrderVarsBuilder b) updates]) =
      _$GPayOrderVars;

  _i1.GPayOrderRequest get input;
  static Serializer<GPayOrderVars> get serializer => _$gPayOrderVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GPayOrderVars.serializer, this)
          as Map<String, dynamic>);
  static GPayOrderVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GPayOrderVars.serializer, json);
}

abstract class GCancelOrderVars
    implements Built<GCancelOrderVars, GCancelOrderVarsBuilder> {
  GCancelOrderVars._();

  factory GCancelOrderVars([Function(GCancelOrderVarsBuilder b) updates]) =
      _$GCancelOrderVars;

  _i1.GCancelOrderRequest get input;
  static Serializer<GCancelOrderVars> get serializer =>
      _$gCancelOrderVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GCancelOrderVars.serializer, this)
          as Map<String, dynamic>);
  static GCancelOrderVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GCancelOrderVars.serializer, json);
}

abstract class GApplePayVars
    implements Built<GApplePayVars, GApplePayVarsBuilder> {
  GApplePayVars._();

  factory GApplePayVars([Function(GApplePayVarsBuilder b) updates]) =
      _$GApplePayVars;

  _i1.GApplePayRequest? get input;
  static Serializer<GApplePayVars> get serializer => _$gApplePayVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GApplePayVars.serializer, this)
          as Map<String, dynamic>);
  static GApplePayVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GApplePayVars.serializer, json);
}
