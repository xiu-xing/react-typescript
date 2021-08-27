// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCommodityVars> _$gCommodityVarsSerializer =
    new _$GCommodityVarsSerializer();
Serializer<GCheckPaymentVars> _$gCheckPaymentVarsSerializer =
    new _$GCheckPaymentVarsSerializer();
Serializer<GUserOrdersVars> _$gUserOrdersVarsSerializer =
    new _$GUserOrdersVarsSerializer();
Serializer<GOrderByIDVars> _$gOrderByIDVarsSerializer =
    new _$GOrderByIDVarsSerializer();

class _$GCommodityVarsSerializer
    implements StructuredSerializer<GCommodityVars> {
  @override
  final Iterable<Type> types = const [GCommodityVars, _$GCommodityVars];
  @override
  final String wireName = 'GCommodityVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCommodityVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'osType',
      serializers.serialize(object.osType,
          specifiedType: const FullType(_i1.GOSType)),
    ];

    return result;
  }

  @override
  GCommodityVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCommodityVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'osType':
          result.osType = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GOSType)) as _i1.GOSType;
          break;
      }
    }

    return result.build();
  }
}

class _$GCheckPaymentVarsSerializer
    implements StructuredSerializer<GCheckPaymentVars> {
  @override
  final Iterable<Type> types = const [GCheckPaymentVars, _$GCheckPaymentVars];
  @override
  final String wireName = 'GCheckPaymentVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCheckPaymentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'orderID',
      serializers.serialize(object.orderID,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCheckPaymentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCheckPaymentVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'orderID':
          result.orderID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserOrdersVarsSerializer
    implements StructuredSerializer<GUserOrdersVars> {
  @override
  final Iterable<Type> types = const [GUserOrdersVars, _$GUserOrdersVars];
  @override
  final String wireName = 'GUserOrdersVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserOrdersVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GUserOrdersVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserOrdersVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GOrderByIDVarsSerializer
    implements StructuredSerializer<GOrderByIDVars> {
  @override
  final Iterable<Type> types = const [GOrderByIDVars, _$GOrderByIDVars];
  @override
  final String wireName = 'GOrderByIDVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GOrderByIDVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'orderID',
      serializers.serialize(object.orderID,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GOrderByIDVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GOrderByIDVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'orderID':
          result.orderID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCommodityVars extends GCommodityVars {
  @override
  final _i1.GOSType osType;

  factory _$GCommodityVars([void Function(GCommodityVarsBuilder)? updates]) =>
      (new GCommodityVarsBuilder()..update(updates)).build();

  _$GCommodityVars._({required this.osType}) : super._() {
    BuiltValueNullFieldError.checkNotNull(osType, 'GCommodityVars', 'osType');
  }

  @override
  GCommodityVars rebuild(void Function(GCommodityVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCommodityVarsBuilder toBuilder() =>
      new GCommodityVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCommodityVars && osType == other.osType;
  }

  @override
  int get hashCode {
    return $jf($jc(0, osType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCommodityVars')
          ..add('osType', osType))
        .toString();
  }
}

class GCommodityVarsBuilder
    implements Builder<GCommodityVars, GCommodityVarsBuilder> {
  _$GCommodityVars? _$v;

  _i1.GOSType? _osType;
  _i1.GOSType? get osType => _$this._osType;
  set osType(_i1.GOSType? osType) => _$this._osType = osType;

  GCommodityVarsBuilder();

  GCommodityVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _osType = $v.osType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCommodityVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCommodityVars;
  }

  @override
  void update(void Function(GCommodityVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCommodityVars build() {
    final _$result = _$v ??
        new _$GCommodityVars._(
            osType: BuiltValueNullFieldError.checkNotNull(
                osType, 'GCommodityVars', 'osType'));
    replace(_$result);
    return _$result;
  }
}

class _$GCheckPaymentVars extends GCheckPaymentVars {
  @override
  final String orderID;

  factory _$GCheckPaymentVars(
          [void Function(GCheckPaymentVarsBuilder)? updates]) =>
      (new GCheckPaymentVarsBuilder()..update(updates)).build();

  _$GCheckPaymentVars._({required this.orderID}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        orderID, 'GCheckPaymentVars', 'orderID');
  }

  @override
  GCheckPaymentVars rebuild(void Function(GCheckPaymentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCheckPaymentVarsBuilder toBuilder() =>
      new GCheckPaymentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCheckPaymentVars && orderID == other.orderID;
  }

  @override
  int get hashCode {
    return $jf($jc(0, orderID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCheckPaymentVars')
          ..add('orderID', orderID))
        .toString();
  }
}

class GCheckPaymentVarsBuilder
    implements Builder<GCheckPaymentVars, GCheckPaymentVarsBuilder> {
  _$GCheckPaymentVars? _$v;

  String? _orderID;
  String? get orderID => _$this._orderID;
  set orderID(String? orderID) => _$this._orderID = orderID;

  GCheckPaymentVarsBuilder();

  GCheckPaymentVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderID = $v.orderID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCheckPaymentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCheckPaymentVars;
  }

  @override
  void update(void Function(GCheckPaymentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCheckPaymentVars build() {
    final _$result = _$v ??
        new _$GCheckPaymentVars._(
            orderID: BuiltValueNullFieldError.checkNotNull(
                orderID, 'GCheckPaymentVars', 'orderID'));
    replace(_$result);
    return _$result;
  }
}

class _$GUserOrdersVars extends GUserOrdersVars {
  @override
  final int offset;
  @override
  final int limit;

  factory _$GUserOrdersVars([void Function(GUserOrdersVarsBuilder)? updates]) =>
      (new GUserOrdersVarsBuilder()..update(updates)).build();

  _$GUserOrdersVars._({required this.offset, required this.limit}) : super._() {
    BuiltValueNullFieldError.checkNotNull(offset, 'GUserOrdersVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, 'GUserOrdersVars', 'limit');
  }

  @override
  GUserOrdersVars rebuild(void Function(GUserOrdersVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserOrdersVarsBuilder toBuilder() =>
      new GUserOrdersVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserOrdersVars &&
        offset == other.offset &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, offset.hashCode), limit.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUserOrdersVars')
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GUserOrdersVarsBuilder
    implements Builder<GUserOrdersVars, GUserOrdersVarsBuilder> {
  _$GUserOrdersVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GUserOrdersVarsBuilder();

  GUserOrdersVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserOrdersVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserOrdersVars;
  }

  @override
  void update(void Function(GUserOrdersVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserOrdersVars build() {
    final _$result = _$v ??
        new _$GUserOrdersVars._(
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, 'GUserOrdersVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, 'GUserOrdersVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

class _$GOrderByIDVars extends GOrderByIDVars {
  @override
  final String orderID;

  factory _$GOrderByIDVars([void Function(GOrderByIDVarsBuilder)? updates]) =>
      (new GOrderByIDVarsBuilder()..update(updates)).build();

  _$GOrderByIDVars._({required this.orderID}) : super._() {
    BuiltValueNullFieldError.checkNotNull(orderID, 'GOrderByIDVars', 'orderID');
  }

  @override
  GOrderByIDVars rebuild(void Function(GOrderByIDVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GOrderByIDVarsBuilder toBuilder() =>
      new GOrderByIDVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GOrderByIDVars && orderID == other.orderID;
  }

  @override
  int get hashCode {
    return $jf($jc(0, orderID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GOrderByIDVars')
          ..add('orderID', orderID))
        .toString();
  }
}

class GOrderByIDVarsBuilder
    implements Builder<GOrderByIDVars, GOrderByIDVarsBuilder> {
  _$GOrderByIDVars? _$v;

  String? _orderID;
  String? get orderID => _$this._orderID;
  set orderID(String? orderID) => _$this._orderID = orderID;

  GOrderByIDVarsBuilder();

  GOrderByIDVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderID = $v.orderID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GOrderByIDVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GOrderByIDVars;
  }

  @override
  void update(void Function(GOrderByIDVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GOrderByIDVars build() {
    final _$result = _$v ??
        new _$GOrderByIDVars._(
            orderID: BuiltValueNullFieldError.checkNotNull(
                orderID, 'GOrderByIDVars', 'orderID'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
