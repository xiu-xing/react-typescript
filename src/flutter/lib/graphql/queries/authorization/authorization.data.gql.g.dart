// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserInfoData> _$gUserInfoDataSerializer =
    new _$GUserInfoDataSerializer();
Serializer<GUserInfoData_user> _$gUserInfoDataUserSerializer =
    new _$GUserInfoData_userSerializer();
Serializer<GUserProfileData> _$gUserProfileDataSerializer =
    new _$GUserProfileDataSerializer();
Serializer<GUserProfileData_userProfile>
    _$gUserProfileDataUserProfileSerializer =
    new _$GUserProfileData_userProfileSerializer();
Serializer<GUserProfileData_userProfile_fields>
    _$gUserProfileDataUserProfileFieldsSerializer =
    new _$GUserProfileData_userProfile_fieldsSerializer();
Serializer<GUserProfileData_userProfile_fields_options>
    _$gUserProfileDataUserProfileFieldsOptionsSerializer =
    new _$GUserProfileData_userProfile_fields_optionsSerializer();
Serializer<GUserProfileData_userProfile_fields_selectedOptions>
    _$gUserProfileDataUserProfileFieldsSelectedOptionsSerializer =
    new _$GUserProfileData_userProfile_fields_selectedOptionsSerializer();
Serializer<GUserPremiumSubscriptionBalanceData>
    _$gUserPremiumSubscriptionBalanceDataSerializer =
    new _$GUserPremiumSubscriptionBalanceDataSerializer();
Serializer<GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance>
    _$gUserPremiumSubscriptionBalanceDataUserPremiumSubscriptionBalanceSerializer =
    new _$GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceSerializer();

