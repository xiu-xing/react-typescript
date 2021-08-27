// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_nodes_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GNewsFieldsVars> _$gNewsFieldsVarsSerializer =
    new _$GNewsFieldsVarsSerializer();

class _$GNewsFieldsVarsSerializer
    implements StructuredSerializer<GNewsFieldsVars> {
  @override
  final Iterable<Type> types = const [GNewsFieldsVars, _$GNewsFieldsVars];
  @override
  final String wireName = 'GNewsFieldsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GNewsFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GNewsFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GNewsFieldsVarsBuilder().build();
  }
}

class _$GNewsFieldsVars extends GNewsFieldsVars {
  factory _$GNewsFieldsVars([void Function(GNewsFieldsVarsBuilder)? updates]) =>
      (new GNewsFieldsVarsBuilder()..update(updates)).build();

  _$GNewsFieldsVars._() : super._();

  @override
  GNewsFieldsVars rebuild(void Function(GNewsFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNewsFieldsVarsBuilder toBuilder() =>
      new GNewsFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNewsFieldsVars;
  }

  @override
  int get hashCode {
    return 636392754;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GNewsFieldsVars').toString();
  }
}

class GNewsFieldsVarsBuilder
    implements Builder<GNewsFieldsVars, GNewsFieldsVarsBuilder> {
  _$GNewsFieldsVars? _$v;

  GNewsFieldsVarsBuilder();

  @override
  void replace(GNewsFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GNewsFieldsVars;
  }

  @override
  void update(void Function(GNewsFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GNewsFieldsVars build() {
    final _$result = _$v ?? new _$GNewsFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
