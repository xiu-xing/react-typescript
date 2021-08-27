// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_card.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GBusinessCardDetailVars> _$gBusinessCardDetailVarsSerializer =
    new _$GBusinessCardDetailVarsSerializer();

class _$GBusinessCardDetailVarsSerializer
    implements StructuredSerializer<GBusinessCardDetailVars> {
  @override
  final Iterable<Type> types = const [
    GBusinessCardDetailVars,
    _$GBusinessCardDetailVars
  ];
  @override
  final String wireName = 'GBusinessCardDetailVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GBusinessCardDetailVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GBusinessCardDetailVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GBusinessCardDetailVarsBuilder().build();
  }
}

class _$GBusinessCardDetailVars extends GBusinessCardDetailVars {
  factory _$GBusinessCardDetailVars(
          [void Function(GBusinessCardDetailVarsBuilder)? updates]) =>
      (new GBusinessCardDetailVarsBuilder()..update(updates)).build();

  _$GBusinessCardDetailVars._() : super._();

  @override
  GBusinessCardDetailVars rebuild(
          void Function(GBusinessCardDetailVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBusinessCardDetailVarsBuilder toBuilder() =>
      new GBusinessCardDetailVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBusinessCardDetailVars;
  }

  @override
  int get hashCode {
    return 72877473;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GBusinessCardDetailVars').toString();
  }
}

class GBusinessCardDetailVarsBuilder
    implements
        Builder<GBusinessCardDetailVars, GBusinessCardDetailVarsBuilder> {
  _$GBusinessCardDetailVars? _$v;

  GBusinessCardDetailVarsBuilder();

  @override
  void replace(GBusinessCardDetailVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GBusinessCardDetailVars;
  }

  @override
  void update(void Function(GBusinessCardDetailVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GBusinessCardDetailVars build() {
    final _$result = _$v ?? new _$GBusinessCardDetailVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