class _$GUserInfoDataSerializer implements StructuredSerializer<GUserInfoData> {
  @override
  final Iterable<Type> types = const [GUserInfoData, _$GUserInfoData];
  @override
  final String wireName = 'GUserInfoData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserInfoData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GUserInfoData_user)));
    }
    return result;
  }

  @override
  GUserInfoData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserInfoDataBuilder();

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
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GUserInfoData_user))!
              as GUserInfoData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserInfoData_userSerializer
    implements StructuredSerializer<GUserInfoData_user> {
  @override
  final Iterable<Type> types = const [GUserInfoData_user, _$GUserInfoData_user];
  @override
  final String wireName = 'GUserInfoData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserInfoData_user object,
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
    value = object.email;
    if (value != null) {
      result
        ..add('email')
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
    value = object.hasBoundWechat;
    if (value != null) {
      result
        ..add('hasBoundWechat')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GUserInfoData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserInfoData_userBuilder();

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
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hasBoundWechat':
          result.hasBoundWechat = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserProfileDataSerializer
    implements StructuredSerializer<GUserProfileData> {
  @override
  final Iterable<Type> types = const [GUserProfileData, _$GUserProfileData];
  @override
  final String wireName = 'GUserProfileData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserProfileData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.userProfile;
    if (value != null) {
      result
        ..add('userProfile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GUserProfileData_userProfile)));
    }
    return result;
  }

  @override
  GUserProfileData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserProfileDataBuilder();

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
        case 'userProfile':
          result.userProfile.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GUserProfileData_userProfile))!
              as GUserProfileData_userProfile);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserProfileData_userProfileSerializer
    implements StructuredSerializer<GUserProfileData_userProfile> {
  @override
  final Iterable<Type> types = const [
    GUserProfileData_userProfile,
    _$GUserProfileData_userProfile
  ];
  @override
  final String wireName = 'GUserProfileData_userProfile';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserProfileData_userProfile object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.fields;
    if (value != null) {
      result
        ..add('fields')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GUserProfileData_userProfile_fields)])));
    }
    return result;
  }

  @override
  GUserProfileData_userProfile deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserProfileData_userProfileBuilder();

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
        case 'fields':
          result.fields.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GUserProfileData_userProfile_fields)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserProfileData_userProfile_fieldsSerializer
    implements StructuredSerializer<GUserProfileData_userProfile_fields> {
  @override
  final Iterable<Type> types = const [
    GUserProfileData_userProfile_fields,
    _$GUserProfileData_userProfile_fields
  ];
  @override
  final String wireName = 'GUserProfileData_userProfile_fields';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserProfileData_userProfile_fields object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.isRequired;
    if (value != null) {
      result
        ..add('isRequired')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.options;
    if (value != null) {
      result
        ..add('options')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(GUserProfileData_userProfile_fields_options)
            ])));
    }
    value = object.selectedOptions;
    if (value != null) {
      result
        ..add('selectedOptions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  GUserProfileData_userProfile_fields_selectedOptions)
            ])));
    }
    value = object.isMultiple;
    if (value != null) {
      result
        ..add('isMultiple')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GUserProfileData_userProfile_fields deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserProfileData_userProfile_fieldsBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isRequired':
          result.isRequired = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'options':
          result.options.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GUserProfileData_userProfile_fields_options)
              ]))! as BuiltList<Object?>);
          break;
        case 'selectedOptions':
          result.selectedOptions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GUserProfileData_userProfile_fields_selectedOptions)
              ]))! as BuiltList<Object?>);
          break;
        case 'isMultiple':
          result.isMultiple = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserProfileData_userProfile_fields_optionsSerializer
    implements
        StructuredSerializer<GUserProfileData_userProfile_fields_options> {
  @override
  final Iterable<Type> types = const [
    GUserProfileData_userProfile_fields_options,
    _$GUserProfileData_userProfile_fields_options
  ];
  @override
  final String wireName = 'GUserProfileData_userProfile_fields_options';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUserProfileData_userProfile_fields_options object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUserProfileData_userProfile_fields_options deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserProfileData_userProfile_fields_optionsBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserProfileData_userProfile_fields_selectedOptionsSerializer
    implements
        StructuredSerializer<
            GUserProfileData_userProfile_fields_selectedOptions> {
  @override
  final Iterable<Type> types = const [
    GUserProfileData_userProfile_fields_selectedOptions,
    _$GUserProfileData_userProfile_fields_selectedOptions
  ];
  @override
  final String wireName = 'GUserProfileData_userProfile_fields_selectedOptions';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUserProfileData_userProfile_fields_selectedOptions object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUserProfileData_userProfile_fields_selectedOptions deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GUserProfileData_userProfile_fields_selectedOptionsBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserPremiumSubscriptionBalanceDataSerializer
    implements StructuredSerializer<GUserPremiumSubscriptionBalanceData> {
  @override
  final Iterable<Type> types = const [
    GUserPremiumSubscriptionBalanceData,
    _$GUserPremiumSubscriptionBalanceData
  ];
  @override
  final String wireName = 'GUserPremiumSubscriptionBalanceData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserPremiumSubscriptionBalanceData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'UserPremiumSubscriptionBalance',
      serializers.serialize(object.UserPremiumSubscriptionBalance,
          specifiedType: const FullType(
              GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance)),
    ];

    return result;
  }

  @override
  GUserPremiumSubscriptionBalanceData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserPremiumSubscriptionBalanceDataBuilder();

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
        case 'UserPremiumSubscriptionBalance':
          result.UserPremiumSubscriptionBalance.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance))!
              as GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceSerializer
    implements
        StructuredSerializer<
            GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance> {
  @override
  final Iterable<Type> types = const [
    GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance,
    _$GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance
  ];
  @override
  final String wireName =
      'GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'userID',
      serializers.serialize(object.userID,
          specifiedType: const FullType(String)),
      'serviceID',
      serializers.serialize(object.serviceID,
          specifiedType: const FullType(String)),
      'serviceEndTime',
      serializers.serialize(object.serviceEndTime,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder();

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
        case 'serviceID':
          result.serviceID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'serviceEndTime':
          result.serviceEndTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserInfoData extends GUserInfoData {
  @override
  final String G__typename;
  @override
  final GUserInfoData_user? user;

  factory _$GUserInfoData([void Function(GUserInfoDataBuilder)? updates]) =>
      (new GUserInfoDataBuilder()..update(updates)).build();

  _$GUserInfoData._({required this.G__typename, this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUserInfoData', 'G__typename');
  }

  @override
  GUserInfoData rebuild(void Function(GUserInfoDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserInfoDataBuilder toBuilder() => new GUserInfoDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserInfoData &&
        G__typename == other.G__typename &&
        user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUserInfoData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GUserInfoDataBuilder
    implements Builder<GUserInfoData, GUserInfoDataBuilder> {
  _$GUserInfoData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserInfoData_userBuilder? _user;
  GUserInfoData_userBuilder get user =>
      _$this._user ??= new GUserInfoData_userBuilder();
  set user(GUserInfoData_userBuilder? user) => _$this._user = user;

  GUserInfoDataBuilder() {
    GUserInfoData._initializeBuilder(this);
  }

  GUserInfoDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserInfoData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserInfoData;
  }

  @override
  void update(void Function(GUserInfoDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserInfoData build() {
    _$GUserInfoData _$result;
    try {
      _$result = _$v ??
          new _$GUserInfoData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GUserInfoData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUserInfoData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserInfoData_user extends GUserInfoData_user {
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
  final String? email;
  @override
  final String? phone;
  @override
  final bool? hasBoundWechat;

  factory _$GUserInfoData_user(
          [void Function(GUserInfoData_userBuilder)? updates]) =>
      (new GUserInfoData_userBuilder()..update(updates)).build();

  _$GUserInfoData_user._(
      {required this.G__typename,
      required this.userID,
      required this.role,
      this.userName,
      this.avatarURL,
      this.description,
      this.email,
      this.phone,
      this.hasBoundWechat})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUserInfoData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        userID, 'GUserInfoData_user', 'userID');
    BuiltValueNullFieldError.checkNotNull(role, 'GUserInfoData_user', 'role');
  }

  @override
  GUserInfoData_user rebuild(
          void Function(GUserInfoData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserInfoData_userBuilder toBuilder() =>
      new GUserInfoData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserInfoData_user &&
        G__typename == other.G__typename &&
        userID == other.userID &&
        role == other.role &&
        userName == other.userName &&
        avatarURL == other.avatarURL &&
        description == other.description &&
        email == other.email &&
        phone == other.phone &&
        hasBoundWechat == other.hasBoundWechat;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, G__typename.hashCode),
                                    userID.hashCode),
                                role.hashCode),
                            userName.hashCode),
                        avatarURL.hashCode),
                    description.hashCode),
                email.hashCode),
            phone.hashCode),
        hasBoundWechat.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUserInfoData_user')
          ..add('G__typename', G__typename)
          ..add('userID', userID)
          ..add('role', role)
          ..add('userName', userName)
          ..add('avatarURL', avatarURL)
          ..add('description', description)
          ..add('email', email)
          ..add('phone', phone)
          ..add('hasBoundWechat', hasBoundWechat))
        .toString();
  }
}

