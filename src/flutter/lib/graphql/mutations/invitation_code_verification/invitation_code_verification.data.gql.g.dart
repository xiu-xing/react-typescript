// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_code_verification.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GInvitationCodeVerifyData> _$gInvitationCodeVerifyDataSerializer =
    new _$GInvitationCodeVerifyDataSerializer();
Serializer<GInvitationCodeVerifyData_invitationCodeVerification>
    _$gInvitationCodeVerifyDataInvitationCodeVerificationSerializer =
    new _$GInvitationCodeVerifyData_invitationCodeVerificationSerializer();

class _$GInvitationCodeVerifyDataSerializer
    implements StructuredSerializer<GInvitationCodeVerifyData> {
  @override
  final Iterable<Type> types = const [
    GInvitationCodeVerifyData,
    _$GInvitationCodeVerifyData
  ];
  @override
  final String wireName = 'GInvitationCodeVerifyData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GInvitationCodeVerifyData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'invitationCodeVerification',
      serializers.serialize(object.invitationCodeVerification,
          specifiedType: const FullType(
              GInvitationCodeVerifyData_invitationCodeVerification)),
    ];

    return result;
  }

  @override
  GInvitationCodeVerifyData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInvitationCodeVerifyDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'invitationCodeVerification':
          result.invitationCodeVerification.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      GInvitationCodeVerifyData_invitationCodeVerification))!
              as GInvitationCodeVerifyData_invitationCodeVerification);
          break;
      }
    }

    return result.build();
  }
}

