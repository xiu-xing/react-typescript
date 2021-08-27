// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCommodityData> _$gCommodityDataSerializer =
    new _$GCommodityDataSerializer();
Serializer<GCommodityData_commodity> _$gCommodityDataCommoditySerializer =
    new _$GCommodityData_commoditySerializer();
Serializer<GCheckPaymentData> _$gCheckPaymentDataSerializer =
    new _$GCheckPaymentDataSerializer();
Serializer<GUserOrdersData> _$gUserOrdersDataSerializer =
    new _$GUserOrdersDataSerializer();
Serializer<GUserOrdersData_userOrders> _$gUserOrdersDataUserOrdersSerializer =
    new _$GUserOrdersData_userOrdersSerializer();
Serializer<GUserOrdersData_userOrders_myOrder>
    _$gUserOrdersDataUserOrdersMyOrderSerializer =
    new _$GUserOrdersData_userOrders_myOrderSerializer();
Serializer<GOrderByIDData> _$gOrderByIDDataSerializer =
    new _$GOrderByIDDataSerializer();
Serializer<GOrderByIDData_orderByID> _$gOrderByIDDataOrderByIDSerializer =
    new _$GOrderByIDData_orderByIDSerializer();

class _$GCommodityDataSerializer
    implements StructuredSerializer<GCommodityData> {
  @override
  final Iterable<Type> types = const [GCommodityData, _$GCommodityData];
  @override
  final String wireName = 'GCommodityData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCommodityData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'commodity',
      serializers.serialize(object.commodity,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GCommodityData_commodity)])),
    ];

    return result;
  }

  @override
  GCommodityData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCommodityDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'commodity':
          result.commodity.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GCommodityData_commodity)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GCommodityData_commoditySerializer
    implements StructuredSerializer<GCommodityData_commodity> {
  @override
  final Iterable<Type> types = const [
    GCommodityData_commodity,
    _$GCommodityData_commodity
  ];
  @override
  final String wireName = 'GCommodityData_commodity';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCommodityData_commodity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.serviceID;
    if (value != null) {
      result
        ..add('serviceID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GCommodityData_commodity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCommodityData_commodityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'serviceID':
          result.serviceID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCheckPaymentDataSerializer
    implements StructuredSerializer<GCheckPaymentData> {
  @override
  final Iterable<Type> types = const [GCheckPaymentData, _$GCheckPaymentData];
  @override
  final String wireName = 'GCheckPaymentData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCheckPaymentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.checkPayment;
    if (value != null) {
      result
        ..add('checkPayment')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GCheckPaymentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCheckPaymentDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'checkPayment':
          result.checkPayment = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserOrdersDataSerializer
    implements StructuredSerializer<GUserOrdersData> {
  @override
  final Iterable<Type> types = const [GUserOrdersData, _$GUserOrdersData];
  @override
  final String wireName = 'GUserOrdersData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserOrdersData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.userOrders;
    if (value != null) {
      result
        ..add('userOrders')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GUserOrdersData_userOrders)));
    }
    return result;
  }

  @override
  GUserOrdersData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserOrdersDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userOrders':
          result.userOrders.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GUserOrdersData_userOrders))!
              as GUserOrdersData_userOrders);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserOrdersData_userOrdersSerializer
    implements StructuredSerializer<GUserOrdersData_userOrders> {
  @override
  final Iterable<Type> types = const [
    GUserOrdersData_userOrders,
    _$GUserOrdersData_userOrders
  ];
  @override
  final String wireName = 'GUserOrdersData_userOrders';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserOrdersData_userOrders object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
      'myOrder',
      serializers.serialize(object.myOrder,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GUserOrdersData_userOrders_myOrder)])),
    ];

    return result;
  }

  @override
  GUserOrdersData_userOrders deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserOrdersData_userOrdersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'myOrder':
          result.myOrder.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GUserOrdersData_userOrders_myOrder)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserOrdersData_userOrders_myOrderSerializer
    implements StructuredSerializer<GUserOrdersData_userOrders_myOrder> {
  @override
  final Iterable<Type> types = const [
    GUserOrdersData_userOrders_myOrder,
    _$GUserOrdersData_userOrders_myOrder
  ];
  @override
  final String wireName = 'GUserOrdersData_userOrders_myOrder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserOrdersData_userOrders_myOrder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.orderID;
    if (value != null) {
      result
        ..add('orderID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.commodityID;
    if (value != null) {
      result
        ..add('commodityID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.commodityName;
    if (value != null) {
      result
        ..add('commodityName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderStats;
    if (value != null) {
      result
        ..add('orderStats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GOrderStats)));
    }
    value = object.typeOrder;
    if (value != null) {
      result
        ..add('typeOrder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GTypeOrder)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.createTime;
    if (value != null) {
      result
        ..add('createTime')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GUserOrdersData_userOrders_myOrder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserOrdersData_userOrders_myOrderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'orderID':
          result.orderID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'commodityID':
          result.commodityID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'commodityName':
          result.commodityName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'orderStats':
          result.orderStats = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GOrderStats))
              as _i2.GOrderStats?;
          break;
        case 'typeOrder':
          result.typeOrder = serializers.deserialize(value,
              specifiedType: const FullType(_i2.GTypeOrder)) as _i2.GTypeOrder?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'createTime':
          result.createTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GOrderByIDDataSerializer
    implements StructuredSerializer<GOrderByIDData> {
  @override
  final Iterable<Type> types = const [GOrderByIDData, _$GOrderByIDData];
  @override
  final String wireName = 'GOrderByIDData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GOrderByIDData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.orderByID;
    if (value != null) {
      result
        ..add('orderByID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GOrderByIDData_orderByID)));
    }
    return result;
  }

  @override
  GOrderByIDData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GOrderByIDDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'orderByID':
          result.orderByID.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GOrderByIDData_orderByID))!
              as GOrderByIDData_orderByID);
          break;
      }
    }

    return result.build();
  }
}

class _$GOrderByIDData_orderByIDSerializer
    implements StructuredSerializer<GOrderByIDData_orderByID> {
  @override
  final Iterable<Type> types = const [
    GOrderByIDData_orderByID,
    _$GOrderByIDData_orderByID
  ];
  @override
  final String wireName = 'GOrderByIDData_orderByID';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GOrderByIDData_orderByID object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.orderID;
    if (value != null) {
      result
        ..add('orderID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.commodityID;
    if (value != null) {
      result
        ..add('commodityID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderStats;
    if (value != null) {
      result
        ..add('orderStats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GOrderStats)));
    }
    value = object.typeOrder;
    if (value != null) {
      result
        ..add('typeOrder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GTypeOrder)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.createTime;
    if (value != null) {
      result
        ..add('createTime')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.updateTime;
    if (value != null) {
      result
        ..add('updateTime')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.commodityName;
    if (value != null) {
      result
        ..add('commodityName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GOrderByIDData_orderByID deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GOrderByIDData_orderByIDBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'orderID':
          result.orderID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'commodityID':
          result.commodityID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'orderStats':
          result.orderStats = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GOrderStats))
              as _i2.GOrderStats?;
          break;
        case 'typeOrder':
          result.typeOrder = serializers.deserialize(value,
              specifiedType: const FullType(_i2.GTypeOrder)) as _i2.GTypeOrder?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'createTime':
          result.createTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'updateTime':
          result.updateTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'commodityName':
          result.commodityName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCommodityData extends GCommodityData {
  @override
  final String G__typename;
  @override
  final BuiltList<GCommodityData_commodity> commodity;

  factory _$GCommodityData([void Function(GCommodityDataBuilder)? updates]) =>
      (new GCommodityDataBuilder()..update(updates)).build();

  _$GCommodityData._({required this.G__typename, required this.commodity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GCommodityData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        commodity, 'GCommodityData', 'commodity');
  }

  @override
  GCommodityData rebuild(void Function(GCommodityDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCommodityDataBuilder toBuilder() =>
      new GCommodityDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCommodityData &&
        G__typename == other.G__typename &&
        commodity == other.commodity;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), commodity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCommodityData')
          ..add('G__typename', G__typename)
          ..add('commodity', commodity))
        .toString();
  }
}

class GCommodityDataBuilder
    implements Builder<GCommodityData, GCommodityDataBuilder> {
  _$GCommodityData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GCommodityData_commodity>? _commodity;
  ListBuilder<GCommodityData_commodity> get commodity =>
      _$this._commodity ??= new ListBuilder<GCommodityData_commodity>();
  set commodity(ListBuilder<GCommodityData_commodity>? commodity) =>
      _$this._commodity = commodity;

  GCommodityDataBuilder() {
    GCommodityData._initializeBuilder(this);
  }

  GCommodityDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _commodity = $v.commodity.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCommodityData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCommodityData;
  }

  @override
  void update(void Function(GCommodityDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCommodityData build() {
    _$GCommodityData _$result;
    try {
      _$result = _$v ??
          new _$GCommodityData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GCommodityData', 'G__typename'),
              commodity: commodity.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'commodity';
        commodity.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GCommodityData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCommodityData_commodity extends GCommodityData_commodity {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final double? amount;
  @override
  final int? day;
  @override
  final String? serviceID;

  factory _$GCommodityData_commodity(
          [void Function(GCommodityData_commodityBuilder)? updates]) =>
      (new GCommodityData_commodityBuilder()..update(updates)).build();

  _$GCommodityData_commodity._(
      {required this.G__typename,
      this.id,
      this.name,
      this.amount,
      this.day,
      this.serviceID})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GCommodityData_commodity', 'G__typename');
  }

  @override
  GCommodityData_commodity rebuild(
          void Function(GCommodityData_commodityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCommodityData_commodityBuilder toBuilder() =>
      new GCommodityData_commodityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCommodityData_commodity &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        amount == other.amount &&
        day == other.day &&
        serviceID == other.serviceID;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, G__typename.hashCode), id.hashCode),
                    name.hashCode),
                amount.hashCode),
            day.hashCode),
        serviceID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCommodityData_commodity')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('amount', amount)
          ..add('day', day)
          ..add('serviceID', serviceID))
        .toString();
  }
}

class GCommodityData_commodityBuilder
    implements
        Builder<GCommodityData_commodity, GCommodityData_commodityBuilder> {
  _$GCommodityData_commodity? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  int? _day;
  int? get day => _$this._day;
  set day(int? day) => _$this._day = day;

  String? _serviceID;
  String? get serviceID => _$this._serviceID;
  set serviceID(String? serviceID) => _$this._serviceID = serviceID;

  GCommodityData_commodityBuilder() {
    GCommodityData_commodity._initializeBuilder(this);
  }

  GCommodityData_commodityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _amount = $v.amount;
      _day = $v.day;
      _serviceID = $v.serviceID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCommodityData_commodity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCommodityData_commodity;
  }

  @override
  void update(void Function(GCommodityData_commodityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCommodityData_commodity build() {
    final _$result = _$v ??
        new _$GCommodityData_commodity._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GCommodityData_commodity', 'G__typename'),
            id: id,
            name: name,
            amount: amount,
            day: day,
            serviceID: serviceID);
    replace(_$result);
    return _$result;
  }
}

class _$GCheckPaymentData extends GCheckPaymentData {
  @override
  final String G__typename;
  @override
  final bool? checkPayment;

  factory _$GCheckPaymentData(
          [void Function(GCheckPaymentDataBuilder)? updates]) =>
      (new GCheckPaymentDataBuilder()..update(updates)).build();

  _$GCheckPaymentData._({required this.G__typename, this.checkPayment})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GCheckPaymentData', 'G__typename');
  }

  @override
  GCheckPaymentData rebuild(void Function(GCheckPaymentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCheckPaymentDataBuilder toBuilder() =>
      new GCheckPaymentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCheckPaymentData &&
        G__typename == other.G__typename &&
        checkPayment == other.checkPayment;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), checkPayment.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCheckPaymentData')
          ..add('G__typename', G__typename)
          ..add('checkPayment', checkPayment))
        .toString();
  }
}

class GCheckPaymentDataBuilder
    implements Builder<GCheckPaymentData, GCheckPaymentDataBuilder> {
  _$GCheckPaymentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _checkPayment;
  bool? get checkPayment => _$this._checkPayment;
  set checkPayment(bool? checkPayment) => _$this._checkPayment = checkPayment;

  GCheckPaymentDataBuilder() {
    GCheckPaymentData._initializeBuilder(this);
  }

  GCheckPaymentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _checkPayment = $v.checkPayment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCheckPaymentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCheckPaymentData;
  }

  @override
  void update(void Function(GCheckPaymentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCheckPaymentData build() {
    final _$result = _$v ??
        new _$GCheckPaymentData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GCheckPaymentData', 'G__typename'),
            checkPayment: checkPayment);
    replace(_$result);
    return _$result;
  }
}

class _$GUserOrdersData extends GUserOrdersData {
  @override
  final String G__typename;
  @override
  final GUserOrdersData_userOrders? userOrders;

  factory _$GUserOrdersData([void Function(GUserOrdersDataBuilder)? updates]) =>
      (new GUserOrdersDataBuilder()..update(updates)).build();

  _$GUserOrdersData._({required this.G__typename, this.userOrders})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUserOrdersData', 'G__typename');
  }

  @override
  GUserOrdersData rebuild(void Function(GUserOrdersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserOrdersDataBuilder toBuilder() =>
      new GUserOrdersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserOrdersData &&
        G__typename == other.G__typename &&
        userOrders == other.userOrders;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), userOrders.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUserOrdersData')
          ..add('G__typename', G__typename)
          ..add('userOrders', userOrders))
        .toString();
  }
}

class GUserOrdersDataBuilder
    implements Builder<GUserOrdersData, GUserOrdersDataBuilder> {
  _$GUserOrdersData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserOrdersData_userOrdersBuilder? _userOrders;
  GUserOrdersData_userOrdersBuilder get userOrders =>
      _$this._userOrders ??= new GUserOrdersData_userOrdersBuilder();
  set userOrders(GUserOrdersData_userOrdersBuilder? userOrders) =>
      _$this._userOrders = userOrders;

  GUserOrdersDataBuilder() {
    GUserOrdersData._initializeBuilder(this);
  }

  GUserOrdersDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userOrders = $v.userOrders?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserOrdersData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserOrdersData;
  }

  @override
  void update(void Function(GUserOrdersDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserOrdersData build() {
    _$GUserOrdersData _$result;
    try {
      _$result = _$v ??
          new _$GUserOrdersData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GUserOrdersData', 'G__typename'),
              userOrders: _userOrders?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userOrders';
        _userOrders?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUserOrdersData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserOrdersData_userOrders extends GUserOrdersData_userOrders {
  @override
  final String G__typename;
  @override
  final int count;
  @override
  final BuiltList<GUserOrdersData_userOrders_myOrder> myOrder;

  factory _$GUserOrdersData_userOrders(
          [void Function(GUserOrdersData_userOrdersBuilder)? updates]) =>
      (new GUserOrdersData_userOrdersBuilder()..update(updates)).build();

  _$GUserOrdersData_userOrders._(
      {required this.G__typename, required this.count, required this.myOrder})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUserOrdersData_userOrders', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        count, 'GUserOrdersData_userOrders', 'count');
    BuiltValueNullFieldError.checkNotNull(
        myOrder, 'GUserOrdersData_userOrders', 'myOrder');
  }

  @override
  GUserOrdersData_userOrders rebuild(
          void Function(GUserOrdersData_userOrdersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserOrdersData_userOrdersBuilder toBuilder() =>
      new GUserOrdersData_userOrdersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserOrdersData_userOrders &&
        G__typename == other.G__typename &&
        count == other.count &&
        myOrder == other.myOrder;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, G__typename.hashCode), count.hashCode), myOrder.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUserOrdersData_userOrders')
          ..add('G__typename', G__typename)
          ..add('count', count)
          ..add('myOrder', myOrder))
        .toString();
  }
}

class GUserOrdersData_userOrdersBuilder
    implements
        Builder<GUserOrdersData_userOrders, GUserOrdersData_userOrdersBuilder> {
  _$GUserOrdersData_userOrders? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  ListBuilder<GUserOrdersData_userOrders_myOrder>? _myOrder;
  ListBuilder<GUserOrdersData_userOrders_myOrder> get myOrder =>
      _$this._myOrder ??= new ListBuilder<GUserOrdersData_userOrders_myOrder>();
  set myOrder(ListBuilder<GUserOrdersData_userOrders_myOrder>? myOrder) =>
      _$this._myOrder = myOrder;

  GUserOrdersData_userOrdersBuilder() {
    GUserOrdersData_userOrders._initializeBuilder(this);
  }

  GUserOrdersData_userOrdersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _count = $v.count;
      _myOrder = $v.myOrder.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserOrdersData_userOrders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserOrdersData_userOrders;
  }

  @override
  void update(void Function(GUserOrdersData_userOrdersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserOrdersData_userOrders build() {
    _$GUserOrdersData_userOrders _$result;
    try {
      _$result = _$v ??
          new _$GUserOrdersData_userOrders._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GUserOrdersData_userOrders', 'G__typename'),
              count: BuiltValueNullFieldError.checkNotNull(
                  count, 'GUserOrdersData_userOrders', 'count'),
              myOrder: myOrder.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'myOrder';
        myOrder.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUserOrdersData_userOrders', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserOrdersData_userOrders_myOrder
    extends GUserOrdersData_userOrders_myOrder {
  @override
  final String G__typename;
  @override
  final String? orderID;
  @override
  final String? commodityID;
  @override
  final String? commodityName;
  @override
  final _i2.GOrderStats? orderStats;
  @override
  final _i2.GTypeOrder? typeOrder;
  @override
  final double? amount;
  @override
  final int? createTime;
  @override
  final int? day;

  factory _$GUserOrdersData_userOrders_myOrder(
          [void Function(GUserOrdersData_userOrders_myOrderBuilder)?
              updates]) =>
      (new GUserOrdersData_userOrders_myOrderBuilder()..update(updates))
          .build();

  _$GUserOrdersData_userOrders_myOrder._(
      {required this.G__typename,
      this.orderID,
      this.commodityID,
      this.commodityName,
      this.orderStats,
      this.typeOrder,
      this.amount,
      this.createTime,
      this.day})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUserOrdersData_userOrders_myOrder', 'G__typename');
  }

  @override
  GUserOrdersData_userOrders_myOrder rebuild(
          void Function(GUserOrdersData_userOrders_myOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserOrdersData_userOrders_myOrderBuilder toBuilder() =>
      new GUserOrdersData_userOrders_myOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserOrdersData_userOrders_myOrder &&
        G__typename == other.G__typename &&
        orderID == other.orderID &&
        commodityID == other.commodityID &&
        commodityName == other.commodityName &&
        orderStats == other.orderStats &&
        typeOrder == other.typeOrder &&
        amount == other.amount &&
        createTime == other.createTime &&
        day == other.day;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, G__typename.hashCode),
                                    orderID.hashCode),
                                commodityID.hashCode),
                            commodityName.hashCode),
                        orderStats.hashCode),
                    typeOrder.hashCode),
                amount.hashCode),
            createTime.hashCode),
        day.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUserOrdersData_userOrders_myOrder')
          ..add('G__typename', G__typename)
          ..add('orderID', orderID)
          ..add('commodityID', commodityID)
          ..add('commodityName', commodityName)
          ..add('orderStats', orderStats)
          ..add('typeOrder', typeOrder)
          ..add('amount', amount)
          ..add('createTime', createTime)
          ..add('day', day))
        .toString();
  }
}

class GUserOrdersData_userOrders_myOrderBuilder
    implements
        Builder<GUserOrdersData_userOrders_myOrder,
            GUserOrdersData_userOrders_myOrderBuilder> {
  _$GUserOrdersData_userOrders_myOrder? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _orderID;
  String? get orderID => _$this._orderID;
  set orderID(String? orderID) => _$this._orderID = orderID;

  String? _commodityID;
  String? get commodityID => _$this._commodityID;
  set commodityID(String? commodityID) => _$this._commodityID = commodityID;

  String? _commodityName;
  String? get commodityName => _$this._commodityName;
  set commodityName(String? commodityName) =>
      _$this._commodityName = commodityName;

  _i2.GOrderStats? _orderStats;
  _i2.GOrderStats? get orderStats => _$this._orderStats;
  set orderStats(_i2.GOrderStats? orderStats) =>
      _$this._orderStats = orderStats;

  _i2.GTypeOrder? _typeOrder;
  _i2.GTypeOrder? get typeOrder => _$this._typeOrder;
  set typeOrder(_i2.GTypeOrder? typeOrder) => _$this._typeOrder = typeOrder;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  int? _createTime;
  int? get createTime => _$this._createTime;
  set createTime(int? createTime) => _$this._createTime = createTime;

  int? _day;
  int? get day => _$this._day;
  set day(int? day) => _$this._day = day;

  GUserOrdersData_userOrders_myOrderBuilder() {
    GUserOrdersData_userOrders_myOrder._initializeBuilder(this);
  }

  GUserOrdersData_userOrders_myOrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _orderID = $v.orderID;
      _commodityID = $v.commodityID;
      _commodityName = $v.commodityName;
      _orderStats = $v.orderStats;
      _typeOrder = $v.typeOrder;
      _amount = $v.amount;
      _createTime = $v.createTime;
      _day = $v.day;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserOrdersData_userOrders_myOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserOrdersData_userOrders_myOrder;
  }

  @override
  void update(
      void Function(GUserOrdersData_userOrders_myOrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserOrdersData_userOrders_myOrder build() {
    final _$result = _$v ??
        new _$GUserOrdersData_userOrders_myOrder._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GUserOrdersData_userOrders_myOrder', 'G__typename'),
            orderID: orderID,
            commodityID: commodityID,
            commodityName: commodityName,
            orderStats: orderStats,
            typeOrder: typeOrder,
            amount: amount,
            createTime: createTime,
            day: day);
    replace(_$result);
    return _$result;
  }
}

class _$GOrderByIDData extends GOrderByIDData {
  @override
  final String G__typename;
  @override
  final GOrderByIDData_orderByID? orderByID;

  factory _$GOrderByIDData([void Function(GOrderByIDDataBuilder)? updates]) =>
      (new GOrderByIDDataBuilder()..update(updates)).build();

  _$GOrderByIDData._({required this.G__typename, this.orderByID}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GOrderByIDData', 'G__typename');
  }

  @override
  GOrderByIDData rebuild(void Function(GOrderByIDDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GOrderByIDDataBuilder toBuilder() =>
      new GOrderByIDDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GOrderByIDData &&
        G__typename == other.G__typename &&
        orderByID == other.orderByID;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), orderByID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GOrderByIDData')
          ..add('G__typename', G__typename)
          ..add('orderByID', orderByID))
        .toString();
  }
}

class GOrderByIDDataBuilder
    implements Builder<GOrderByIDData, GOrderByIDDataBuilder> {
  _$GOrderByIDData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GOrderByIDData_orderByIDBuilder? _orderByID;
  GOrderByIDData_orderByIDBuilder get orderByID =>
      _$this._orderByID ??= new GOrderByIDData_orderByIDBuilder();
  set orderByID(GOrderByIDData_orderByIDBuilder? orderByID) =>
      _$this._orderByID = orderByID;

  GOrderByIDDataBuilder() {
    GOrderByIDData._initializeBuilder(this);
  }

  GOrderByIDDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _orderByID = $v.orderByID?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GOrderByIDData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GOrderByIDData;
  }

  @override
  void update(void Function(GOrderByIDDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GOrderByIDData build() {
    _$GOrderByIDData _$result;
    try {
      _$result = _$v ??
          new _$GOrderByIDData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GOrderByIDData', 'G__typename'),
              orderByID: _orderByID?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'orderByID';
        _orderByID?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GOrderByIDData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GOrderByIDData_orderByID extends GOrderByIDData_orderByID {
  @override
  final String G__typename;
  @override
  final String? orderID;
  @override
  final String? commodityID;
  @override
  final _i2.GOrderStats? orderStats;
  @override
  final _i2.GTypeOrder? typeOrder;
  @override
  final double? amount;
  @override
  final int? createTime;
  @override
  final int? updateTime;
  @override
  final int? day;
  @override
  final String? commodityName;

  factory _$GOrderByIDData_orderByID(
          [void Function(GOrderByIDData_orderByIDBuilder)? updates]) =>
      (new GOrderByIDData_orderByIDBuilder()..update(updates)).build();

  _$GOrderByIDData_orderByID._(
      {required this.G__typename,
      this.orderID,
      this.commodityID,
      this.orderStats,
      this.typeOrder,
      this.amount,
      this.createTime,
      this.updateTime,
      this.day,
      this.commodityName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GOrderByIDData_orderByID', 'G__typename');
  }

  @override
  GOrderByIDData_orderByID rebuild(
          void Function(GOrderByIDData_orderByIDBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GOrderByIDData_orderByIDBuilder toBuilder() =>
      new GOrderByIDData_orderByIDBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GOrderByIDData_orderByID &&
        G__typename == other.G__typename &&
        orderID == other.orderID &&
        commodityID == other.commodityID &&
        orderStats == other.orderStats &&
        typeOrder == other.typeOrder &&
        amount == other.amount &&
        createTime == other.createTime &&
        updateTime == other.updateTime &&
        day == other.day &&
        commodityName == other.commodityName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, G__typename.hashCode),
                                        orderID.hashCode),
                                    commodityID.hashCode),
                                orderStats.hashCode),
                            typeOrder.hashCode),
                        amount.hashCode),
                    createTime.hashCode),
                updateTime.hashCode),
            day.hashCode),
        commodityName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GOrderByIDData_orderByID')
          ..add('G__typename', G__typename)
          ..add('orderID', orderID)
          ..add('commodityID', commodityID)
          ..add('orderStats', orderStats)
          ..add('typeOrder', typeOrder)
          ..add('amount', amount)
          ..add('createTime', createTime)
          ..add('updateTime', updateTime)
          ..add('day', day)
          ..add('commodityName', commodityName))
        .toString();
  }
}