class GUserInfoData_userBuilder
    implements Builder<GUserInfoData_user, GUserInfoData_userBuilder> {
  _$GUserInfoData_user? _$v;

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

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  bool? _hasBoundWechat;
  bool? get hasBoundWechat => _$this._hasBoundWechat;
  set hasBoundWechat(bool? hasBoundWechat) =>
      _$this._hasBoundWechat = hasBoundWechat;

  GUserInfoData_userBuilder() {
    GUserInfoData_user._initializeBuilder(this);
  }

  GUserInfoData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userID = $v.userID;
      _role = $v.role;
      _userName = $v.userName;
      _avatarURL = $v.avatarURL;
      _description = $v.description;
      _email = $v.email;
      _phone = $v.phone;
      _hasBoundWechat = $v.hasBoundWechat;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserInfoData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserInfoData_user;
  }

  @override
  void update(void Function(GUserInfoData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserInfoData_user build() {
    final _$result = _$v ??
        new _$GUserInfoData_user._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GUserInfoData_user', 'G__typename'),
            userID: BuiltValueNullFieldError.checkNotNull(
                userID, 'GUserInfoData_user', 'userID'),
            role: BuiltValueNullFieldError.checkNotNull(
                role, 'GUserInfoData_user', 'role'),
            userName: userName,
            avatarURL: avatarURL,
            description: description,
            email: email,
            phone: phone,
            hasBoundWechat: hasBoundWechat);
    replace(_$result);
    return _$result;
  }
}