class _$GInvitationCodeVerifyData_invitationCodeVerificationSerializer
    implements
        StructuredSerializer<
            GInvitationCodeVerifyData_invitationCodeVerification> {
  @override
  final Iterable<Type> types = const [
    GInvitationCodeVerifyData_invitationCodeVerification,
    _$GInvitationCodeVerifyData_invitationCodeVerification
  ];
  @override
  final String wireName =
      'GInvitationCodeVerifyData_invitationCodeVerification';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GInvitationCodeVerifyData_invitationCodeVerification object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.accessTokenString;
    if (value != null) {
      result
        ..add('accessTokenString')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userID;
    if (value != null) {
      result
        ..add('userID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GInvitationCodeVerifyData_invitationCodeVerification deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GInvitationCodeVerifyData_invitationCodeVerificationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'accessTokenString':
          result.accessTokenString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userID':
          result.userID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GInvitationCodeVerifyData extends GInvitationCodeVerifyData {
  @override
  final String G__typename;
  @override
  final GInvitationCodeVerifyData_invitationCodeVerification
      invitationCodeVerification;

  factory _$GInvitationCodeVerifyData(
          [void Function(GInvitationCodeVerifyDataBuilder)? updates]) =>
      (new GInvitationCodeVerifyDataBuilder()..update(updates)).build();

  _$GInvitationCodeVerifyData._(
      {required this.G__typename, required this.invitationCodeVerification})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GInvitationCodeVerifyData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(invitationCodeVerification,
        'GInvitationCodeVerifyData', 'invitationCodeVerification');
  }

  @override
  GInvitationCodeVerifyData rebuild(
          void Function(GInvitationCodeVerifyDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInvitationCodeVerifyDataBuilder toBuilder() =>
      new GInvitationCodeVerifyDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInvitationCodeVerifyData &&
        G__typename == other.G__typename &&
        invitationCodeVerification == other.invitationCodeVerification;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, G__typename.hashCode), invitationCodeVerification.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInvitationCodeVerifyData')
          ..add('G__typename', G__typename)
          ..add('invitationCodeVerification', invitationCodeVerification))
        .toString();
  }
}

class GInvitationCodeVerifyDataBuilder
    implements
        Builder<GInvitationCodeVerifyData, GInvitationCodeVerifyDataBuilder> {
  _$GInvitationCodeVerifyData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GInvitationCodeVerifyData_invitationCodeVerificationBuilder?
      _invitationCodeVerification;
  GInvitationCodeVerifyData_invitationCodeVerificationBuilder
      get invitationCodeVerification => _$this._invitationCodeVerification ??=
          new GInvitationCodeVerifyData_invitationCodeVerificationBuilder();
  set invitationCodeVerification(
          GInvitationCodeVerifyData_invitationCodeVerificationBuilder?
              invitationCodeVerification) =>
      _$this._invitationCodeVerification = invitationCodeVerification;

  GInvitationCodeVerifyDataBuilder() {
    GInvitationCodeVerifyData._initializeBuilder(this);
  }

  GInvitationCodeVerifyDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _invitationCodeVerification = $v.invitationCodeVerification.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInvitationCodeVerifyData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInvitationCodeVerifyData;
  }

  @override
  void update(void Function(GInvitationCodeVerifyDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInvitationCodeVerifyData build() {
    _$GInvitationCodeVerifyData _$result;
    try {
      _$result = _$v ??
          new _$GInvitationCodeVerifyData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GInvitationCodeVerifyData', 'G__typename'),
              invitationCodeVerification: invitationCodeVerification.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'invitationCodeVerification';
        invitationCodeVerification.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GInvitationCodeVerifyData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GInvitationCodeVerifyData_invitationCodeVerification
    extends GInvitationCodeVerifyData_invitationCodeVerification {
  @override
  final String G__typename;
  @override
  final String? accessTokenString;
  @override
  final String? userID;

  factory _$GInvitationCodeVerifyData_invitationCodeVerification(
          [void Function(
                  GInvitationCodeVerifyData_invitationCodeVerificationBuilder)?
              updates]) =>
      (new GInvitationCodeVerifyData_invitationCodeVerificationBuilder()
            ..update(updates))
          .build();

  _$GInvitationCodeVerifyData_invitationCodeVerification._(
      {required this.G__typename, this.accessTokenString, this.userID})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GInvitationCodeVerifyData_invitationCodeVerification', 'G__typename');
  }

  @override
  GInvitationCodeVerifyData_invitationCodeVerification rebuild(
          void Function(
                  GInvitationCodeVerifyData_invitationCodeVerificationBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInvitationCodeVerifyData_invitationCodeVerificationBuilder toBuilder() =>
      new GInvitationCodeVerifyData_invitationCodeVerificationBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInvitationCodeVerifyData_invitationCodeVerification &&
        G__typename == other.G__typename &&
        accessTokenString == other.accessTokenString &&
        userID == other.userID;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, G__typename.hashCode), accessTokenString.hashCode),
        userID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GInvitationCodeVerifyData_invitationCodeVerification')
          ..add('G__typename', G__typename)
          ..add('accessTokenString', accessTokenString)
          ..add('userID', userID))
        .toString();
  }
}

class GInvitationCodeVerifyData_invitationCodeVerificationBuilder
    implements
        Builder<GInvitationCodeVerifyData_invitationCodeVerification,
            GInvitationCodeVerifyData_invitationCodeVerificationBuilder> {
  _$GInvitationCodeVerifyData_invitationCodeVerification? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _accessTokenString;
  String? get accessTokenString => _$this._accessTokenString;
  set accessTokenString(String? accessTokenString) =>
      _$this._accessTokenString = accessTokenString;

  String? _userID;
  String? get userID => _$this._userID;
  set userID(String? userID) => _$this._userID = userID;

  GInvitationCodeVerifyData_invitationCodeVerificationBuilder() {
    GInvitationCodeVerifyData_invitationCodeVerification._initializeBuilder(
        this);
  }

  GInvitationCodeVerifyData_invitationCodeVerificationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _accessTokenString = $v.accessTokenString;
      _userID = $v.userID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInvitationCodeVerifyData_invitationCodeVerification other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInvitationCodeVerifyData_invitationCodeVerification;
  }

  @override
  void update(
      void Function(
              GInvitationCodeVerifyData_invitationCodeVerificationBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInvitationCodeVerifyData_invitationCodeVerification build() {
    final _$result = _$v ??
        new _$GInvitationCodeVerifyData_invitationCodeVerification._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GInvitationCodeVerifyData_invitationCodeVerification',
                'G__typename'),
            accessTokenString: accessTokenString,
            userID: userID);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
