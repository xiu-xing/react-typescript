// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserInfoVars> _$gUserInfoVarsSerializer =
    new _$GUserInfoVarsSerializer();
Serializer<GUserProfileVars> _$gUserProfileVarsSerializer =
    new _$GUserProfileVarsSerializer();
Serializer<GUserPremiumSubscriptionBalanceVars>
    _$gUserPremiumSubscriptionBalanceVarsSerializer =
    new _$GUserPremiumSubscriptionBalanceVarsSerializer();

class _$GUserInfoVarsSerializer implements StructuredSerializer<GUserInfoVars> {
  @override
  final Iterable<Type> types = const [GUserInfoVars, _$GUserInfoVars];
  @override
  final String wireName = 'GUserInfoVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserInfoVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GUserInfoVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GUserInfoVarsBuilder().build();
  }
}

class _$GUserProfileVarsSerializer
    implements StructuredSerializer<GUserProfileVars> {
  @override
  final Iterable<Type> types = const [GUserProfileVars, _$GUserProfileVars];
  @override
  final String wireName = 'GUserProfileVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserProfileVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GUserProfileVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GUserProfileVarsBuilder().build();
  }
}

class _$GUserPremiumSubscriptionBalanceVarsSerializer
    implements StructuredSerializer<GUserPremiumSubscriptionBalanceVars> {
  @override
  final Iterable<Type> types = const [
    GUserPremiumSubscriptionBalanceVars,
    _$GUserPremiumSubscriptionBalanceVars
  ];
  @override
  final String wireName = 'GUserPremiumSubscriptionBalanceVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserPremiumSubscriptionBalanceVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GUserPremiumSubscriptionBalanceVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GUserPremiumSubscriptionBalanceVarsBuilder().build();
  }
}

class _$GUserInfoVars extends GUserInfoVars {
  factory _$GUserInfoVars([void Function(GUserInfoVarsBuilder)? updates]) =>
      (new GUserInfoVarsBuilder()..update(updates)).build();

  _$GUserInfoVars._() : super._();

  @override
  GUserInfoVars rebuild(void Function(GUserInfoVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserInfoVarsBuilder toBuilder() => new GUserInfoVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserInfoVars;
  }

  @override
  int get hashCode {
    return 311676659;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GUserInfoVars').toString();
  }
}

class GUserInfoVarsBuilder
    implements Builder<GUserInfoVars, GUserInfoVarsBuilder> {
  _$GUserInfoVars? _$v;

  GUserInfoVarsBuilder();

  @override
  void replace(GUserInfoVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserInfoVars;
  }

  @override
  void update(void Function(GUserInfoVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserInfoVars build() {
    final _$result = _$v ?? new _$GUserInfoVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GUserProfileVars extends GUserProfileVars {
  factory _$GUserProfileVars(
          [void Function(GUserProfileVarsBuilder)? updates]) =>
      (new GUserProfileVarsBuilder()..update(updates)).build();

  _$GUserProfileVars._() : super._();

  @override
  GUserProfileVars rebuild(void Function(GUserProfileVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserProfileVarsBuilder toBuilder() =>
      new GUserProfileVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserProfileVars;
  }

  @override
  int get hashCode {
    return 580082734;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GUserProfileVars').toString();
  }
}

class GUserProfileVarsBuilder
    implements Builder<GUserProfileVars, GUserProfileVarsBuilder> {
  _$GUserProfileVars? _$v;

  GUserProfileVarsBuilder();

  @override
  void replace(GUserProfileVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserProfileVars;
  }

  @override
  void update(void Function(GUserProfileVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserProfileVars build() {
    final _$result = _$v ?? new _$GUserProfileVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GUserPremiumSubscriptionBalanceVars
    extends GUserPremiumSubscriptionBalanceVars {
  factory _$GUserPremiumSubscriptionBalanceVars(
          [void Function(GUserPremiumSubscriptionBalanceVarsBuilder)?
              updates]) =>
      (new GUserPremiumSubscriptionBalanceVarsBuilder()..update(updates))
          .build();

  _$GUserPremiumSubscriptionBalanceVars._() : super._();

  @override
  GUserPremiumSubscriptionBalanceVars rebuild(
          void Function(GUserPremiumSubscriptionBalanceVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserPremiumSubscriptionBalanceVarsBuilder toBuilder() =>
      new GUserPremiumSubscriptionBalanceVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserPremiumSubscriptionBalanceVars;
  }

  @override
  int get hashCode {
    return 322792804;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GUserPremiumSubscriptionBalanceVars')
        .toString();
  }
}

class GUserPremiumSubscriptionBalanceVarsBuilder
    implements
        Builder<GUserPremiumSubscriptionBalanceVars,
            GUserPremiumSubscriptionBalanceVarsBuilder> {
  _$GUserPremiumSubscriptionBalanceVars? _$v;

  GUserPremiumSubscriptionBalanceVarsBuilder();

  @override
  void replace(GUserPremiumSubscriptionBalanceVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserPremiumSubscriptionBalanceVars;
  }

  @override
  void update(
      void Function(GUserPremiumSubscriptionBalanceVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserPremiumSubscriptionBalanceVars build() {
    final _$result = _$v ?? new _$GUserPremiumSubscriptionBalanceVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
