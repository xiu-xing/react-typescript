// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateOrderVars> _$gCreateOrderVarsSerializer =
    new _$GCreateOrderVarsSerializer();
Serializer<GPayOrderVars> _$gPayOrderVarsSerializer =
    new _$GPayOrderVarsSerializer();
Serializer<GCancelOrderVars> _$gCancelOrderVarsSerializer =
    new _$GCancelOrderVarsSerializer();
Serializer<GApplePayVars> _$gApplePayVarsSerializer =
    new _$GApplePayVarsSerializer();

class _$GCreateOrderVarsSerializer
    implements StructuredSerializer<GCreateOrderVars> {
  @override
  final Iterable<Type> types = const [GCreateOrderVars, _$GCreateOrderVars];
  @override
  final String wireName = 'GCreateOrderVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateOrderVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GCreateOrderRequest)),
    ];

    return result;
  }

  @override
  GCreateOrderVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateOrderVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GCreateOrderRequest))!
              as _i1.GCreateOrderRequest);
          break;
      }
    }

    return result.build();
  }
}

class _$GPayOrderVarsSerializer implements StructuredSerializer<GPayOrderVars> {
  @override
  final Iterable<Type> types = const [GPayOrderVars, _$GPayOrderVars];
  @override
  final String wireName = 'GPayOrderVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPayOrderVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GPayOrderRequest)),
    ];

    return result;
  }

  @override
  GPayOrderVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPayOrderVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GPayOrderRequest))!
              as _i1.GPayOrderRequest);
          break;
      }
    }

    return result.build();
  }
}

class _$GCancelOrderVarsSerializer
    implements StructuredSerializer<GCancelOrderVars> {
  @override
  final Iterable<Type> types = const [GCancelOrderVars, _$GCancelOrderVars];
  @override
  final String wireName = 'GCancelOrderVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCancelOrderVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GCancelOrderRequest)),
    ];

    return result;
  }

  @override
  GCancelOrderVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCancelOrderVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GCancelOrderRequest))!
              as _i1.GCancelOrderRequest);
          break;
      }
    }

    return result.build();
  }
}

