// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserProfileFieldsVars> _$gUserProfileFieldsVarsSerializer =
    new _$GUserProfileFieldsVarsSerializer();

class _$GUserProfileFieldsVarsSerializer
    implements StructuredSerializer<GUserProfileFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GUserProfileFieldsVars,
    _$GUserProfileFieldsVars
  ];
  @override
  final String wireName = 'GUserProfileFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserProfileFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GUserProfileFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GUserProfileFieldsVarsBuilder().build();
  }
}

class _$GUserProfileFieldsVars extends GUserProfileFieldsVars {
  factory _$GUserProfileFieldsVars(
          [void Function(GUserProfileFieldsVarsBuilder)? updates]) =>
      (new GUserProfileFieldsVarsBuilder()..update(updates)).build();

  _$GUserProfileFieldsVars._() : super._();

  @override
  GUserProfileFieldsVars rebuild(
          void Function(GUserProfileFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserProfileFieldsVarsBuilder toBuilder() =>
      new GUserProfileFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserProfileFieldsVars;
  }

  @override
  int get hashCode {
    return 335712720;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GUserProfileFieldsVars').toString();
  }
}

class GUserProfileFieldsVarsBuilder
    implements Builder<GUserProfileFieldsVars, GUserProfileFieldsVarsBuilder> {
  _$GUserProfileFieldsVars? _$v;

  GUserProfileFieldsVarsBuilder();

  @override
  void replace(GUserProfileFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserProfileFieldsVars;
  }

  @override
  void update(void Function(GUserProfileFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserProfileFieldsVars build() {
    final _$result = _$v ?? new _$GUserProfileFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
