// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateOrderData> _$gCreateOrderDataSerializer =
    new _$GCreateOrderDataSerializer();
Serializer<GCreateOrderData_createOrder>
    _$gCreateOrderDataCreateOrderSerializer =
    new _$GCreateOrderData_createOrderSerializer();
Serializer<GPayOrderData> _$gPayOrderDataSerializer =
    new _$GPayOrderDataSerializer();
Serializer<GPayOrderData_payOrder> _$gPayOrderDataPayOrderSerializer =
    new _$GPayOrderData_payOrderSerializer();
Serializer<GCancelOrderData> _$gCancelOrderDataSerializer =
    new _$GCancelOrderDataSerializer();
Serializer<GApplePayData> _$gApplePayDataSerializer =
    new _$GApplePayDataSerializer();

class _$GCreateOrderDataSerializer
    implements StructuredSerializer<GCreateOrderData> {
  @override
  final Iterable<Type> types = const [GCreateOrderData, _$GCreateOrderData];
  @override
  final String wireName = 'GCreateOrderData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateOrderData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.createOrder;
    if (value != null) {
      result
        ..add('createOrder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GCreateOrderData_createOrder)));
    }
    return result;
  }

  @override
  GCreateOrderData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateOrderDataBuilder();

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
        case 'createOrder':
          result.createOrder.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GCreateOrderData_createOrder))!
              as GCreateOrderData_createOrder);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateOrderData_createOrderSerializer
    implements StructuredSerializer<GCreateOrderData_createOrder> {
  @override
  final Iterable<Type> types = const [
    GCreateOrderData_createOrder,
    _$GCreateOrderData_createOrder
  ];
  @override
  final String wireName = 'GCreateOrderData_createOrder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateOrderData_createOrder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'orderID',
      serializers.serialize(object.orderID,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateOrderData_createOrder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateOrderData_createOrderBuilder();

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
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPayOrderDataSerializer implements StructuredSerializer<GPayOrderData> {
  @override
  final Iterable<Type> types = const [GPayOrderData, _$GPayOrderData];
  @override
  final String wireName = 'GPayOrderData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPayOrderData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.payOrder;
    if (value != null) {
      result
        ..add('payOrder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPayOrderData_payOrder)));
    }
    return result;
  }

  @override
  GPayOrderData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPayOrderDataBuilder();

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
        case 'payOrder':
          result.payOrder.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GPayOrderData_payOrder))!
              as GPayOrderData_payOrder);
          break;
      }
    }

    return result.build();
  }
}

