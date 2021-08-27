// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateUserInfo.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateUserInfoData> _$gUpdateUserInfoDataSerializer =
    new _$GUpdateUserInfoDataSerializer();
Serializer<GUpdateUserInfoData_updateUserInfo>
    _$gUpdateUserInfoDataUpdateUserInfoSerializer =
    new _$GUpdateUserInfoData_updateUserInfoSerializer();

class _$GUpdateUserInfoDataSerializer
    implements StructuredSerializer<GUpdateUserInfoData> {
  @override
  final Iterable<Type> types = const [
    GUpdateUserInfoData,
    _$GUpdateUserInfoData
  ];
  @override
  final String wireName = 'GUpdateUserInfoData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateUserInfoData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.updateUserInfo;
    if (value != null) {
      result
        ..add('updateUserInfo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GUpdateUserInfoData_updateUserInfo)));
    }
    return result;
  }

  @override
  GUpdateUserInfoData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateUserInfoDataBuilder();

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
        case 'updateUserInfo':
          result.updateUserInfo.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GUpdateUserInfoData_updateUserInfo))!
              as GUpdateUserInfoData_updateUserInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateUserInfoData_updateUserInfoSerializer
    implements StructuredSerializer<GUpdateUserInfoData_updateUserInfo> {
  @override
  final Iterable<Type> types = const [
    GUpdateUserInfoData_updateUserInfo,
    _$GUpdateUserInfoData_updateUserInfo
  ];
  @override
  final String wireName = 'GUpdateUserInfoData_updateUserInfo';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateUserInfoData_updateUserInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'userID',
      serializers.serialize(object.userID,
          specifiedType: const FullType(String)),
      'role',
      serializers.serialize(object.role,
          specifiedType: const FullType(_i2.GRole)),
    ];
    Object? value;
    value = object.userName;
    if (value != null) {
      result
        ..add('userName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.avatarURL;
    if (value != null) {
      result
        ..add('avatarURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUpdateUserInfoData_updateUserInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateUserInfoData_updateUserInfoBuilder();

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
        case 'userID':
          result.userID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(_i2.GRole)) as _i2.GRole;
          break;
        case 'userName':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'avatarURL':
          result.avatarURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateUserInfoData extends GUpdateUserInfoData {
  @override
  final String G__typename;
  @override
  final GUpdateUserInfoData_updateUserInfo? updateUserInfo;

  factory _$GUpdateUserInfoData(
          [void Function(GUpdateUserInfoDataBuilder)? updates]) =>
      (new GUpdateUserInfoDataBuilder()..update(updates)).build();

  _$GUpdateUserInfoData._({required this.G__typename, this.updateUserInfo})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUpdateUserInfoData', 'G__typename');
  }

  @override
  GUpdateUserInfoData rebuild(
          void Function(GUpdateUserInfoDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserInfoDataBuilder toBuilder() =>
      new GUpdateUserInfoDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserInfoData &&
        G__typename == other.G__typename &&
        updateUserInfo == other.updateUserInfo;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), updateUserInfo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUpdateUserInfoData')
          ..add('G__typename', G__typename)
          ..add('updateUserInfo', updateUserInfo))
        .toString();
  }
}

class GUpdateUserInfoDataBuilder
    implements Builder<GUpdateUserInfoData, GUpdateUserInfoDataBuilder> {
  _$GUpdateUserInfoData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUpdateUserInfoData_updateUserInfoBuilder? _updateUserInfo;
  GUpdateUserInfoData_updateUserInfoBuilder get updateUserInfo =>
      _$this._updateUserInfo ??=
          new GUpdateUserInfoData_updateUserInfoBuilder();
  set updateUserInfo(
          GUpdateUserInfoData_updateUserInfoBuilder? updateUserInfo) =>
      _$this._updateUserInfo = updateUserInfo;

  GUpdateUserInfoDataBuilder() {
    GUpdateUserInfoData._initializeBuilder(this);
  }

  GUpdateUserInfoDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _updateUserInfo = $v.updateUserInfo?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateUserInfoData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserInfoData;
  }

  @override
  void update(void Function(GUpdateUserInfoDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateUserInfoData build() {
    _$GUpdateUserInfoData _$result;
    try {
      _$result = _$v ??
          new _$GUpdateUserInfoData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GUpdateUserInfoData', 'G__typename'),
              updateUserInfo: _updateUserInfo?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updateUserInfo';
        _updateUserInfo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUpdateUserInfoData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateUserInfoData_updateUserInfo
    extends GUpdateUserInfoData_updateUserInfo {
  @override
  final String G__typename;
  @override
  final String userID;
  @override
  final _i2.GRole role;
  @override
  final String? userName;
  @override
  final String? avatarURL;
  @override
  final String? description;
  @override
  final String? phone;
  @override
  final String? email;

  factory _$GUpdateUserInfoData_updateUserInfo(
          [void Function(GUpdateUserInfoData_updateUserInfoBuilder)?
              updates]) =>
      (new GUpdateUserInfoData_updateUserInfoBuilder()..update(updates))
          .build();

  _$GUpdateUserInfoData_updateUserInfo._(
      {required this.G__typename,
      required this.userID,
      required this.role,
      this.userName,
      this.avatarURL,
      this.description,
      this.phone,
      this.email})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUpdateUserInfoData_updateUserInfo', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        userID, 'GUpdateUserInfoData_updateUserInfo', 'userID');
    BuiltValueNullFieldError.checkNotNull(
        role, 'GUpdateUserInfoData_updateUserInfo', 'role');
  }

  @override
  GUpdateUserInfoData_updateUserInfo rebuild(
          void Function(GUpdateUserInfoData_updateUserInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserInfoData_updateUserInfoBuilder toBuilder() =>
      new GUpdateUserInfoData_updateUserInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserInfoData_updateUserInfo &&
        G__typename == other.G__typename &&
        userID == other.userID &&
        role == other.role &&
        userName == other.userName &&
        avatarURL == other.avatarURL &&
        description == other.description &&
        phone == other.phone &&
        email == other.email;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, G__typename.hashCode), userID.hashCode),
                            role.hashCode),
                        userName.hashCode),
                    avatarURL.hashCode),
                description.hashCode),
            phone.hashCode),
        email.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUpdateUserInfoData_updateUserInfo')
          ..add('G__typename', G__typename)
          ..add('userID', userID)
          ..add('role', role)
          ..add('userName', userName)
          ..add('avatarURL', avatarURL)
          ..add('description', description)
          ..add('phone', phone)
          ..add('email', email))
        .toString();
  }
}