class _$GApplePayVarsSerializer implements StructuredSerializer<GApplePayVars> {
  @override
  final Iterable<Type> types = const [GApplePayVars, _$GApplePayVars];
  @override
  final String wireName = 'GApplePayVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GApplePayVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.input;
    if (value != null) {
      result
        ..add('input')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.GApplePayRequest)));
    }
    return result;
  }

  @override
  GApplePayVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GApplePayVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GApplePayRequest))!
              as _i1.GApplePayRequest);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateOrderVars extends GCreateOrderVars {
  @override
  final _i1.GCreateOrderRequest input;

  factory _$GCreateOrderVars(
          [void Function(GCreateOrderVarsBuilder)? updates]) =>
      (new GCreateOrderVarsBuilder()..update(updates)).build();

  _$GCreateOrderVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, 'GCreateOrderVars', 'input');
  }

  @override
  GCreateOrderVars rebuild(void Function(GCreateOrderVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateOrderVarsBuilder toBuilder() =>
      new GCreateOrderVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateOrderVars && input == other.input;
  }

  @override
  int get hashCode {
    return $jf($jc(0, input.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCreateOrderVars')
          ..add('input', input))
        .toString();
  }
}

class GCreateOrderVarsBuilder
    implements Builder<GCreateOrderVars, GCreateOrderVarsBuilder> {
  _$GCreateOrderVars? _$v;

  _i1.GCreateOrderRequestBuilder? _input;
  _i1.GCreateOrderRequestBuilder get input =>
      _$this._input ??= new _i1.GCreateOrderRequestBuilder();
  set input(_i1.GCreateOrderRequestBuilder? input) => _$this._input = input;

  GCreateOrderVarsBuilder();

  GCreateOrderVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateOrderVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateOrderVars;
  }

  @override
  void update(void Function(GCreateOrderVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateOrderVars build() {
    _$GCreateOrderVars _$result;
    try {
      _$result = _$v ?? new _$GCreateOrderVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GCreateOrderVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPayOrderVars extends GPayOrderVars {
  @override
  final _i1.GPayOrderRequest input;

  factory _$GPayOrderVars([void Function(GPayOrderVarsBuilder)? updates]) =>
      (new GPayOrderVarsBuilder()..update(updates)).build();

  _$GPayOrderVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, 'GPayOrderVars', 'input');
  }

  @override
  GPayOrderVars rebuild(void Function(GPayOrderVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPayOrderVarsBuilder toBuilder() => new GPayOrderVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPayOrderVars && input == other.input;
  }

  @override
  int get hashCode {
    return $jf($jc(0, input.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPayOrderVars')..add('input', input))
        .toString();
  }
}

class GPayOrderVarsBuilder
    implements Builder<GPayOrderVars, GPayOrderVarsBuilder> {
  _$GPayOrderVars? _$v;

  _i1.GPayOrderRequestBuilder? _input;
  _i1.GPayOrderRequestBuilder get input =>
      _$this._input ??= new _i1.GPayOrderRequestBuilder();
  set input(_i1.GPayOrderRequestBuilder? input) => _$this._input = input;

  GPayOrderVarsBuilder();

  GPayOrderVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPayOrderVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPayOrderVars;
  }

  @override
  void update(void Function(GPayOrderVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPayOrderVars build() {
    _$GPayOrderVars _$result;
    try {
      _$result = _$v ?? new _$GPayOrderVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GPayOrderVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCancelOrderVars extends GCancelOrderVars {
  @override
  final _i1.GCancelOrderRequest input;

  factory _$GCancelOrderVars(
          [void Function(GCancelOrderVarsBuilder)? updates]) =>
      (new GCancelOrderVarsBuilder()..update(updates)).build();

  _$GCancelOrderVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, 'GCancelOrderVars', 'input');
  }

  @override
  GCancelOrderVars rebuild(void Function(GCancelOrderVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCancelOrderVarsBuilder toBuilder() =>
      new GCancelOrderVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCancelOrderVars && input == other.input;
  }

  @override
  int get hashCode {
    return $jf($jc(0, input.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCancelOrderVars')
          ..add('input', input))
        .toString();
  }
}

class GCancelOrderVarsBuilder
    implements Builder<GCancelOrderVars, GCancelOrderVarsBuilder> {
  _$GCancelOrderVars? _$v;

  _i1.GCancelOrderRequestBuilder? _input;
  _i1.GCancelOrderRequestBuilder get input =>
      _$this._input ??= new _i1.GCancelOrderRequestBuilder();
  set input(_i1.GCancelOrderRequestBuilder? input) => _$this._input = input;

  GCancelOrderVarsBuilder();

  GCancelOrderVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCancelOrderVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCancelOrderVars;
  }

  @override
  void update(void Function(GCancelOrderVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCancelOrderVars build() {
    _$GCancelOrderVars _$result;
    try {
      _$result = _$v ?? new _$GCancelOrderVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GCancelOrderVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GApplePayVars extends GApplePayVars {
  @override
  final _i1.GApplePayRequest? input;

  factory _$GApplePayVars([void Function(GApplePayVarsBuilder)? updates]) =>
      (new GApplePayVarsBuilder()..update(updates)).build();

  _$GApplePayVars._({this.input}) : super._();

  @override
  GApplePayVars rebuild(void Function(GApplePayVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GApplePayVarsBuilder toBuilder() => new GApplePayVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GApplePayVars && input == other.input;
  }

  @override
  int get hashCode {
    return $jf($jc(0, input.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GApplePayVars')..add('input', input))
        .toString();
  }
}

class GApplePayVarsBuilder
    implements Builder<GApplePayVars, GApplePayVarsBuilder> {
  _$GApplePayVars? _$v;

  _i1.GApplePayRequestBuilder? _input;
  _i1.GApplePayRequestBuilder get input =>
      _$this._input ??= new _i1.GApplePayRequestBuilder();
  set input(_i1.GApplePayRequestBuilder? input) => _$this._input = input;

  GApplePayVarsBuilder();

  GApplePayVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GApplePayVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GApplePayVars;
  }

  @override
  void update(void Function(GApplePayVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GApplePayVars build() {
    _$GApplePayVars _$result;
    try {
      _$result = _$v ?? new _$GApplePayVars._(input: _input?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        _input?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GApplePayVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