class _$GPayOrderData_payOrderSerializer
    implements StructuredSerializer<GPayOrderData_payOrder> {
  @override
  final Iterable<Type> types = const [
    GPayOrderData_payOrder,
    _$GPayOrderData_payOrder
  ];
  @override
  final String wireName = 'GPayOrderData_payOrder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPayOrderData_payOrder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'payload',
      serializers.serialize(object.payload,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPayOrderData_payOrder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPayOrderData_payOrderBuilder();

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
        case 'payload':
          result.payload = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCancelOrderDataSerializer
    implements StructuredSerializer<GCancelOrderData> {
  @override
  final Iterable<Type> types = const [GCancelOrderData, _$GCancelOrderData];
  @override
  final String wireName = 'GCancelOrderData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCancelOrderData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.cancelOrder;
    if (value != null) {
      result
        ..add('cancelOrder')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GCancelOrderData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCancelOrderDataBuilder();

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
        case 'cancelOrder':
          result.cancelOrder = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GApplePayDataSerializer implements StructuredSerializer<GApplePayData> {
  @override
  final Iterable<Type> types = const [GApplePayData, _$GApplePayData];
  @override
  final String wireName = 'GApplePayData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GApplePayData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.applePay;
    if (value != null) {
      result
        ..add('applePay')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GApplePayData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GApplePayDataBuilder();

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
        case 'applePay':
          result.applePay = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateOrderData extends GCreateOrderData {
  @override
  final String G__typename;
  @override
  final GCreateOrderData_createOrder? createOrder;

  factory _$GCreateOrderData(
          [void Function(GCreateOrderDataBuilder)? updates]) =>
      (new GCreateOrderDataBuilder()..update(updates)).build();

  _$GCreateOrderData._({required this.G__typename, this.createOrder})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GCreateOrderData', 'G__typename');
  }

  @override
  GCreateOrderData rebuild(void Function(GCreateOrderDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateOrderDataBuilder toBuilder() =>
      new GCreateOrderDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateOrderData &&
        G__typename == other.G__typename &&
        createOrder == other.createOrder;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), createOrder.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCreateOrderData')
          ..add('G__typename', G__typename)
          ..add('createOrder', createOrder))
        .toString();
  }
}

class GCreateOrderDataBuilder
    implements Builder<GCreateOrderData, GCreateOrderDataBuilder> {
  _$GCreateOrderData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateOrderData_createOrderBuilder? _createOrder;
  GCreateOrderData_createOrderBuilder get createOrder =>
      _$this._createOrder ??= new GCreateOrderData_createOrderBuilder();
  set createOrder(GCreateOrderData_createOrderBuilder? createOrder) =>
      _$this._createOrder = createOrder;

  GCreateOrderDataBuilder() {
    GCreateOrderData._initializeBuilder(this);
  }

  GCreateOrderDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createOrder = $v.createOrder?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateOrderData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateOrderData;
  }

  @override
  void update(void Function(GCreateOrderDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateOrderData build() {
    _$GCreateOrderData _$result;
    try {
      _$result = _$v ??
          new _$GCreateOrderData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GCreateOrderData', 'G__typename'),
              createOrder: _createOrder?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createOrder';
        _createOrder?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GCreateOrderData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateOrderData_createOrder extends GCreateOrderData_createOrder {
  @override
  final String G__typename;
  @override
  final String orderID;

  factory _$GCreateOrderData_createOrder(
          [void Function(GCreateOrderData_createOrderBuilder)? updates]) =>
      (new GCreateOrderData_createOrderBuilder()..update(updates)).build();

  _$GCreateOrderData_createOrder._(
      {required this.G__typename, required this.orderID})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GCreateOrderData_createOrder', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        orderID, 'GCreateOrderData_createOrder', 'orderID');
  }

  @override
  GCreateOrderData_createOrder rebuild(
          void Function(GCreateOrderData_createOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateOrderData_createOrderBuilder toBuilder() =>
      new GCreateOrderData_createOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateOrderData_createOrder &&
        G__typename == other.G__typename &&
        orderID == other.orderID;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), orderID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCreateOrderData_createOrder')
          ..add('G__typename', G__typename)
          ..add('orderID', orderID))
        .toString();
  }
}

class GCreateOrderData_createOrderBuilder
    implements
        Builder<GCreateOrderData_createOrder,
            GCreateOrderData_createOrderBuilder> {
  _$GCreateOrderData_createOrder? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _orderID;
  String? get orderID => _$this._orderID;
  set orderID(String? orderID) => _$this._orderID = orderID;

  GCreateOrderData_createOrderBuilder() {
    GCreateOrderData_createOrder._initializeBuilder(this);
  }

  GCreateOrderData_createOrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _orderID = $v.orderID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateOrderData_createOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateOrderData_createOrder;
  }

  @override
  void update(void Function(GCreateOrderData_createOrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateOrderData_createOrder build() {
    final _$result = _$v ??
        new _$GCreateOrderData_createOrder._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GCreateOrderData_createOrder', 'G__typename'),
            orderID: BuiltValueNullFieldError.checkNotNull(
                orderID, 'GCreateOrderData_createOrder', 'orderID'));
    replace(_$result);
    return _$result;
  }
}

class _$GPayOrderData extends GPayOrderData {
  @override
  final String G__typename;
  @override
  final GPayOrderData_payOrder? payOrder;

  factory _$GPayOrderData([void Function(GPayOrderDataBuilder)? updates]) =>
      (new GPayOrderDataBuilder()..update(updates)).build();

  _$GPayOrderData._({required this.G__typename, this.payOrder}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GPayOrderData', 'G__typename');
  }

  @override
  GPayOrderData rebuild(void Function(GPayOrderDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPayOrderDataBuilder toBuilder() => new GPayOrderDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPayOrderData &&
        G__typename == other.G__typename &&
        payOrder == other.payOrder;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), payOrder.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPayOrderData')
          ..add('G__typename', G__typename)
          ..add('payOrder', payOrder))
        .toString();
  }
}

class GPayOrderDataBuilder
    implements Builder<GPayOrderData, GPayOrderDataBuilder> {
  _$GPayOrderData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GPayOrderData_payOrderBuilder? _payOrder;
  GPayOrderData_payOrderBuilder get payOrder =>
      _$this._payOrder ??= new GPayOrderData_payOrderBuilder();
  set payOrder(GPayOrderData_payOrderBuilder? payOrder) =>
      _$this._payOrder = payOrder;

  GPayOrderDataBuilder() {
    GPayOrderData._initializeBuilder(this);
  }

  GPayOrderDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _payOrder = $v.payOrder?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPayOrderData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPayOrderData;
  }

  @override
  void update(void Function(GPayOrderDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPayOrderData build() {
    _$GPayOrderData _$result;
    try {
      _$result = _$v ??
          new _$GPayOrderData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GPayOrderData', 'G__typename'),
              payOrder: _payOrder?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'payOrder';
        _payOrder?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GPayOrderData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPayOrderData_payOrder extends GPayOrderData_payOrder {
  @override
  final String G__typename;
  @override
  final String payload;

  factory _$GPayOrderData_payOrder(
          [void Function(GPayOrderData_payOrderBuilder)? updates]) =>
      (new GPayOrderData_payOrderBuilder()..update(updates)).build();

  _$GPayOrderData_payOrder._({required this.G__typename, required this.payload})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GPayOrderData_payOrder', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        payload, 'GPayOrderData_payOrder', 'payload');
  }

  @override
  GPayOrderData_payOrder rebuild(
          void Function(GPayOrderData_payOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPayOrderData_payOrderBuilder toBuilder() =>
      new GPayOrderData_payOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPayOrderData_payOrder &&
        G__typename == other.G__typename &&
        payload == other.payload;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), payload.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPayOrderData_payOrder')
          ..add('G__typename', G__typename)
          ..add('payload', payload))
        .toString();
  }
}

class GPayOrderData_payOrderBuilder
    implements Builder<GPayOrderData_payOrder, GPayOrderData_payOrderBuilder> {
  _$GPayOrderData_payOrder? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _payload;
  String? get payload => _$this._payload;
  set payload(String? payload) => _$this._payload = payload;

  GPayOrderData_payOrderBuilder() {
    GPayOrderData_payOrder._initializeBuilder(this);
  }

  GPayOrderData_payOrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _payload = $v.payload;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPayOrderData_payOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPayOrderData_payOrder;
  }

  @override
  void update(void Function(GPayOrderData_payOrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPayOrderData_payOrder build() {
    final _$result = _$v ??
        new _$GPayOrderData_payOrder._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GPayOrderData_payOrder', 'G__typename'),
            payload: BuiltValueNullFieldError.checkNotNull(
                payload, 'GPayOrderData_payOrder', 'payload'));
    replace(_$result);
    return _$result;
  }
}

class _$GCancelOrderData extends GCancelOrderData {
  @override
  final String G__typename;
  @override
  final bool? cancelOrder;

  factory _$GCancelOrderData(
          [void Function(GCancelOrderDataBuilder)? updates]) =>
      (new GCancelOrderDataBuilder()..update(updates)).build();

  _$GCancelOrderData._({required this.G__typename, this.cancelOrder})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GCancelOrderData', 'G__typename');
  }

  @override
  GCancelOrderData rebuild(void Function(GCancelOrderDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCancelOrderDataBuilder toBuilder() =>
      new GCancelOrderDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCancelOrderData &&
        G__typename == other.G__typename &&
        cancelOrder == other.cancelOrder;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), cancelOrder.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCancelOrderData')
          ..add('G__typename', G__typename)
          ..add('cancelOrder', cancelOrder))
        .toString();
  }
}

class GCancelOrderDataBuilder
    implements Builder<GCancelOrderData, GCancelOrderDataBuilder> {
  _$GCancelOrderData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _cancelOrder;
  bool? get cancelOrder => _$this._cancelOrder;
  set cancelOrder(bool? cancelOrder) => _$this._cancelOrder = cancelOrder;

  GCancelOrderDataBuilder() {
    GCancelOrderData._initializeBuilder(this);
  }

  GCancelOrderDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _cancelOrder = $v.cancelOrder;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCancelOrderData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCancelOrderData;
  }

  @override
  void update(void Function(GCancelOrderDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCancelOrderData build() {
    final _$result = _$v ??
        new _$GCancelOrderData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GCancelOrderData', 'G__typename'),
            cancelOrder: cancelOrder);
    replace(_$result);
    return _$result;
  }
}

class _$GApplePayData extends GApplePayData {
  @override
  final String G__typename;
  @override
  final bool? applePay;

  factory _$GApplePayData([void Function(GApplePayDataBuilder)? updates]) =>
      (new GApplePayDataBuilder()..update(updates)).build();

  _$GApplePayData._({required this.G__typename, this.applePay}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GApplePayData', 'G__typename');
  }

  @override
  GApplePayData rebuild(void Function(GApplePayDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GApplePayDataBuilder toBuilder() => new GApplePayDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GApplePayData &&
        G__typename == other.G__typename &&
        applePay == other.applePay;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), applePay.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GApplePayData')
          ..add('G__typename', G__typename)
          ..add('applePay', applePay))
        .toString();
  }
}

class GApplePayDataBuilder
    implements Builder<GApplePayData, GApplePayDataBuilder> {
  _$GApplePayData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _applePay;
  bool? get applePay => _$this._applePay;
  set applePay(bool? applePay) => _$this._applePay = applePay;

  GApplePayDataBuilder() {
    GApplePayData._initializeBuilder(this);
  }

  GApplePayDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _applePay = $v.applePay;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GApplePayData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GApplePayData;
  }

  @override
  void update(void Function(GApplePayDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GApplePayData build() {
    final _$result = _$v ??
        new _$GApplePayData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GApplePayData', 'G__typename'),
            applePay: applePay);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
