// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GInvitationData> _$gInvitationDataSerializer =
    new _$GInvitationDataSerializer();
Serializer<GInvitationData_invitation> _$gInvitationDataInvitationSerializer =
    new _$GInvitationData_invitationSerializer();
Serializer<GInvitationDetailData> _$gInvitationDetailDataSerializer =
    new _$GInvitationDetailDataSerializer();
Serializer<GInvitationDetailData_invitationDetail>
    _$gInvitationDetailDataInvitationDetailSerializer =
    new _$GInvitationDetailData_invitationDetailSerializer();

class _$GInvitationDataSerializer
    implements StructuredSerializer<GInvitationData> {
  @override
  final Iterable<Type> types = const [GInvitationData, _$GInvitationData];
  @override
  final String wireName = 'GInvitationData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GInvitationData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'invitation',
      serializers.serialize(object.invitation,
          specifiedType: const FullType(GInvitationData_invitation)),
    ];

    return result;
  }

  @override
  GInvitationData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInvitationDataBuilder();

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
        case 'invitation':
          result.invitation.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GInvitationData_invitation))!
              as GInvitationData_invitation);
          break;
      }
    }

    return result.build();
  }
}

class _$GInvitationData_invitationSerializer
    implements StructuredSerializer<GInvitationData_invitation> {
  @override
  final Iterable<Type> types = const [
    GInvitationData_invitation,
    _$GInvitationData_invitation
  ];
  @override
  final String wireName = 'GInvitationData_invitation';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GInvitationData_invitation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'invitationCode',
      serializers.serialize(object.invitationCode,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GInvitationData_invitation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInvitationData_invitationBuilder();

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
        case 'invitationCode':
          result.invitationCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GInvitationDetailDataSerializer
    implements StructuredSerializer<GInvitationDetailData> {
  @override
  final Iterable<Type> types = const [
    GInvitationDetailData,
    _$GInvitationDetailData
  ];
  @override
  final String wireName = 'GInvitationDetailData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GInvitationDetailData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'invitationDetail',
      serializers.serialize(object.invitationDetail,
          specifiedType:
              const FullType(GInvitationDetailData_invitationDetail)),
    ];

    return result;
  }

  @override
  GInvitationDetailData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInvitationDetailDataBuilder();

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
        case 'invitationDetail':
          result.invitationDetail.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GInvitationDetailData_invitationDetail))!
              as GInvitationDetailData_invitationDetail);
          break;
      }
    }

    return result.build();
  }
}

