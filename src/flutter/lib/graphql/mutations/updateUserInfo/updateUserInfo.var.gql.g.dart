// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateUserInfo.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateUserInfoVars> _$gUpdateUserInfoVarsSerializer =
    new _$GUpdateUserInfoVarsSerializer();

class _$GUpdateUserInfoVarsSerializer
    implements StructuredSerializer<GUpdateUserInfoVars> {
  @override
  final Iterable<Type> types = const [
    GUpdateUserInfoVars,
    _$GUpdateUserInfoVars
  ];
  @override
  final String wireName = 'GUpdateUserInfoVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateUserInfoVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.input;
    if (value != null) {
      result
        ..add('input')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.GUpdateUserInfoInput)));
    }
    return result;
  }

  @override
  GUpdateUserInfoVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateUserInfoVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GUpdateUserInfoInput))!
              as _i1.GUpdateUserInfoInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateUserInfoVars extends GUpdateUserInfoVars {
  @override
  final _i1.GUpdateUserInfoInput? input;

  factory _$GUpdateUserInfoVars(
          [void Function(GUpdateUserInfoVarsBuilder)? updates]) =>
      (new GUpdateUserInfoVarsBuilder()..update(updates)).build();

  _$GUpdateUserInfoVars._({this.input}) : super._();

  @override
  GUpdateUserInfoVars rebuild(
          void Function(GUpdateUserInfoVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserInfoVarsBuilder toBuilder() =>
      new GUpdateUserInfoVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserInfoVars && input == other.input;
  }

  @override
  int get hashCode {
    return $jf($jc(0, input.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUpdateUserInfoVars')
          ..add('input', input))
        .toString();
  }
}

class GUpdateUserInfoVarsBuilder
    implements Builder<GUpdateUserInfoVars, GUpdateUserInfoVarsBuilder> {
  _$GUpdateUserInfoVars? _$v;

  _i1.GUpdateUserInfoInputBuilder? _input;
  _i1.GUpdateUserInfoInputBuilder get input =>
      _$this._input ??= new _i1.GUpdateUserInfoInputBuilder();
  set input(_i1.GUpdateUserInfoInputBuilder? input) => _$this._input = input;

  GUpdateUserInfoVarsBuilder();

  GUpdateUserInfoVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateUserInfoVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserInfoVars;
  }

  @override
  void update(void Function(GUpdateUserInfoVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateUserInfoVars build() {
    _$GUpdateUserInfoVars _$result;
    try {
      _$result = _$v ?? new _$GUpdateUserInfoVars._(input: _input?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        _input?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUpdateUserInfoVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