class GUpdateUserInfoData_updateUserInfoBuilder
    implements
        Builder<GUpdateUserInfoData_updateUserInfo,
            GUpdateUserInfoData_updateUserInfoBuilder> {
  _$GUpdateUserInfoData_updateUserInfo? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _userID;
  String? get userID => _$this._userID;
  set userID(String? userID) => _$this._userID = userID;

  _i2.GRole? _role;
  _i2.GRole? get role => _$this._role;
  set role(_i2.GRole? role) => _$this._role = role;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _avatarURL;
  String? get avatarURL => _$this._avatarURL;
  set avatarURL(String? avatarURL) => _$this._avatarURL = avatarURL;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  GUpdateUserInfoData_updateUserInfoBuilder() {
    GUpdateUserInfoData_updateUserInfo._initializeBuilder(this);
  }

  GUpdateUserInfoData_updateUserInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userID = $v.userID;
      _role = $v.role;
      _userName = $v.userName;
      _avatarURL = $v.avatarURL;
      _description = $v.description;
      _phone = $v.phone;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateUserInfoData_updateUserInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserInfoData_updateUserInfo;
  }

  @override
  void update(
      void Function(GUpdateUserInfoData_updateUserInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateUserInfoData_updateUserInfo build() {
    final _$result = _$v ??
        new _$GUpdateUserInfoData_updateUserInfo._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GUpdateUserInfoData_updateUserInfo', 'G__typename'),
            userID: BuiltValueNullFieldError.checkNotNull(
                userID, 'GUpdateUserInfoData_updateUserInfo', 'userID'),
            role: BuiltValueNullFieldError.checkNotNull(
                role, 'GUpdateUserInfoData_updateUserInfo', 'role'),
            userName: userName,
            avatarURL: avatarURL,
            description: description,
            phone: phone,
            email: email);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
