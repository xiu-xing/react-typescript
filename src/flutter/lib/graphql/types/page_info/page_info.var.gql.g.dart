// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPageInfoFieldsVars> _$gPageInfoFieldsVarsSerializer =
    new _$GPageInfoFieldsVarsSerializer();

class _$GPageInfoFieldsVarsSerializer
    implements StructuredSerializer<GPageInfoFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GPageInfoFieldsVars,
    _$GPageInfoFieldsVars
  ];
  @override
  final String wireName = 'GPageInfoFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPageInfoFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GPageInfoFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GPageInfoFieldsVarsBuilder().build();
  }
}

class _$GPageInfoFieldsVars extends GPageInfoFieldsVars {
  factory _$GPageInfoFieldsVars(
          [void Function(GPageInfoFieldsVarsBuilder)? updates]) =>
      (new GPageInfoFieldsVarsBuilder()..update(updates)).build();

  _$GPageInfoFieldsVars._() : super._();

  @override
  GPageInfoFieldsVars rebuild(
          void Function(GPageInfoFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPageInfoFieldsVarsBuilder toBuilder() =>
      new GPageInfoFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPageInfoFieldsVars;
  }

  @override
  int get hashCode {
    return 121221869;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GPageInfoFieldsVars').toString();
  }
}

class GPageInfoFieldsVarsBuilder
    implements Builder<GPageInfoFieldsVars, GPageInfoFieldsVarsBuilder> {
  _$GPageInfoFieldsVars? _$v;

  GPageInfoFieldsVarsBuilder();

  @override
  void replace(GPageInfoFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPageInfoFieldsVars;
  }

  @override
  void update(void Function(GPageInfoFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPageInfoFieldsVars build() {
    final _$result = _$v ?? new _$GPageInfoFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
