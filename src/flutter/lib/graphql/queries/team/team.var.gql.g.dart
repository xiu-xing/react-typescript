// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTeamsVars> _$gTeamsVarsSerializer = new _$GTeamsVarsSerializer();
Serializer<GIsEmailBindingRequiredVars>
    _$gIsEmailBindingRequiredVarsSerializer =
    new _$GIsEmailBindingRequiredVarsSerializer();

class _$GTeamsVarsSerializer implements StructuredSerializer<GTeamsVars> {
  @override
  final Iterable<Type> types = const [GTeamsVars, _$GTeamsVars];
  @override
  final String wireName = 'GTeamsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTeamsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GTeamsVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GTeamsVarsBuilder().build();
  }
}

class _$GIsEmailBindingRequiredVarsSerializer
    implements StructuredSerializer<GIsEmailBindingRequiredVars> {
  @override
  final Iterable<Type> types = const [
    GIsEmailBindingRequiredVars,
    _$GIsEmailBindingRequiredVars
  ];
  @override
  final String wireName = 'GIsEmailBindingRequiredVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GIsEmailBindingRequiredVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GIsEmailBindingRequiredVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GIsEmailBindingRequiredVarsBuilder().build();
  }
}

class _$GTeamsVars extends GTeamsVars {
  factory _$GTeamsVars([void Function(GTeamsVarsBuilder)? updates]) =>
      (new GTeamsVarsBuilder()..update(updates)).build();

  _$GTeamsVars._() : super._();

  @override
  GTeamsVars rebuild(void Function(GTeamsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTeamsVarsBuilder toBuilder() => new GTeamsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTeamsVars;
  }

  @override
  int get hashCode {
    return 159497017;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GTeamsVars').toString();
  }
}

class GTeamsVarsBuilder implements Builder<GTeamsVars, GTeamsVarsBuilder> {
  _$GTeamsVars? _$v;

  GTeamsVarsBuilder();

  @override
  void replace(GTeamsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTeamsVars;
  }

  @override
  void update(void Function(GTeamsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GTeamsVars build() {
    final _$result = _$v ?? new _$GTeamsVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GIsEmailBindingRequiredVars extends GIsEmailBindingRequiredVars {
  factory _$GIsEmailBindingRequiredVars(
          [void Function(GIsEmailBindingRequiredVarsBuilder)? updates]) =>
      (new GIsEmailBindingRequiredVarsBuilder()..update(updates)).build();

  _$GIsEmailBindingRequiredVars._() : super._();

  @override
  GIsEmailBindingRequiredVars rebuild(
          void Function(GIsEmailBindingRequiredVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GIsEmailBindingRequiredVarsBuilder toBuilder() =>
      new GIsEmailBindingRequiredVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GIsEmailBindingRequiredVars;
  }

  @override
  int get hashCode {
    return 1048909791;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GIsEmailBindingRequiredVars')
        .toString();
  }
}

class GIsEmailBindingRequiredVarsBuilder
    implements
        Builder<GIsEmailBindingRequiredVars,
            GIsEmailBindingRequiredVarsBuilder> {
  _$GIsEmailBindingRequiredVars? _$v;

  GIsEmailBindingRequiredVarsBuilder();

  @override
  void replace(GIsEmailBindingRequiredVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GIsEmailBindingRequiredVars;
  }

  @override
  void update(void Function(GIsEmailBindingRequiredVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GIsEmailBindingRequiredVars build() {
    final _$result = _$v ?? new _$GIsEmailBindingRequiredVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