class _$GInvitationDetailData_invitationDetailSerializer
    implements StructuredSerializer<GInvitationDetailData_invitationDetail> {
  @override
  final Iterable<Type> types = const [
    GInvitationDetailData_invitationDetail,
    _$GInvitationDetailData_invitationDetail
  ];
  @override
  final String wireName = 'GInvitationDetailData_invitationDetail';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GInvitationDetailData_invitationDetail object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.invitee;
    if (value != null) {
      result
        ..add('invitee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.invitationCode;
    if (value != null) {
      result
        ..add('invitationCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.teamName;
    if (value != null) {
      result
        ..add('teamName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logoUrl;
    if (value != null) {
      result
        ..add('logoUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GInvitationDetailData_invitationDetail deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInvitationDetailData_invitationDetailBuilder();

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
        case 'invitee':
          result.invitee = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'invitationCode':
          result.invitationCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'teamName':
          result.teamName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'logoUrl':
          result.logoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GInvitationData extends GInvitationData {
  @override
  final String G__typename;
  @override
  final GInvitationData_invitation invitation;

  factory _$GInvitationData([void Function(GInvitationDataBuilder)? updates]) =>
      (new GInvitationDataBuilder()..update(updates)).build();

  _$GInvitationData._({required this.G__typename, required this.invitation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GInvitationData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        invitation, 'GInvitationData', 'invitation');
  }

  @override
  GInvitationData rebuild(void Function(GInvitationDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInvitationDataBuilder toBuilder() =>
      new GInvitationDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInvitationData &&
        G__typename == other.G__typename &&
        invitation == other.invitation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), invitation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInvitationData')
          ..add('G__typename', G__typename)
          ..add('invitation', invitation))
        .toString();
  }
}

class GInvitationDataBuilder
    implements Builder<GInvitationData, GInvitationDataBuilder> {
  _$GInvitationData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GInvitationData_invitationBuilder? _invitation;
  GInvitationData_invitationBuilder get invitation =>
      _$this._invitation ??= new GInvitationData_invitationBuilder();
  set invitation(GInvitationData_invitationBuilder? invitation) =>
      _$this._invitation = invitation;

  GInvitationDataBuilder() {
    GInvitationData._initializeBuilder(this);
  }

  GInvitationDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _invitation = $v.invitation.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInvitationData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInvitationData;
  }

  @override
  void update(void Function(GInvitationDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInvitationData build() {
    _$GInvitationData _$result;
    try {
      _$result = _$v ??
          new _$GInvitationData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GInvitationData', 'G__typename'),
              invitation: invitation.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'invitation';
        invitation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GInvitationData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GInvitationData_invitation extends GInvitationData_invitation {
  @override
  final String G__typename;
  @override
  final String invitationCode;

  factory _$GInvitationData_invitation(
          [void Function(GInvitationData_invitationBuilder)? updates]) =>
      (new GInvitationData_invitationBuilder()..update(updates)).build();

  _$GInvitationData_invitation._(
      {required this.G__typename, required this.invitationCode})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GInvitationData_invitation', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        invitationCode, 'GInvitationData_invitation', 'invitationCode');
  }

  @override
  GInvitationData_invitation rebuild(
          void Function(GInvitationData_invitationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInvitationData_invitationBuilder toBuilder() =>
      new GInvitationData_invitationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInvitationData_invitation &&
        G__typename == other.G__typename &&
        invitationCode == other.invitationCode;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), invitationCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInvitationData_invitation')
          ..add('G__typename', G__typename)
          ..add('invitationCode', invitationCode))
        .toString();
  }
}

class GInvitationData_invitationBuilder
    implements
        Builder<GInvitationData_invitation, GInvitationData_invitationBuilder> {
  _$GInvitationData_invitation? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _invitationCode;
  String? get invitationCode => _$this._invitationCode;
  set invitationCode(String? invitationCode) =>
      _$this._invitationCode = invitationCode;

  GInvitationData_invitationBuilder() {
    GInvitationData_invitation._initializeBuilder(this);
  }

  GInvitationData_invitationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _invitationCode = $v.invitationCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInvitationData_invitation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInvitationData_invitation;
  }

  @override
  void update(void Function(GInvitationData_invitationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInvitationData_invitation build() {
    final _$result = _$v ??
        new _$GInvitationData_invitation._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GInvitationData_invitation', 'G__typename'),
            invitationCode: BuiltValueNullFieldError.checkNotNull(
                invitationCode,
                'GInvitationData_invitation',
                'invitationCode'));
    replace(_$result);
    return _$result;
  }
}

class _$GInvitationDetailData extends GInvitationDetailData {
  @override
  final String G__typename;
  @override
  final GInvitationDetailData_invitationDetail invitationDetail;

  factory _$GInvitationDetailData(
          [void Function(GInvitationDetailDataBuilder)? updates]) =>
      (new GInvitationDetailDataBuilder()..update(updates)).build();

  _$GInvitationDetailData._(
      {required this.G__typename, required this.invitationDetail})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GInvitationDetailData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        invitationDetail, 'GInvitationDetailData', 'invitationDetail');
  }

  @override
  GInvitationDetailData rebuild(
          void Function(GInvitationDetailDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInvitationDetailDataBuilder toBuilder() =>
      new GInvitationDetailDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInvitationDetailData &&
        G__typename == other.G__typename &&
        invitationDetail == other.invitationDetail;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), invitationDetail.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInvitationDetailData')
          ..add('G__typename', G__typename)
          ..add('invitationDetail', invitationDetail))
        .toString();
  }
}

class GInvitationDetailDataBuilder
    implements Builder<GInvitationDetailData, GInvitationDetailDataBuilder> {
  _$GInvitationDetailData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GInvitationDetailData_invitationDetailBuilder? _invitationDetail;
  GInvitationDetailData_invitationDetailBuilder get invitationDetail =>
      _$this._invitationDetail ??=
          new GInvitationDetailData_invitationDetailBuilder();
  set invitationDetail(
          GInvitationDetailData_invitationDetailBuilder? invitationDetail) =>
      _$this._invitationDetail = invitationDetail;

  GInvitationDetailDataBuilder() {
    GInvitationDetailData._initializeBuilder(this);
  }

  GInvitationDetailDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _invitationDetail = $v.invitationDetail.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInvitationDetailData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInvitationDetailData;
  }

  @override
  void update(void Function(GInvitationDetailDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInvitationDetailData build() {
    _$GInvitationDetailData _$result;
    try {
      _$result = _$v ??
          new _$GInvitationDetailData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GInvitationDetailData', 'G__typename'),
              invitationDetail: invitationDetail.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'invitationDetail';
        invitationDetail.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GInvitationDetailData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GInvitationDetailData_invitationDetail
    extends GInvitationDetailData_invitationDetail {
  @override
  final String G__typename;
  @override
  final String? invitee;
  @override
  final String? invitationCode;
  @override
  final String? teamName;
  @override
  final String? logoUrl;

  factory _$GInvitationDetailData_invitationDetail(
          [void Function(GInvitationDetailData_invitationDetailBuilder)?
              updates]) =>
      (new GInvitationDetailData_invitationDetailBuilder()..update(updates))
          .build();

  _$GInvitationDetailData_invitationDetail._(
      {required this.G__typename,
      this.invitee,
      this.invitationCode,
      this.teamName,
      this.logoUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GInvitationDetailData_invitationDetail', 'G__typename');
  }

  @override
  GInvitationDetailData_invitationDetail rebuild(
          void Function(GInvitationDetailData_invitationDetailBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInvitationDetailData_invitationDetailBuilder toBuilder() =>
      new GInvitationDetailData_invitationDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInvitationDetailData_invitationDetail &&
        G__typename == other.G__typename &&
        invitee == other.invitee &&
        invitationCode == other.invitationCode &&
        teamName == other.teamName &&
        logoUrl == other.logoUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, G__typename.hashCode), invitee.hashCode),
                invitationCode.hashCode),
            teamName.hashCode),
        logoUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GInvitationDetailData_invitationDetail')
          ..add('G__typename', G__typename)
          ..add('invitee', invitee)
          ..add('invitationCode', invitationCode)
          ..add('teamName', teamName)
          ..add('logoUrl', logoUrl))
        .toString();
  }
}

class GInvitationDetailData_invitationDetailBuilder
    implements
        Builder<GInvitationDetailData_invitationDetail,
            GInvitationDetailData_invitationDetailBuilder> {
  _$GInvitationDetailData_invitationDetail? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _invitee;
  String? get invitee => _$this._invitee;
  set invitee(String? invitee) => _$this._invitee = invitee;

  String? _invitationCode;
  String? get invitationCode => _$this._invitationCode;
  set invitationCode(String? invitationCode) =>
      _$this._invitationCode = invitationCode;

  String? _teamName;
  String? get teamName => _$this._teamName;
  set teamName(String? teamName) => _$this._teamName = teamName;

  String? _logoUrl;
  String? get logoUrl => _$this._logoUrl;
  set logoUrl(String? logoUrl) => _$this._logoUrl = logoUrl;

  GInvitationDetailData_invitationDetailBuilder() {
    GInvitationDetailData_invitationDetail._initializeBuilder(this);
  }

  GInvitationDetailData_invitationDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _invitee = $v.invitee;
      _invitationCode = $v.invitationCode;
      _teamName = $v.teamName;
      _logoUrl = $v.logoUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInvitationDetailData_invitationDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInvitationDetailData_invitationDetail;
  }

  @override
  void update(
      void Function(GInvitationDetailData_invitationDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInvitationDetailData_invitationDetail build() {
    final _$result = _$v ??
        new _$GInvitationDetailData_invitationDetail._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GInvitationDetailData_invitationDetail', 'G__typename'),
            invitee: invitee,
            invitationCode: invitationCode,
            teamName: teamName,
            logoUrl: logoUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