class GOrderByIDData_orderByIDBuilder
    implements
        Builder<GOrderByIDData_orderByID, GOrderByIDData_orderByIDBuilder> {
  _$GOrderByIDData_orderByID? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _orderID;
  String? get orderID => _$this._orderID;
  set orderID(String? orderID) => _$this._orderID = orderID;

  String? _commodityID;
  String? get commodityID => _$this._commodityID;
  set commodityID(String? commodityID) => _$this._commodityID = commodityID;

  _i2.GOrderStats? _orderStats;
  _i2.GOrderStats? get orderStats => _$this._orderStats;
  set orderStats(_i2.GOrderStats? orderStats) =>
      _$this._orderStats = orderStats;

  _i2.GTypeOrder? _typeOrder;
  _i2.GTypeOrder? get typeOrder => _$this._typeOrder;
  set typeOrder(_i2.GTypeOrder? typeOrder) => _$this._typeOrder = typeOrder;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  int? _createTime;
  int? get createTime => _$this._createTime;
  set createTime(int? createTime) => _$this._createTime = createTime;

  int? _updateTime;
  int? get updateTime => _$this._updateTime;
  set updateTime(int? updateTime) => _$this._updateTime = updateTime;

  int? _day;
  int? get day => _$this._day;
  set day(int? day) => _$this._day = day;

  String? _commodityName;
  String? get commodityName => _$this._commodityName;
  set commodityName(String? commodityName) =>
      _$this._commodityName = commodityName;

  GOrderByIDData_orderByIDBuilder() {
    GOrderByIDData_orderByID._initializeBuilder(this);
  }

  GOrderByIDData_orderByIDBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _orderID = $v.orderID;
      _commodityID = $v.commodityID;
      _orderStats = $v.orderStats;
      _typeOrder = $v.typeOrder;
      _amount = $v.amount;
      _createTime = $v.createTime;
      _updateTime = $v.updateTime;
      _day = $v.day;
      _commodityName = $v.commodityName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GOrderByIDData_orderByID other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GOrderByIDData_orderByID;
  }

  @override
  void update(void Function(GOrderByIDData_orderByIDBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GOrderByIDData_orderByID build() {
    final _$result = _$v ??
        new _$GOrderByIDData_orderByID._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GOrderByIDData_orderByID', 'G__typename'),
            orderID: orderID,
            commodityID: commodityID,
            orderStats: orderStats,
            typeOrder: typeOrder,
            amount: amount,
            createTime: createTime,
            updateTime: updateTime,
            day: day,
            commodityName: commodityName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
