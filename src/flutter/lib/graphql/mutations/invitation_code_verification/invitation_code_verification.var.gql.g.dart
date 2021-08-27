// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_code_verification.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GInvitationCodeVerifyVars> _$gInvitationCodeVerifyVarsSerializer =
    new _$GInvitationCodeVerifyVarsSerializer();

class _$GInvitationCodeVerifyVarsSerializer
    implements StructuredSerializer<GInvitationCodeVerifyVars> {
  @override
  final Iterable<Type> types = const [
    GInvitationCodeVerifyVars,
    _$GInvitationCodeVerifyVars
  ];
  @override
  final String wireName = 'GInvitationCodeVerifyVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GInvitationCodeVerifyVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GInvitationCodeVerifyVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInvitationCodeVerifyVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GInvitationCodeVerifyVars extends GInvitationCodeVerifyVars {
  @override
  final String code;

  factory _$GInvitationCodeVerifyVars(
          [void Function(GInvitationCodeVerifyVarsBuilder)? updates]) =>
      (new GInvitationCodeVerifyVarsBuilder()..update(updates)).build();

  _$GInvitationCodeVerifyVars._({required this.code}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        code, 'GInvitationCodeVerifyVars', 'code');
  }

  @override
  GInvitationCodeVerifyVars rebuild(
          void Function(GInvitationCodeVerifyVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInvitationCodeVerifyVarsBuilder toBuilder() =>
      new GInvitationCodeVerifyVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInvitationCodeVerifyVars && code == other.code;
  }

  @override
  int get hashCode {
    return $jf($jc(0, code.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInvitationCodeVerifyVars')
          ..add('code', code))
        .toString();
  }
}

class GInvitationCodeVerifyVarsBuilder
    implements
        Builder<GInvitationCodeVerifyVars, GInvitationCodeVerifyVarsBuilder> {
  _$GInvitationCodeVerifyVars? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  GInvitationCodeVerifyVarsBuilder();

  GInvitationCodeVerifyVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInvitationCodeVerifyVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInvitationCodeVerifyVars;
  }

  @override
  void update(void Function(GInvitationCodeVerifyVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInvitationCodeVerifyVars build() {
    final _$result = _$v ??
        new _$GInvitationCodeVerifyVars._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, 'GInvitationCodeVerifyVars', 'code'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
