// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'market.data.gql.g.dart';

abstract class GCreateOrderData
    implements Built<GCreateOrderData, GCreateOrderDataBuilder> {
  GCreateOrderData._();

  factory GCreateOrderData([Function(GCreateOrderDataBuilder b) updates]) =
      _$GCreateOrderData;

  static void _initializeBuilder(GCreateOrderDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateOrderData_createOrder? get createOrder;
  static Serializer<GCreateOrderData> get serializer =>
      _$gCreateOrderDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCreateOrderData.serializer, this)
          as Map<String, dynamic>);
  static GCreateOrderData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCreateOrderData.serializer, json);
}

abstract class GCreateOrderData_createOrder
    implements
        Built<GCreateOrderData_createOrder,
            GCreateOrderData_createOrderBuilder> {
  GCreateOrderData_createOrder._();

  factory GCreateOrderData_createOrder(
          [Function(GCreateOrderData_createOrderBuilder b) updates]) =
      _$GCreateOrderData_createOrder;

  static void _initializeBuilder(GCreateOrderData_createOrderBuilder b) =>
      b..G__typename = 'CreateOrderResponse';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get orderID;
  static Serializer<GCreateOrderData_createOrder> get serializer =>
      _$gCreateOrderDataCreateOrderSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GCreateOrderData_createOrder.serializer, this) as Map<String, dynamic>);
  static GCreateOrderData_createOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GCreateOrderData_createOrder.serializer, json);
}

abstract class GPayOrderData
    implements Built<GPayOrderData, GPayOrderDataBuilder> {
  GPayOrderData._();

  factory GPayOrderData([Function(GPayOrderDataBuilder b) updates]) =
      _$GPayOrderData;

  static void _initializeBuilder(GPayOrderDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GPayOrderData_payOrder? get payOrder;
  static Serializer<GPayOrderData> get serializer => _$gPayOrderDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPayOrderData.serializer, this)
          as Map<String, dynamic>);
  static GPayOrderData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPayOrderData.serializer, json);
}

abstract class GPayOrderData_payOrder
    implements Built<GPayOrderData_payOrder, GPayOrderData_payOrderBuilder> {
  GPayOrderData_payOrder._();

  factory GPayOrderData_payOrder(
          [Function(GPayOrderData_payOrderBuilder b) updates]) =
      _$GPayOrderData_payOrder;

  static void _initializeBuilder(GPayOrderData_payOrderBuilder b) =>
      b..G__typename = 'PayOrderResponse';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get payload;
  static Serializer<GPayOrderData_payOrder> get serializer =>
      _$gPayOrderDataPayOrderSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPayOrderData_payOrder.serializer, this)
          as Map<String, dynamic>);
  static GPayOrderData_payOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPayOrderData_payOrder.serializer, json);
}

abstract class GCancelOrderData
    implements Built<GCancelOrderData, GCancelOrderDataBuilder> {
  GCancelOrderData._();

  factory GCancelOrderData([Function(GCancelOrderDataBuilder b) updates]) =
      _$GCancelOrderData;

  static void _initializeBuilder(GCancelOrderDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get cancelOrder;
  static Serializer<GCancelOrderData> get serializer =>
      _$gCancelOrderDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCancelOrderData.serializer, this)
          as Map<String, dynamic>);
  static GCancelOrderData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCancelOrderData.serializer, json);
}

abstract class GApplePayData
    implements Built<GApplePayData, GApplePayDataBuilder> {
  GApplePayData._();

  factory GApplePayData([Function(GApplePayDataBuilder b) updates]) =
      _$GApplePayData;

  static void _initializeBuilder(GApplePayDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get applePay;
  static Serializer<GApplePayData> get serializer => _$gApplePayDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GApplePayData.serializer, this)
          as Map<String, dynamic>);
  static GApplePayData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GApplePayData.serializer, json);
}
