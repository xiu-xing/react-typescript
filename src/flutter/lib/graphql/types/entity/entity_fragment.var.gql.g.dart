// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GEntityFieldsVars> _$gEntityFieldsVarsSerializer =
    new _$GEntityFieldsVarsSerializer();

class _$GEntityFieldsVarsSerializer
    implements StructuredSerializer<GEntityFieldsVars> {
  @override
  final Iterable<Type> types = const [GEntityFieldsVars, _$GEntityFieldsVars];
  @override
  final String wireName = 'GEntityFieldsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GEntityFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GEntityFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GEntityFieldsVarsBuilder().build();
  }
}

class _$GEntityFieldsVars extends GEntityFieldsVars {
  factory _$GEntityFieldsVars(
          [void Function(GEntityFieldsVarsBuilder)? updates]) =>
      (new GEntityFieldsVarsBuilder()..update(updates)).build();

  _$GEntityFieldsVars._() : super._();

  @override
  GEntityFieldsVars rebuild(void Function(GEntityFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GEntityFieldsVarsBuilder toBuilder() =>
      new GEntityFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GEntityFieldsVars;
  }

  @override
  int get hashCode {
    return 215679368;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GEntityFieldsVars').toString();
  }
}

class GEntityFieldsVarsBuilder
    implements Builder<GEntityFieldsVars, GEntityFieldsVarsBuilder> {
  _$GEntityFieldsVars? _$v;

  GEntityFieldsVarsBuilder();

  @override
  void replace(GEntityFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GEntityFieldsVars;
  }

  @override
  void update(void Function(GEntityFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GEntityFieldsVars build() {
    final _$result = _$v ?? new _$GEntityFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
