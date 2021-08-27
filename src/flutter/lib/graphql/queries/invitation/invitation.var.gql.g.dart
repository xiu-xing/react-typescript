// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GInvitationVars> _$gInvitationVarsSerializer =
    new _$GInvitationVarsSerializer();
Serializer<GInvitationDetailVars> _$gInvitationDetailVarsSerializer =
    new _$GInvitationDetailVarsSerializer();

class _$GInvitationVarsSerializer
    implements StructuredSerializer<GInvitationVars> {
  @override
  final Iterable<Type> types = const [GInvitationVars, _$GInvitationVars];
  @override
  final String wireName = 'GInvitationVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GInvitationVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'teamID',
      serializers.serialize(object.teamID,
          specifiedType: const FullType(String)),
      'expiredHour',
      serializers.serialize(object.expiredHour,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GInvitationVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInvitationVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'teamID':
          result.teamID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'expiredHour':
          result.expiredHour = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GInvitationDetailVarsSerializer
    implements StructuredSerializer<GInvitationDetailVars> {
  @override
  final Iterable<Type> types = const [
    GInvitationDetailVars,
    _$GInvitationDetailVars
  ];
  @override
  final String wireName = 'GInvitationDetailVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GInvitationDetailVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'invitationCode',
      serializers.serialize(object.invitationCode,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GInvitationDetailVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInvitationDetailVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'invitationCode':
          result.invitationCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GInvitationVars extends GInvitationVars {
  @override
  final String teamID;
  @override
  final int expiredHour;

  factory _$GInvitationVars([void Function(GInvitationVarsBuilder)? updates]) =>
      (new GInvitationVarsBuilder()..update(updates)).build();

  _$GInvitationVars._({required this.teamID, required this.expiredHour})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(teamID, 'GInvitationVars', 'teamID');
    BuiltValueNullFieldError.checkNotNull(
        expiredHour, 'GInvitationVars', 'expiredHour');
  }

  @override
  GInvitationVars rebuild(void Function(GInvitationVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInvitationVarsBuilder toBuilder() =>
      new GInvitationVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInvitationVars &&
        teamID == other.teamID &&
        expiredHour == other.expiredHour;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, teamID.hashCode), expiredHour.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInvitationVars')
          ..add('teamID', teamID)
          ..add('expiredHour', expiredHour))
        .toString();
  }
}

class GInvitationVarsBuilder
    implements Builder<GInvitationVars, GInvitationVarsBuilder> {
  _$GInvitationVars? _$v;

  String? _teamID;
  String? get teamID => _$this._teamID;
  set teamID(String? teamID) => _$this._teamID = teamID;

  int? _expiredHour;
  int? get expiredHour => _$this._expiredHour;
  set expiredHour(int? expiredHour) => _$this._expiredHour = expiredHour;

  GInvitationVarsBuilder();

  GInvitationVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _teamID = $v.teamID;
      _expiredHour = $v.expiredHour;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInvitationVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInvitationVars;
  }

  @override
  void update(void Function(GInvitationVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInvitationVars build() {
    final _$result = _$v ??
        new _$GInvitationVars._(
            teamID: BuiltValueNullFieldError.checkNotNull(
                teamID, 'GInvitationVars', 'teamID'),
            expiredHour: BuiltValueNullFieldError.checkNotNull(
                expiredHour, 'GInvitationVars', 'expiredHour'));
    replace(_$result);
    return _$result;
  }
}

class _$GInvitationDetailVars extends GInvitationDetailVars {
  @override
  final String invitationCode;

  factory _$GInvitationDetailVars(
          [void Function(GInvitationDetailVarsBuilder)? updates]) =>
      (new GInvitationDetailVarsBuilder()..update(updates)).build();

  _$GInvitationDetailVars._({required this.invitationCode}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        invitationCode, 'GInvitationDetailVars', 'invitationCode');
  }

  @override
  GInvitationDetailVars rebuild(
          void Function(GInvitationDetailVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInvitationDetailVarsBuilder toBuilder() =>
      new GInvitationDetailVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInvitationDetailVars &&
        invitationCode == other.invitationCode;
  }

  @override
  int get hashCode {
    return $jf($jc(0, invitationCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInvitationDetailVars')
          ..add('invitationCode', invitationCode))
        .toString();
  }
}

class GInvitationDetailVarsBuilder
    implements Builder<GInvitationDetailVars, GInvitationDetailVarsBuilder> {
  _$GInvitationDetailVars? _$v;

  String? _invitationCode;
  String? get invitationCode => _$this._invitationCode;
  set invitationCode(String? invitationCode) =>
      _$this._invitationCode = invitationCode;

  GInvitationDetailVarsBuilder();

  GInvitationDetailVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _invitationCode = $v.invitationCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInvitationDetailVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInvitationDetailVars;
  }

  @override
  void update(void Function(GInvitationDetailVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInvitationDetailVars build() {
    final _$result = _$v ??
        new _$GInvitationDetailVars._(
            invitationCode: BuiltValueNullFieldError.checkNotNull(
                invitationCode, 'GInvitationDetailVars', 'invitationCode'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
