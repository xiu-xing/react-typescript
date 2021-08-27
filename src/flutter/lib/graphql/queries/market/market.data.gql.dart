// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'market.data.gql.g.dart';

abstract class GCommodityData
    implements Built<GCommodityData, GCommodityDataBuilder> {
  GCommodityData._();

  factory GCommodityData([Function(GCommodityDataBuilder b) updates]) =
      _$GCommodityData;

  static void _initializeBuilder(GCommodityDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GCommodityData_commodity> get commodity;
  static Serializer<GCommodityData> get serializer =>
      _$gCommodityDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCommodityData.serializer, this)
          as Map<String, dynamic>);
  static GCommodityData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCommodityData.serializer, json);
}

abstract class GCommodityData_commodity
    implements
        Built<GCommodityData_commodity, GCommodityData_commodityBuilder> {
  GCommodityData_commodity._();

  factory GCommodityData_commodity(
          [Function(GCommodityData_commodityBuilder b) updates]) =
      _$GCommodityData_commodity;

  static void _initializeBuilder(GCommodityData_commodityBuilder b) =>
      b..G__typename = 'Commodity';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get name;
  double? get amount;
  int? get day;
  String? get serviceID;
  static Serializer<GCommodityData_commodity> get serializer =>
      _$gCommodityDataCommoditySerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCommodityData_commodity.serializer, this)
          as Map<String, dynamic>);
  static GCommodityData_commodity? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GCommodityData_commodity.serializer, json);
}

abstract class GCheckPaymentData
    implements Built<GCheckPaymentData, GCheckPaymentDataBuilder> {
  GCheckPaymentData._();

  factory GCheckPaymentData([Function(GCheckPaymentDataBuilder b) updates]) =
      _$GCheckPaymentData;

  static void _initializeBuilder(GCheckPaymentDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get checkPayment;
  static Serializer<GCheckPaymentData> get serializer =>
      _$gCheckPaymentDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCheckPaymentData.serializer, this)
          as Map<String, dynamic>);
  static GCheckPaymentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCheckPaymentData.serializer, json);
}

abstract class GUserOrdersData
    implements Built<GUserOrdersData, GUserOrdersDataBuilder> {
  GUserOrdersData._();

  factory GUserOrdersData([Function(GUserOrdersDataBuilder b) updates]) =
      _$GUserOrdersData;

  static void _initializeBuilder(GUserOrdersDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserOrdersData_userOrders? get userOrders;
  static Serializer<GUserOrdersData> get serializer =>
      _$gUserOrdersDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUserOrdersData.serializer, this)
          as Map<String, dynamic>);
  static GUserOrdersData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUserOrdersData.serializer, json);
}

abstract class GUserOrdersData_userOrders
    implements
        Built<GUserOrdersData_userOrders, GUserOrdersData_userOrdersBuilder> {
  GUserOrdersData_userOrders._();

  factory GUserOrdersData_userOrders(
          [Function(GUserOrdersData_userOrdersBuilder b) updates]) =
      _$GUserOrdersData_userOrders;

  static void _initializeBuilder(GUserOrdersData_userOrdersBuilder b) =>
      b..G__typename = 'MyOrderResponse';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get count;
  BuiltList<GUserOrdersData_userOrders_myOrder> get myOrder;
  static Serializer<GUserOrdersData_userOrders> get serializer =>
      _$gUserOrdersDataUserOrdersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GUserOrdersData_userOrders.serializer, this) as Map<String, dynamic>);
  static GUserOrdersData_userOrders? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GUserOrdersData_userOrders.serializer, json);
}

abstract class GUserOrdersData_userOrders_myOrder
    implements
        Built<GUserOrdersData_userOrders_myOrder,
            GUserOrdersData_userOrders_myOrderBuilder> {
  GUserOrdersData_userOrders_myOrder._();

  factory GUserOrdersData_userOrders_myOrder(
          [Function(GUserOrdersData_userOrders_myOrderBuilder b) updates]) =
      _$GUserOrdersData_userOrders_myOrder;

  static void _initializeBuilder(GUserOrdersData_userOrders_myOrderBuilder b) =>
      b..G__typename = 'MyOrderItem';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get orderID;
  String? get commodityID;
  String? get commodityName;
  _i2.GOrderStats? get orderStats;
  _i2.GTypeOrder? get typeOrder;
  double? get amount;
  int? get createTime;
  int? get day;
  static Serializer<GUserOrdersData_userOrders_myOrder> get serializer =>
      _$gUserOrdersDataUserOrdersMyOrderSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GUserOrdersData_userOrders_myOrder.serializer, this)
      as Map<String, dynamic>);
  static GUserOrdersData_userOrders_myOrder? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GUserOrdersData_userOrders_myOrder.serializer, json);
}

abstract class GOrderByIDData
    implements Built<GOrderByIDData, GOrderByIDDataBuilder> {
  GOrderByIDData._();

  factory GOrderByIDData([Function(GOrderByIDDataBuilder b) updates]) =
      _$GOrderByIDData;

  static void _initializeBuilder(GOrderByIDDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GOrderByIDData_orderByID? get orderByID;
  static Serializer<GOrderByIDData> get serializer =>
      _$gOrderByIDDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GOrderByIDData.serializer, this)
          as Map<String, dynamic>);
  static GOrderByIDData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GOrderByIDData.serializer, json);
}

abstract class GOrderByIDData_orderByID
    implements
        Built<GOrderByIDData_orderByID, GOrderByIDData_orderByIDBuilder> {
  GOrderByIDData_orderByID._();

  factory GOrderByIDData_orderByID(
          [Function(GOrderByIDData_orderByIDBuilder b) updates]) =
      _$GOrderByIDData_orderByID;

  static void _initializeBuilder(GOrderByIDData_orderByIDBuilder b) =>
      b..G__typename = 'MyOrderItem';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get orderID;
  String? get commodityID;
  _i2.GOrderStats? get orderStats;
  _i2.GTypeOrder? get typeOrder;
  double? get amount;
  int? get createTime;
  int? get updateTime;
  int? get day;
  String? get commodityName;
  static Serializer<GOrderByIDData_orderByID> get serializer =>
      _$gOrderByIDDataOrderByIDSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GOrderByIDData_orderByID.serializer, this)
          as Map<String, dynamic>);
  static GOrderByIDData_orderByID? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GOrderByIDData_orderByID.serializer, json);
}