class _$GUserProfileData extends GUserProfileData {
  @override
  final String G__typename;
  @override
  final GUserProfileData_userProfile? userProfile;

  factory _$GUserProfileData(
          [void Function(GUserProfileDataBuilder)? updates]) =>
      (new GUserProfileDataBuilder()..update(updates)).build();

  _$GUserProfileData._({required this.G__typename, this.userProfile})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUserProfileData', 'G__typename');
  }

  @override
  GUserProfileData rebuild(void Function(GUserProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserProfileDataBuilder toBuilder() =>
      new GUserProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserProfileData &&
        G__typename == other.G__typename &&
        userProfile == other.userProfile;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), userProfile.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUserProfileData')
          ..add('G__typename', G__typename)
          ..add('userProfile', userProfile))
        .toString();
  }
}

class GUserProfileDataBuilder
    implements Builder<GUserProfileData, GUserProfileDataBuilder> {
  _$GUserProfileData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserProfileData_userProfileBuilder? _userProfile;
  GUserProfileData_userProfileBuilder get userProfile =>
      _$this._userProfile ??= new GUserProfileData_userProfileBuilder();
  set userProfile(GUserProfileData_userProfileBuilder? userProfile) =>
      _$this._userProfile = userProfile;

  GUserProfileDataBuilder() {
    GUserProfileData._initializeBuilder(this);
  }

  GUserProfileDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userProfile = $v.userProfile?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserProfileData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserProfileData;
  }

  @override
  void update(void Function(GUserProfileDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserProfileData build() {
    _$GUserProfileData _$result;
    try {
      _$result = _$v ??
          new _$GUserProfileData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GUserProfileData', 'G__typename'),
              userProfile: _userProfile?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userProfile';
        _userProfile?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUserProfileData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserProfileData_userProfile extends GUserProfileData_userProfile {
  @override
  final String G__typename;
  @override
  final BuiltList<GUserProfileData_userProfile_fields>? fields;

  factory _$GUserProfileData_userProfile(
          [void Function(GUserProfileData_userProfileBuilder)? updates]) =>
      (new GUserProfileData_userProfileBuilder()..update(updates)).build();

  _$GUserProfileData_userProfile._({required this.G__typename, this.fields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUserProfileData_userProfile', 'G__typename');
  }

  @override
  GUserProfileData_userProfile rebuild(
          void Function(GUserProfileData_userProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserProfileData_userProfileBuilder toBuilder() =>
      new GUserProfileData_userProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserProfileData_userProfile &&
        G__typename == other.G__typename &&
        fields == other.fields;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), fields.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUserProfileData_userProfile')
          ..add('G__typename', G__typename)
          ..add('fields', fields))
        .toString();
  }
}

class GUserProfileData_userProfileBuilder
    implements
        Builder<GUserProfileData_userProfile,
            GUserProfileData_userProfileBuilder> {
  _$GUserProfileData_userProfile? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GUserProfileData_userProfile_fields>? _fields;
  ListBuilder<GUserProfileData_userProfile_fields> get fields =>
      _$this._fields ??= new ListBuilder<GUserProfileData_userProfile_fields>();
  set fields(ListBuilder<GUserProfileData_userProfile_fields>? fields) =>
      _$this._fields = fields;

  GUserProfileData_userProfileBuilder() {
    GUserProfileData_userProfile._initializeBuilder(this);
  }

  GUserProfileData_userProfileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _fields = $v.fields?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserProfileData_userProfile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserProfileData_userProfile;
  }

  @override
  void update(void Function(GUserProfileData_userProfileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserProfileData_userProfile build() {
    _$GUserProfileData_userProfile _$result;
    try {
      _$result = _$v ??
          new _$GUserProfileData_userProfile._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GUserProfileData_userProfile', 'G__typename'),
              fields: _fields?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fields';
        _fields?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUserProfileData_userProfile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserProfileData_userProfile_fields
    extends GUserProfileData_userProfile_fields {
  @override
  final String G__typename;
  @override
  final String name;
  @override
  final bool? isRequired;
  @override
  final String title;
  @override
  final BuiltList<GUserProfileData_userProfile_fields_options>? options;
  @override
  final BuiltList<GUserProfileData_userProfile_fields_selectedOptions>?
      selectedOptions;
  @override
  final bool? isMultiple;

  factory _$GUserProfileData_userProfile_fields(
          [void Function(GUserProfileData_userProfile_fieldsBuilder)?
              updates]) =>
      (new GUserProfileData_userProfile_fieldsBuilder()..update(updates))
          .build();

  _$GUserProfileData_userProfile_fields._(
      {required this.G__typename,
      required this.name,
      this.isRequired,
      required this.title,
      this.options,
      this.selectedOptions,
      this.isMultiple})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUserProfileData_userProfile_fields', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name, 'GUserProfileData_userProfile_fields', 'name');
    BuiltValueNullFieldError.checkNotNull(
        title, 'GUserProfileData_userProfile_fields', 'title');
  }

  @override
  GUserProfileData_userProfile_fields rebuild(
          void Function(GUserProfileData_userProfile_fieldsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserProfileData_userProfile_fieldsBuilder toBuilder() =>
      new GUserProfileData_userProfile_fieldsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserProfileData_userProfile_fields &&
        G__typename == other.G__typename &&
        name == other.name &&
        isRequired == other.isRequired &&
        title == other.title &&
        options == other.options &&
        selectedOptions == other.selectedOptions &&
        isMultiple == other.isMultiple;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, G__typename.hashCode), name.hashCode),
                        isRequired.hashCode),
                    title.hashCode),
                options.hashCode),
            selectedOptions.hashCode),
        isMultiple.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUserProfileData_userProfile_fields')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('isRequired', isRequired)
          ..add('title', title)
          ..add('options', options)
          ..add('selectedOptions', selectedOptions)
          ..add('isMultiple', isMultiple))
        .toString();
  }
}

class GUserProfileData_userProfile_fieldsBuilder
    implements
        Builder<GUserProfileData_userProfile_fields,
            GUserProfileData_userProfile_fieldsBuilder> {
  _$GUserProfileData_userProfile_fields? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _isRequired;
  bool? get isRequired => _$this._isRequired;
  set isRequired(bool? isRequired) => _$this._isRequired = isRequired;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<GUserProfileData_userProfile_fields_options>? _options;
  ListBuilder<GUserProfileData_userProfile_fields_options> get options =>
      _$this._options ??=
          new ListBuilder<GUserProfileData_userProfile_fields_options>();
  set options(
          ListBuilder<GUserProfileData_userProfile_fields_options>? options) =>
      _$this._options = options;

  ListBuilder<GUserProfileData_userProfile_fields_selectedOptions>?
      _selectedOptions;
  ListBuilder<GUserProfileData_userProfile_fields_selectedOptions>
      get selectedOptions => _$this._selectedOptions ??= new ListBuilder<
          GUserProfileData_userProfile_fields_selectedOptions>();
  set selectedOptions(
          ListBuilder<GUserProfileData_userProfile_fields_selectedOptions>?
              selectedOptions) =>
      _$this._selectedOptions = selectedOptions;

  bool? _isMultiple;
  bool? get isMultiple => _$this._isMultiple;
  set isMultiple(bool? isMultiple) => _$this._isMultiple = isMultiple;

  GUserProfileData_userProfile_fieldsBuilder() {
    GUserProfileData_userProfile_fields._initializeBuilder(this);
  }

  GUserProfileData_userProfile_fieldsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _isRequired = $v.isRequired;
      _title = $v.title;
      _options = $v.options?.toBuilder();
      _selectedOptions = $v.selectedOptions?.toBuilder();
      _isMultiple = $v.isMultiple;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserProfileData_userProfile_fields other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserProfileData_userProfile_fields;
  }

  @override
  void update(
      void Function(GUserProfileData_userProfile_fieldsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserProfileData_userProfile_fields build() {
    _$GUserProfileData_userProfile_fields _$result;
    try {
      _$result = _$v ??
          new _$GUserProfileData_userProfile_fields._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  'GUserProfileData_userProfile_fields', 'G__typename'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'GUserProfileData_userProfile_fields', 'name'),
              isRequired: isRequired,
              title: BuiltValueNullFieldError.checkNotNull(
                  title, 'GUserProfileData_userProfile_fields', 'title'),
              options: _options?.build(),
              selectedOptions: _selectedOptions?.build(),
              isMultiple: isMultiple);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        _options?.build();
        _$failedField = 'selectedOptions';
        _selectedOptions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUserProfileData_userProfile_fields', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserProfileData_userProfile_fields_options
    extends GUserProfileData_userProfile_fields_options {
  @override
  final String G__typename;
  @override
  final String name;
  @override
  final String value;

  factory _$GUserProfileData_userProfile_fields_options(
          [void Function(GUserProfileData_userProfile_fields_optionsBuilder)?
              updates]) =>
      (new GUserProfileData_userProfile_fields_optionsBuilder()
            ..update(updates))
          .build();

  _$GUserProfileData_userProfile_fields_options._(
      {required this.G__typename, required this.name, required this.value})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GUserProfileData_userProfile_fields_options', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name, 'GUserProfileData_userProfile_fields_options', 'name');
    BuiltValueNullFieldError.checkNotNull(
        value, 'GUserProfileData_userProfile_fields_options', 'value');
  }

  @override
  GUserProfileData_userProfile_fields_options rebuild(
          void Function(GUserProfileData_userProfile_fields_optionsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserProfileData_userProfile_fields_optionsBuilder toBuilder() =>
      new GUserProfileData_userProfile_fields_optionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserProfileData_userProfile_fields_options &&
        G__typename == other.G__typename &&
        name == other.name &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), name.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GUserProfileData_userProfile_fields_options')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('value', value))
        .toString();
  }
}

class GUserProfileData_userProfile_fields_optionsBuilder
    implements
        Builder<GUserProfileData_userProfile_fields_options,
            GUserProfileData_userProfile_fields_optionsBuilder> {
  _$GUserProfileData_userProfile_fields_options? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GUserProfileData_userProfile_fields_optionsBuilder() {
    GUserProfileData_userProfile_fields_options._initializeBuilder(this);
  }

  GUserProfileData_userProfile_fields_optionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserProfileData_userProfile_fields_options other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserProfileData_userProfile_fields_options;
  }

  @override
  void update(
      void Function(GUserProfileData_userProfile_fields_optionsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserProfileData_userProfile_fields_options build() {
    final _$result = _$v ??
        new _$GUserProfileData_userProfile_fields_options._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GUserProfileData_userProfile_fields_options', 'G__typename'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'GUserProfileData_userProfile_fields_options', 'name'),
            value: BuiltValueNullFieldError.checkNotNull(
                value, 'GUserProfileData_userProfile_fields_options', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GUserProfileData_userProfile_fields_selectedOptions
    extends GUserProfileData_userProfile_fields_selectedOptions {
  @override
  final String G__typename;
  @override
  final String name;
  @override
  final String value;

  factory _$GUserProfileData_userProfile_fields_selectedOptions(
          [void Function(
                  GUserProfileData_userProfile_fields_selectedOptionsBuilder)?
              updates]) =>
      (new GUserProfileData_userProfile_fields_selectedOptionsBuilder()
            ..update(updates))
          .build();

  _$GUserProfileData_userProfile_fields_selectedOptions._(
      {required this.G__typename, required this.name, required this.value})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GUserProfileData_userProfile_fields_selectedOptions', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name, 'GUserProfileData_userProfile_fields_selectedOptions', 'name');
    BuiltValueNullFieldError.checkNotNull(
        value, 'GUserProfileData_userProfile_fields_selectedOptions', 'value');
  }

  @override
  GUserProfileData_userProfile_fields_selectedOptions rebuild(
          void Function(
                  GUserProfileData_userProfile_fields_selectedOptionsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserProfileData_userProfile_fields_selectedOptionsBuilder toBuilder() =>
      new GUserProfileData_userProfile_fields_selectedOptionsBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserProfileData_userProfile_fields_selectedOptions &&
        G__typename == other.G__typename &&
        name == other.name &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), name.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GUserProfileData_userProfile_fields_selectedOptions')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('value', value))
        .toString();
  }
}

class GUserProfileData_userProfile_fields_selectedOptionsBuilder
    implements
        Builder<GUserProfileData_userProfile_fields_selectedOptions,
            GUserProfileData_userProfile_fields_selectedOptionsBuilder> {
  _$GUserProfileData_userProfile_fields_selectedOptions? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GUserProfileData_userProfile_fields_selectedOptionsBuilder() {
    GUserProfileData_userProfile_fields_selectedOptions._initializeBuilder(
        this);
  }

  GUserProfileData_userProfile_fields_selectedOptionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserProfileData_userProfile_fields_selectedOptions other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserProfileData_userProfile_fields_selectedOptions;
  }

  @override
  void update(
      void Function(GUserProfileData_userProfile_fields_selectedOptionsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserProfileData_userProfile_fields_selectedOptions build() {
    final _$result = _$v ??
        new _$GUserProfileData_userProfile_fields_selectedOptions._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GUserProfileData_userProfile_fields_selectedOptions',
                'G__typename'),
            name: BuiltValueNullFieldError.checkNotNull(name,
                'GUserProfileData_userProfile_fields_selectedOptions', 'name'),
            value: BuiltValueNullFieldError.checkNotNull(
                value,
                'GUserProfileData_userProfile_fields_selectedOptions',
                'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GUserPremiumSubscriptionBalanceData
    extends GUserPremiumSubscriptionBalanceData {
  @override
  final String G__typename;
  @override
  final GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance
      UserPremiumSubscriptionBalance;

  factory _$GUserPremiumSubscriptionBalanceData(
          [void Function(GUserPremiumSubscriptionBalanceDataBuilder)?
              updates]) =>
      (new GUserPremiumSubscriptionBalanceDataBuilder()..update(updates))
          .build();

  _$GUserPremiumSubscriptionBalanceData._(
      {required this.G__typename, required this.UserPremiumSubscriptionBalance})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUserPremiumSubscriptionBalanceData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        UserPremiumSubscriptionBalance,
        'GUserPremiumSubscriptionBalanceData',
        'UserPremiumSubscriptionBalance');
  }

  @override
  GUserPremiumSubscriptionBalanceData rebuild(
          void Function(GUserPremiumSubscriptionBalanceDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserPremiumSubscriptionBalanceDataBuilder toBuilder() =>
      new GUserPremiumSubscriptionBalanceDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserPremiumSubscriptionBalanceData &&
        G__typename == other.G__typename &&
        UserPremiumSubscriptionBalance == other.UserPremiumSubscriptionBalance;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(0, G__typename.hashCode), UserPremiumSubscriptionBalance.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUserPremiumSubscriptionBalanceData')
          ..add('G__typename', G__typename)
          ..add(
              'UserPremiumSubscriptionBalance', UserPremiumSubscriptionBalance))
        .toString();
  }
}

class GUserPremiumSubscriptionBalanceDataBuilder
    implements
        Builder<GUserPremiumSubscriptionBalanceData,
            GUserPremiumSubscriptionBalanceDataBuilder> {
  _$GUserPremiumSubscriptionBalanceData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder?
      _UserPremiumSubscriptionBalance;
  GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder
      get UserPremiumSubscriptionBalance => _$this
              ._UserPremiumSubscriptionBalance ??=
          new GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder();
  set UserPremiumSubscriptionBalance(
          GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder?
              UserPremiumSubscriptionBalance) =>
      _$this._UserPremiumSubscriptionBalance = UserPremiumSubscriptionBalance;

  GUserPremiumSubscriptionBalanceDataBuilder() {
    GUserPremiumSubscriptionBalanceData._initializeBuilder(this);
  }

  GUserPremiumSubscriptionBalanceDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _UserPremiumSubscriptionBalance =
          $v.UserPremiumSubscriptionBalance.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserPremiumSubscriptionBalanceData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserPremiumSubscriptionBalanceData;
  }

  @override
  void update(
      void Function(GUserPremiumSubscriptionBalanceDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserPremiumSubscriptionBalanceData build() {
    _$GUserPremiumSubscriptionBalanceData _$result;
    try {
      _$result = _$v ??
          new _$GUserPremiumSubscriptionBalanceData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  'GUserPremiumSubscriptionBalanceData', 'G__typename'),
              UserPremiumSubscriptionBalance:
                  UserPremiumSubscriptionBalance.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'UserPremiumSubscriptionBalance';
        UserPremiumSubscriptionBalance.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUserPremiumSubscriptionBalanceData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance
    extends GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance {
  @override
  final String G__typename;
  @override
  final String userID;
  @override
  final String serviceID;
  @override
  final int serviceEndTime;

  factory _$GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance(
          [void Function(
                  GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder)?
              updates]) =>
      (new GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder()
            ..update(updates))
          .build();

  _$GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance._(
      {required this.G__typename,
      required this.userID,
      required this.serviceID,
      required this.serviceEndTime})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        userID,
        'GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance',
        'userID');
    BuiltValueNullFieldError.checkNotNull(
        serviceID,
        'GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance',
        'serviceID');
    BuiltValueNullFieldError.checkNotNull(
        serviceEndTime,
        'GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance',
        'serviceEndTime');
  }

  @override
  GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance rebuild(
          void Function(
                  GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder
      toBuilder() =>
          new GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance &&
        G__typename == other.G__typename &&
        userID == other.userID &&
        serviceID == other.serviceID &&
        serviceEndTime == other.serviceEndTime;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), userID.hashCode),
            serviceID.hashCode),
        serviceEndTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance')
          ..add('G__typename', G__typename)
          ..add('userID', userID)
          ..add('serviceID', serviceID)
          ..add('serviceEndTime', serviceEndTime))
        .toString();
  }
}

class GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder
    implements
        Builder<
            GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance,
            GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder> {
  _$GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _userID;
  String? get userID => _$this._userID;
  set userID(String? userID) => _$this._userID = userID;

  String? _serviceID;
  String? get serviceID => _$this._serviceID;
  set serviceID(String? serviceID) => _$this._serviceID = serviceID;

  int? _serviceEndTime;
  int? get serviceEndTime => _$this._serviceEndTime;
  set serviceEndTime(int? serviceEndTime) =>
      _$this._serviceEndTime = serviceEndTime;

  GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder() {
    GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance
        ._initializeBuilder(this);
  }

  GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userID = $v.userID;
      _serviceID = $v.serviceID;
      _serviceEndTime = $v.serviceEndTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance;
  }

  @override
  void update(
      void Function(
              GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance build() {
    final _$result = _$v ??
        new _$GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance',
                'G__typename'),
            userID: BuiltValueNullFieldError.checkNotNull(
                userID,
                'GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance',
                'userID'),
            serviceID: BuiltValueNullFieldError.checkNotNull(
                serviceID,
                'GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance',
                'serviceID'),
            serviceEndTime: BuiltValueNullFieldError.checkNotNull(
                serviceEndTime,
                'GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance',
                'serviceEndTime'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
