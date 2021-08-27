// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GLoginByPasswordData> _$gLoginByPasswordDataSerializer =
    new _$GLoginByPasswordDataSerializer();
Serializer<GLoginByPasswordData_loginByPassword>
    _$gLoginByPasswordDataLoginByPasswordSerializer =
    new _$GLoginByPasswordData_loginByPasswordSerializer();
Serializer<GLoginWithAppleData> _$gLoginWithAppleDataSerializer =
    new _$GLoginWithAppleDataSerializer();
Serializer<GLoginWithAppleData_loginWithApple>
    _$gLoginWithAppleDataLoginWithAppleSerializer =
    new _$GLoginWithAppleData_loginWithAppleSerializer();
Serializer<GLoginByWeChatData> _$gLoginByWeChatDataSerializer =
    new _$GLoginByWeChatDataSerializer();
Serializer<GLoginByWeChatData_loginByWeChat>
    _$gLoginByWeChatDataLoginByWeChatSerializer =
    new _$GLoginByWeChatData_loginByWeChatSerializer();
Serializer<GUpdateAccessTokenData> _$gUpdateAccessTokenDataSerializer =
    new _$GUpdateAccessTokenDataSerializer();
Serializer<GVerifyCodeData> _$gVerifyCodeDataSerializer =
    new _$GVerifyCodeDataSerializer();
Serializer<GCreateVerificationCodeForBindingContactData>
    _$gCreateVerificationCodeForBindingContactDataSerializer =
    new _$GCreateVerificationCodeForBindingContactDataSerializer();
Serializer<GBindContactData> _$gBindContactDataSerializer =
    new _$GBindContactDataSerializer();
Serializer<GBindContactData_bindContact>
    _$gBindContactDataBindContactSerializer =
    new _$GBindContactData_bindContactSerializer();
Serializer<GLoginByOperationTokenData> _$gLoginByOperationTokenDataSerializer =
    new _$GLoginByOperationTokenDataSerializer();
Serializer<GLoginByOperationTokenData_loginByOperationToken>
    _$gLoginByOperationTokenDataLoginByOperationTokenSerializer =
    new _$GLoginByOperationTokenData_loginByOperationTokenSerializer();
Serializer<GUpdateUserProfileData> _$gUpdateUserProfileDataSerializer =
    new _$GUpdateUserProfileDataSerializer();
Serializer<GUpdateUserProfileData_updateUserProfile>
    _$gUpdateUserProfileDataUpdateUserProfileSerializer =
    new _$GUpdateUserProfileData_updateUserProfileSerializer();
Serializer<GUpdateUserProfileData_updateUserProfile_fields>
    _$gUpdateUserProfileDataUpdateUserProfileFieldsSerializer =
    new _$GUpdateUserProfileData_updateUserProfile_fieldsSerializer();
Serializer<GUpdateUserProfileData_updateUserProfile_fields_options>
    _$gUpdateUserProfileDataUpdateUserProfileFieldsOptionsSerializer =
    new _$GUpdateUserProfileData_updateUserProfile_fields_optionsSerializer();
Serializer<GUpdateUserProfileData_updateUserProfile_fields_selectedOptions>
    _$gUpdateUserProfileDataUpdateUserProfileFieldsSelectedOptionsSerializer =
    new _$GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsSerializer();
Serializer<GBindWechatData> _$gBindWechatDataSerializer =
    new _$GBindWechatDataSerializer();

class _$GLoginByPasswordDataSerializer
    implements StructuredSerializer<GLoginByPasswordData> {
  @override
  final Iterable<Type> types = const [
    GLoginByPasswordData,
    _$GLoginByPasswordData
  ];
  @override
  final String wireName = 'GLoginByPasswordData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLoginByPasswordData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.loginByPassword;
    if (value != null) {
      result
        ..add('loginByPassword')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GLoginByPasswordData_loginByPassword)));
    }
    return result;
  }

  @override
  GLoginByPasswordData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoginByPasswordDataBuilder();

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
        case 'loginByPassword':
          result.loginByPassword.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GLoginByPasswordData_loginByPassword))!
              as GLoginByPasswordData_loginByPassword);
          break;
      }
    }

    return result.build();
  }
}

class _$GLoginByPasswordData_loginByPasswordSerializer
    implements StructuredSerializer<GLoginByPasswordData_loginByPassword> {
  @override
  final Iterable<Type> types = const [
    GLoginByPasswordData_loginByPassword,
    _$GLoginByPasswordData_loginByPassword
  ];
  @override
  final String wireName = 'GLoginByPasswordData_loginByPassword';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLoginByPasswordData_loginByPassword object,
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
  GLoginByPasswordData_loginByPassword deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoginByPasswordData_loginByPasswordBuilder();

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

class _$GLoginWithAppleDataSerializer
    implements StructuredSerializer<GLoginWithAppleData> {
  @override
  final Iterable<Type> types = const [
    GLoginWithAppleData,
    _$GLoginWithAppleData
  ];
  @override
  final String wireName = 'GLoginWithAppleData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLoginWithAppleData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.loginWithApple;
    if (value != null) {
      result
        ..add('loginWithApple')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GLoginWithAppleData_loginWithApple)));
    }
    return result;
  }

  @override
  GLoginWithAppleData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoginWithAppleDataBuilder();

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
        case 'loginWithApple':
          result.loginWithApple.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GLoginWithAppleData_loginWithApple))!
              as GLoginWithAppleData_loginWithApple);
          break;
      }
    }

    return result.build();
  }
}

class _$GLoginWithAppleData_loginWithAppleSerializer
    implements StructuredSerializer<GLoginWithAppleData_loginWithApple> {
  @override
  final Iterable<Type> types = const [
    GLoginWithAppleData_loginWithApple,
    _$GLoginWithAppleData_loginWithApple
  ];
  @override
  final String wireName = 'GLoginWithAppleData_loginWithApple';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLoginWithAppleData_loginWithApple object,
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
  GLoginWithAppleData_loginWithApple deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoginWithAppleData_loginWithAppleBuilder();

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

class _$GLoginByWeChatDataSerializer
    implements StructuredSerializer<GLoginByWeChatData> {
  @override
  final Iterable<Type> types = const [GLoginByWeChatData, _$GLoginByWeChatData];
  @override
  final String wireName = 'GLoginByWeChatData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLoginByWeChatData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.loginByWeChat;
    if (value != null) {
      result
        ..add('loginByWeChat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GLoginByWeChatData_loginByWeChat)));
    }
    return result;
  }

  @override
  GLoginByWeChatData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoginByWeChatDataBuilder();

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
        case 'loginByWeChat':
          result.loginByWeChat.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GLoginByWeChatData_loginByWeChat))!
              as GLoginByWeChatData_loginByWeChat);
          break;
      }
    }

    return result.build();
  }
}

class _$GLoginByWeChatData_loginByWeChatSerializer
    implements StructuredSerializer<GLoginByWeChatData_loginByWeChat> {
  @override
  final Iterable<Type> types = const [
    GLoginByWeChatData_loginByWeChat,
    _$GLoginByWeChatData_loginByWeChat
  ];
  @override
  final String wireName = 'GLoginByWeChatData_loginByWeChat';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLoginByWeChatData_loginByWeChat object,
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
  GLoginByWeChatData_loginByWeChat deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoginByWeChatData_loginByWeChatBuilder();

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

class _$GUpdateAccessTokenDataSerializer
    implements StructuredSerializer<GUpdateAccessTokenData> {
  @override
  final Iterable<Type> types = const [
    GUpdateAccessTokenData,
    _$GUpdateAccessTokenData
  ];
  @override
  final String wireName = 'GUpdateAccessTokenData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateAccessTokenData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.updateAccessToken;
    if (value != null) {
      result
        ..add('updateAccessToken')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUpdateAccessTokenData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateAccessTokenDataBuilder();

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
        case 'updateAccessToken':
          result.updateAccessToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GVerifyCodeDataSerializer
    implements StructuredSerializer<GVerifyCodeData> {
  @override
  final Iterable<Type> types = const [GVerifyCodeData, _$GVerifyCodeData];
  @override
  final String wireName = 'GVerifyCodeData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GVerifyCodeData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.verifyCode;
    if (value != null) {
      result
        ..add('verifyCode')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GVerifyCodeData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GVerifyCodeDataBuilder();

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
        case 'verifyCode':
          result.verifyCode = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateVerificationCodeForBindingContactDataSerializer
    implements
        StructuredSerializer<GCreateVerificationCodeForBindingContactData> {
  @override
  final Iterable<Type> types = const [
    GCreateVerificationCodeForBindingContactData,
    _$GCreateVerificationCodeForBindingContactData
  ];
  @override
  final String wireName = 'GCreateVerificationCodeForBindingContactData';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GCreateVerificationCodeForBindingContactData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.createVerificationCodeForBindingContact;
    if (value != null) {
      result
        ..add('createVerificationCodeForBindingContact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GCreateVerificationCodeForBindingContactData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateVerificationCodeForBindingContactDataBuilder();

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
        case 'createVerificationCodeForBindingContact':
          result.createVerificationCodeForBindingContact = serializers
                  .deserialize(value, specifiedType: const FullType(String))
              as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GBindContactDataSerializer
    implements StructuredSerializer<GBindContactData> {
  @override
  final Iterable<Type> types = const [GBindContactData, _$GBindContactData];
  @override
  final String wireName = 'GBindContactData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GBindContactData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.bindContact;
    if (value != null) {
      result
        ..add('bindContact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GBindContactData_bindContact)));
    }
    return result;
  }

  @override
  GBindContactData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GBindContactDataBuilder();

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
        case 'bindContact':
          result.bindContact.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GBindContactData_bindContact))!
              as GBindContactData_bindContact);
          break;
      }
    }

    return result.build();
  }
}

class _$GBindContactData_bindContactSerializer
    implements StructuredSerializer<GBindContactData_bindContact> {
  @override
  final Iterable<Type> types = const [
    GBindContactData_bindContact,
    _$GBindContactData_bindContact
  ];
  @override
  final String wireName = 'GBindContactData_bindContact';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GBindContactData_bindContact object,
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
    return result;
  }

  @override
  GBindContactData_bindContact deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GBindContactData_bindContactBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GLoginByOperationTokenDataSerializer
    implements StructuredSerializer<GLoginByOperationTokenData> {
  @override
  final Iterable<Type> types = const [
    GLoginByOperationTokenData,
    _$GLoginByOperationTokenData
  ];
  @override
  final String wireName = 'GLoginByOperationTokenData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLoginByOperationTokenData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.loginByOperationToken;
    if (value != null) {
      result
        ..add('loginByOperationToken')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GLoginByOperationTokenData_loginByOperationToken)));
    }
    return result;
  }

  @override
  GLoginByOperationTokenData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoginByOperationTokenDataBuilder();

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
        case 'loginByOperationToken':
          result.loginByOperationToken.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GLoginByOperationTokenData_loginByOperationToken))!
              as GLoginByOperationTokenData_loginByOperationToken);
          break;
      }
    }

    return result.build();
  }
}

class _$GLoginByOperationTokenData_loginByOperationTokenSerializer
    implements
        StructuredSerializer<GLoginByOperationTokenData_loginByOperationToken> {
  @override
  final Iterable<Type> types = const [
    GLoginByOperationTokenData_loginByOperationToken,
    _$GLoginByOperationTokenData_loginByOperationToken
  ];
  @override
  final String wireName = 'GLoginByOperationTokenData_loginByOperationToken';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GLoginByOperationTokenData_loginByOperationToken object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.userID;
    if (value != null) {
      result
        ..add('userID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accessTokenString;
    if (value != null) {
      result
        ..add('accessTokenString')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GLoginByOperationTokenData_loginByOperationToken deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GLoginByOperationTokenData_loginByOperationTokenBuilder();

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
              specifiedType: const FullType(String)) as String?;
          break;
        case 'accessTokenString':
          result.accessTokenString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateUserProfileDataSerializer
    implements StructuredSerializer<GUpdateUserProfileData> {
  @override
  final Iterable<Type> types = const [
    GUpdateUserProfileData,
    _$GUpdateUserProfileData
  ];
  @override
  final String wireName = 'GUpdateUserProfileData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateUserProfileData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.updateUserProfile;
    if (value != null) {
      result
        ..add('updateUserProfile')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GUpdateUserProfileData_updateUserProfile)));
    }
    return result;
  }

  @override
  GUpdateUserProfileData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateUserProfileDataBuilder();

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
        case 'updateUserProfile':
          result.updateUserProfile.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GUpdateUserProfileData_updateUserProfile))!
              as GUpdateUserProfileData_updateUserProfile);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateUserProfileData_updateUserProfileSerializer
    implements StructuredSerializer<GUpdateUserProfileData_updateUserProfile> {
  @override
  final Iterable<Type> types = const [
    GUpdateUserProfileData_updateUserProfile,
    _$GUpdateUserProfileData_updateUserProfile
  ];
  @override
  final String wireName = 'GUpdateUserProfileData_updateUserProfile';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateUserProfileData_updateUserProfile object,
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
            specifiedType: const FullType(BuiltList, const [
              const FullType(GUpdateUserProfileData_updateUserProfile_fields)
            ])));
    }
    return result;
  }

  @override
  GUpdateUserProfileData_updateUserProfile deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateUserProfileData_updateUserProfileBuilder();

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
                const FullType(GUpdateUserProfileData_updateUserProfile_fields)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateUserProfileData_updateUserProfile_fieldsSerializer
    implements
        StructuredSerializer<GUpdateUserProfileData_updateUserProfile_fields> {
  @override
  final Iterable<Type> types = const [
    GUpdateUserProfileData_updateUserProfile_fields,
    _$GUpdateUserProfileData_updateUserProfile_fields
  ];
  @override
  final String wireName = 'GUpdateUserProfileData_updateUserProfile_fields';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUpdateUserProfileData_updateUserProfile_fields object,
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
              const FullType(
                  GUpdateUserProfileData_updateUserProfile_fields_options)
            ])));
    }
    value = object.selectedOptions;
    if (value != null) {
      result
        ..add('selectedOptions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  GUpdateUserProfileData_updateUserProfile_fields_selectedOptions)
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
  GUpdateUserProfileData_updateUserProfile_fields deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateUserProfileData_updateUserProfile_fieldsBuilder();

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
                const FullType(
                    GUpdateUserProfileData_updateUserProfile_fields_options)
              ]))! as BuiltList<Object?>);
          break;
        case 'selectedOptions':
          result.selectedOptions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GUpdateUserProfileData_updateUserProfile_fields_selectedOptions)
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

class _$GUpdateUserProfileData_updateUserProfile_fields_optionsSerializer
    implements
        StructuredSerializer<
            GUpdateUserProfileData_updateUserProfile_fields_options> {
  @override
  final Iterable<Type> types = const [
    GUpdateUserProfileData_updateUserProfile_fields_options,
    _$GUpdateUserProfileData_updateUserProfile_fields_options
  ];
  @override
  final String wireName =
      'GUpdateUserProfileData_updateUserProfile_fields_options';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUpdateUserProfileData_updateUserProfile_fields_options object,
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
  GUpdateUserProfileData_updateUserProfile_fields_options deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GUpdateUserProfileData_updateUserProfile_fields_optionsBuilder();

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

class _$GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsSerializer
    implements
        StructuredSerializer<
            GUpdateUserProfileData_updateUserProfile_fields_selectedOptions> {
  @override
  final Iterable<Type> types = const [
    GUpdateUserProfileData_updateUserProfile_fields_selectedOptions,
    _$GUpdateUserProfileData_updateUserProfile_fields_selectedOptions
  ];
  @override
  final String wireName =
      'GUpdateUserProfileData_updateUserProfile_fields_selectedOptions';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUpdateUserProfileData_updateUserProfile_fields_selectedOptions object,
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
  GUpdateUserProfileData_updateUserProfile_fields_selectedOptions deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsBuilder();

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

class _$GBindWechatDataSerializer
    implements StructuredSerializer<GBindWechatData> {
  @override
  final Iterable<Type> types = const [GBindWechatData, _$GBindWechatData];
  @override
  final String wireName = 'GBindWechatData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GBindWechatData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.bindWechat;
    if (value != null) {
      result
        ..add('bindWechat')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GBindWechatData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GBindWechatDataBuilder();

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
        case 'bindWechat':
          result.bindWechat = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GLoginByPasswordData extends GLoginByPasswordData {
  @override
  final String G__typename;
  @override
  final GLoginByPasswordData_loginByPassword? loginByPassword;

  factory _$GLoginByPasswordData(
          [void Function(GLoginByPasswordDataBuilder)? updates]) =>
      (new GLoginByPasswordDataBuilder()..update(updates)).build();

  _$GLoginByPasswordData._({required this.G__typename, this.loginByPassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GLoginByPasswordData', 'G__typename');
  }

  @override
  GLoginByPasswordData rebuild(
          void Function(GLoginByPasswordDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoginByPasswordDataBuilder toBuilder() =>
      new GLoginByPasswordDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoginByPasswordData &&
        G__typename == other.G__typename &&
        loginByPassword == other.loginByPassword;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), loginByPassword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GLoginByPasswordData')
          ..add('G__typename', G__typename)
          ..add('loginByPassword', loginByPassword))
        .toString();
  }
}

class GLoginByPasswordDataBuilder
    implements Builder<GLoginByPasswordData, GLoginByPasswordDataBuilder> {
  _$GLoginByPasswordData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GLoginByPasswordData_loginByPasswordBuilder? _loginByPassword;
  GLoginByPasswordData_loginByPasswordBuilder get loginByPassword =>
      _$this._loginByPassword ??=
          new GLoginByPasswordData_loginByPasswordBuilder();
  set loginByPassword(
          GLoginByPasswordData_loginByPasswordBuilder? loginByPassword) =>
      _$this._loginByPassword = loginByPassword;

  GLoginByPasswordDataBuilder() {
    GLoginByPasswordData._initializeBuilder(this);
  }

  GLoginByPasswordDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _loginByPassword = $v.loginByPassword?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLoginByPasswordData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoginByPasswordData;
  }

  @override
  void update(void Function(GLoginByPasswordDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GLoginByPasswordData build() {
    _$GLoginByPasswordData _$result;
    try {
      _$result = _$v ??
          new _$GLoginByPasswordData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GLoginByPasswordData', 'G__typename'),
              loginByPassword: _loginByPassword?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'loginByPassword';
        _loginByPassword?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GLoginByPasswordData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GLoginByPasswordData_loginByPassword
    extends GLoginByPasswordData_loginByPassword {
  @override
  final String G__typename;
  @override
  final String? accessTokenString;
  @override
  final String? userID;

  factory _$GLoginByPasswordData_loginByPassword(
          [void Function(GLoginByPasswordData_loginByPasswordBuilder)?
              updates]) =>
      (new GLoginByPasswordData_loginByPasswordBuilder()..update(updates))
          .build();

  _$GLoginByPasswordData_loginByPassword._(
      {required this.G__typename, this.accessTokenString, this.userID})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GLoginByPasswordData_loginByPassword', 'G__typename');
  }

  @override
  GLoginByPasswordData_loginByPassword rebuild(
          void Function(GLoginByPasswordData_loginByPasswordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoginByPasswordData_loginByPasswordBuilder toBuilder() =>
      new GLoginByPasswordData_loginByPasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoginByPasswordData_loginByPassword &&
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
    return (newBuiltValueToStringHelper('GLoginByPasswordData_loginByPassword')
          ..add('G__typename', G__typename)
          ..add('accessTokenString', accessTokenString)
          ..add('userID', userID))
        .toString();
  }
}

class GLoginByPasswordData_loginByPasswordBuilder
    implements
        Builder<GLoginByPasswordData_loginByPassword,
            GLoginByPasswordData_loginByPasswordBuilder> {
  _$GLoginByPasswordData_loginByPassword? _$v;

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

  GLoginByPasswordData_loginByPasswordBuilder() {
    GLoginByPasswordData_loginByPassword._initializeBuilder(this);
  }

  GLoginByPasswordData_loginByPasswordBuilder get _$this {
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
  void replace(GLoginByPasswordData_loginByPassword other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoginByPasswordData_loginByPassword;
  }

  @override
  void update(
      void Function(GLoginByPasswordData_loginByPasswordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GLoginByPasswordData_loginByPassword build() {
    final _$result = _$v ??
        new _$GLoginByPasswordData_loginByPassword._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GLoginByPasswordData_loginByPassword', 'G__typename'),
            accessTokenString: accessTokenString,
            userID: userID);
    replace(_$result);
    return _$result;
  }
}

class _$GLoginWithAppleData extends GLoginWithAppleData {
  @override
  final String G__typename;
  @override
  final GLoginWithAppleData_loginWithApple? loginWithApple;

  factory _$GLoginWithAppleData(
          [void Function(GLoginWithAppleDataBuilder)? updates]) =>
      (new GLoginWithAppleDataBuilder()..update(updates)).build();

  _$GLoginWithAppleData._({required this.G__typename, this.loginWithApple})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GLoginWithAppleData', 'G__typename');
  }

  @override
  GLoginWithAppleData rebuild(
          void Function(GLoginWithAppleDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoginWithAppleDataBuilder toBuilder() =>
      new GLoginWithAppleDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoginWithAppleData &&
        G__typename == other.G__typename &&
        loginWithApple == other.loginWithApple;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), loginWithApple.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GLoginWithAppleData')
          ..add('G__typename', G__typename)
          ..add('loginWithApple', loginWithApple))
        .toString();
  }
}

class GLoginWithAppleDataBuilder
    implements Builder<GLoginWithAppleData, GLoginWithAppleDataBuilder> {
  _$GLoginWithAppleData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GLoginWithAppleData_loginWithAppleBuilder? _loginWithApple;
  GLoginWithAppleData_loginWithAppleBuilder get loginWithApple =>
      _$this._loginWithApple ??=
          new GLoginWithAppleData_loginWithAppleBuilder();
  set loginWithApple(
          GLoginWithAppleData_loginWithAppleBuilder? loginWithApple) =>
      _$this._loginWithApple = loginWithApple;

  GLoginWithAppleDataBuilder() {
    GLoginWithAppleData._initializeBuilder(this);
  }

  GLoginWithAppleDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _loginWithApple = $v.loginWithApple?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLoginWithAppleData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoginWithAppleData;
  }

  @override
  void update(void Function(GLoginWithAppleDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GLoginWithAppleData build() {
    _$GLoginWithAppleData _$result;
    try {
      _$result = _$v ??
          new _$GLoginWithAppleData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GLoginWithAppleData', 'G__typename'),
              loginWithApple: _loginWithApple?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'loginWithApple';
        _loginWithApple?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GLoginWithAppleData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GLoginWithAppleData_loginWithApple
    extends GLoginWithAppleData_loginWithApple {
  @override
  final String G__typename;
  @override
  final String? accessTokenString;
  @override
  final String? userID;

  factory _$GLoginWithAppleData_loginWithApple(
          [void Function(GLoginWithAppleData_loginWithAppleBuilder)?
              updates]) =>
      (new GLoginWithAppleData_loginWithAppleBuilder()..update(updates))
          .build();

  _$GLoginWithAppleData_loginWithApple._(
      {required this.G__typename, this.accessTokenString, this.userID})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GLoginWithAppleData_loginWithApple', 'G__typename');
  }

  @override
  GLoginWithAppleData_loginWithApple rebuild(
          void Function(GLoginWithAppleData_loginWithAppleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoginWithAppleData_loginWithAppleBuilder toBuilder() =>
      new GLoginWithAppleData_loginWithAppleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoginWithAppleData_loginWithApple &&
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
    return (newBuiltValueToStringHelper('GLoginWithAppleData_loginWithApple')
          ..add('G__typename', G__typename)
          ..add('accessTokenString', accessTokenString)
          ..add('userID', userID))
        .toString();
  }
}

class GLoginWithAppleData_loginWithAppleBuilder
    implements
        Builder<GLoginWithAppleData_loginWithApple,
            GLoginWithAppleData_loginWithAppleBuilder> {
  _$GLoginWithAppleData_loginWithApple? _$v;

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

  GLoginWithAppleData_loginWithAppleBuilder() {
    GLoginWithAppleData_loginWithApple._initializeBuilder(this);
  }

  GLoginWithAppleData_loginWithAppleBuilder get _$this {
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
  void replace(GLoginWithAppleData_loginWithApple other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoginWithAppleData_loginWithApple;
  }

  @override
  void update(
      void Function(GLoginWithAppleData_loginWithAppleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GLoginWithAppleData_loginWithApple build() {
    final _$result = _$v ??
        new _$GLoginWithAppleData_loginWithApple._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GLoginWithAppleData_loginWithApple', 'G__typename'),
            accessTokenString: accessTokenString,
            userID: userID);
    replace(_$result);
    return _$result;
  }
}

class _$GLoginByWeChatData extends GLoginByWeChatData {
  @override
  final String G__typename;
  @override
  final GLoginByWeChatData_loginByWeChat? loginByWeChat;

  factory _$GLoginByWeChatData(
          [void Function(GLoginByWeChatDataBuilder)? updates]) =>
      (new GLoginByWeChatDataBuilder()..update(updates)).build();

  _$GLoginByWeChatData._({required this.G__typename, this.loginByWeChat})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GLoginByWeChatData', 'G__typename');
  }

  @override
  GLoginByWeChatData rebuild(
          void Function(GLoginByWeChatDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoginByWeChatDataBuilder toBuilder() =>
      new GLoginByWeChatDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoginByWeChatData &&
        G__typename == other.G__typename &&
        loginByWeChat == other.loginByWeChat;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), loginByWeChat.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GLoginByWeChatData')
          ..add('G__typename', G__typename)
          ..add('loginByWeChat', loginByWeChat))
        .toString();
  }
}

class GLoginByWeChatDataBuilder
    implements Builder<GLoginByWeChatData, GLoginByWeChatDataBuilder> {
  _$GLoginByWeChatData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GLoginByWeChatData_loginByWeChatBuilder? _loginByWeChat;
  GLoginByWeChatData_loginByWeChatBuilder get loginByWeChat =>
      _$this._loginByWeChat ??= new GLoginByWeChatData_loginByWeChatBuilder();
  set loginByWeChat(GLoginByWeChatData_loginByWeChatBuilder? loginByWeChat) =>
      _$this._loginByWeChat = loginByWeChat;

  GLoginByWeChatDataBuilder() {
    GLoginByWeChatData._initializeBuilder(this);
  }

  GLoginByWeChatDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _loginByWeChat = $v.loginByWeChat?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLoginByWeChatData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoginByWeChatData;
  }

  @override
  void update(void Function(GLoginByWeChatDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GLoginByWeChatData build() {
    _$GLoginByWeChatData _$result;
    try {
      _$result = _$v ??
          new _$GLoginByWeChatData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GLoginByWeChatData', 'G__typename'),
              loginByWeChat: _loginByWeChat?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'loginByWeChat';
        _loginByWeChat?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GLoginByWeChatData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GLoginByWeChatData_loginByWeChat
    extends GLoginByWeChatData_loginByWeChat {
  @override
  final String G__typename;
  @override
  final String? accessTokenString;
  @override
  final String? userID;

  factory _$GLoginByWeChatData_loginByWeChat(
          [void Function(GLoginByWeChatData_loginByWeChatBuilder)? updates]) =>
      (new GLoginByWeChatData_loginByWeChatBuilder()..update(updates)).build();

  _$GLoginByWeChatData_loginByWeChat._(
      {required this.G__typename, this.accessTokenString, this.userID})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GLoginByWeChatData_loginByWeChat', 'G__typename');
  }

  @override
  GLoginByWeChatData_loginByWeChat rebuild(
          void Function(GLoginByWeChatData_loginByWeChatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoginByWeChatData_loginByWeChatBuilder toBuilder() =>
      new GLoginByWeChatData_loginByWeChatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoginByWeChatData_loginByWeChat &&
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
    return (newBuiltValueToStringHelper('GLoginByWeChatData_loginByWeChat')
          ..add('G__typename', G__typename)
          ..add('accessTokenString', accessTokenString)
          ..add('userID', userID))
        .toString();
  }
}

class GLoginByWeChatData_loginByWeChatBuilder
    implements
        Builder<GLoginByWeChatData_loginByWeChat,
            GLoginByWeChatData_loginByWeChatBuilder> {
  _$GLoginByWeChatData_loginByWeChat? _$v;

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

  GLoginByWeChatData_loginByWeChatBuilder() {
    GLoginByWeChatData_loginByWeChat._initializeBuilder(this);
  }

  GLoginByWeChatData_loginByWeChatBuilder get _$this {
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
  void replace(GLoginByWeChatData_loginByWeChat other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoginByWeChatData_loginByWeChat;
  }

  @override
  void update(void Function(GLoginByWeChatData_loginByWeChatBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GLoginByWeChatData_loginByWeChat build() {
    final _$result = _$v ??
        new _$GLoginByWeChatData_loginByWeChat._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GLoginByWeChatData_loginByWeChat', 'G__typename'),
            accessTokenString: accessTokenString,
            userID: userID);
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateAccessTokenData extends GUpdateAccessTokenData {
  @override
  final String G__typename;
  @override
  final String? updateAccessToken;

  factory _$GUpdateAccessTokenData(
          [void Function(GUpdateAccessTokenDataBuilder)? updates]) =>
      (new GUpdateAccessTokenDataBuilder()..update(updates)).build();

  _$GUpdateAccessTokenData._(
      {required this.G__typename, this.updateAccessToken})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUpdateAccessTokenData', 'G__typename');
  }

  @override
  GUpdateAccessTokenData rebuild(
          void Function(GUpdateAccessTokenDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateAccessTokenDataBuilder toBuilder() =>
      new GUpdateAccessTokenDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateAccessTokenData &&
        G__typename == other.G__typename &&
        updateAccessToken == other.updateAccessToken;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), updateAccessToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUpdateAccessTokenData')
          ..add('G__typename', G__typename)
          ..add('updateAccessToken', updateAccessToken))
        .toString();
  }
}

class GUpdateAccessTokenDataBuilder
    implements Builder<GUpdateAccessTokenData, GUpdateAccessTokenDataBuilder> {
  _$GUpdateAccessTokenData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _updateAccessToken;
  String? get updateAccessToken => _$this._updateAccessToken;
  set updateAccessToken(String? updateAccessToken) =>
      _$this._updateAccessToken = updateAccessToken;

  GUpdateAccessTokenDataBuilder() {
    GUpdateAccessTokenData._initializeBuilder(this);
  }

  GUpdateAccessTokenDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _updateAccessToken = $v.updateAccessToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateAccessTokenData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateAccessTokenData;
  }

  @override
  void update(void Function(GUpdateAccessTokenDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateAccessTokenData build() {
    final _$result = _$v ??
        new _$GUpdateAccessTokenData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GUpdateAccessTokenData', 'G__typename'),
            updateAccessToken: updateAccessToken);
    replace(_$result);
    return _$result;
  }
}

class _$GVerifyCodeData extends GVerifyCodeData {
  @override
  final String G__typename;
  @override
  final bool? verifyCode;

  factory _$GVerifyCodeData([void Function(GVerifyCodeDataBuilder)? updates]) =>
      (new GVerifyCodeDataBuilder()..update(updates)).build();

  _$GVerifyCodeData._({required this.G__typename, this.verifyCode})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GVerifyCodeData', 'G__typename');
  }

  @override
  GVerifyCodeData rebuild(void Function(GVerifyCodeDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GVerifyCodeDataBuilder toBuilder() =>
      new GVerifyCodeDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GVerifyCodeData &&
        G__typename == other.G__typename &&
        verifyCode == other.verifyCode;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), verifyCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GVerifyCodeData')
          ..add('G__typename', G__typename)
          ..add('verifyCode', verifyCode))
        .toString();
  }
}

class GVerifyCodeDataBuilder
    implements Builder<GVerifyCodeData, GVerifyCodeDataBuilder> {
  _$GVerifyCodeData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _verifyCode;
  bool? get verifyCode => _$this._verifyCode;
  set verifyCode(bool? verifyCode) => _$this._verifyCode = verifyCode;

  GVerifyCodeDataBuilder() {
    GVerifyCodeData._initializeBuilder(this);
  }

  GVerifyCodeDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _verifyCode = $v.verifyCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GVerifyCodeData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GVerifyCodeData;
  }

  @override
  void update(void Function(GVerifyCodeDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GVerifyCodeData build() {
    final _$result = _$v ??
        new _$GVerifyCodeData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GVerifyCodeData', 'G__typename'),
            verifyCode: verifyCode);
    replace(_$result);
    return _$result;
  }
}

class _$GCreateVerificationCodeForBindingContactData
    extends GCreateVerificationCodeForBindingContactData {
  @override
  final String G__typename;
  @override
  final String? createVerificationCodeForBindingContact;

  factory _$GCreateVerificationCodeForBindingContactData(
          [void Function(GCreateVerificationCodeForBindingContactDataBuilder)?
              updates]) =>
      (new GCreateVerificationCodeForBindingContactDataBuilder()
            ..update(updates))
          .build();

  _$GCreateVerificationCodeForBindingContactData._(
      {required this.G__typename, this.createVerificationCodeForBindingContact})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GCreateVerificationCodeForBindingContactData', 'G__typename');
  }

  @override
  GCreateVerificationCodeForBindingContactData rebuild(
          void Function(GCreateVerificationCodeForBindingContactDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateVerificationCodeForBindingContactDataBuilder toBuilder() =>
      new GCreateVerificationCodeForBindingContactDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateVerificationCodeForBindingContactData &&
        G__typename == other.G__typename &&
        createVerificationCodeForBindingContact ==
            other.createVerificationCodeForBindingContact;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode),
        createVerificationCodeForBindingContact.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GCreateVerificationCodeForBindingContactData')
          ..add('G__typename', G__typename)
          ..add('createVerificationCodeForBindingContact',
              createVerificationCodeForBindingContact))
        .toString();
  }
}

class GCreateVerificationCodeForBindingContactDataBuilder
    implements
        Builder<GCreateVerificationCodeForBindingContactData,
            GCreateVerificationCodeForBindingContactDataBuilder> {
  _$GCreateVerificationCodeForBindingContactData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _createVerificationCodeForBindingContact;
  String? get createVerificationCodeForBindingContact =>
      _$this._createVerificationCodeForBindingContact;
  set createVerificationCodeForBindingContact(
          String? createVerificationCodeForBindingContact) =>
      _$this._createVerificationCodeForBindingContact =
          createVerificationCodeForBindingContact;

  GCreateVerificationCodeForBindingContactDataBuilder() {
    GCreateVerificationCodeForBindingContactData._initializeBuilder(this);
  }

  GCreateVerificationCodeForBindingContactDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createVerificationCodeForBindingContact =
          $v.createVerificationCodeForBindingContact;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateVerificationCodeForBindingContactData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateVerificationCodeForBindingContactData;
  }

  @override
  void update(
      void Function(GCreateVerificationCodeForBindingContactDataBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateVerificationCodeForBindingContactData build() {
    final _$result = _$v ??
        new _$GCreateVerificationCodeForBindingContactData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GCreateVerificationCodeForBindingContactData', 'G__typename'),
            createVerificationCodeForBindingContact:
                createVerificationCodeForBindingContact);
    replace(_$result);
    return _$result;
  }
}

class _$GBindContactData extends GBindContactData {
  @override
  final String G__typename;
  @override
  final GBindContactData_bindContact? bindContact;

  factory _$GBindContactData(
          [void Function(GBindContactDataBuilder)? updates]) =>
      (new GBindContactDataBuilder()..update(updates)).build();

  _$GBindContactData._({required this.G__typename, this.bindContact})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GBindContactData', 'G__typename');
  }

  @override
  GBindContactData rebuild(void Function(GBindContactDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBindContactDataBuilder toBuilder() =>
      new GBindContactDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBindContactData &&
        G__typename == other.G__typename &&
        bindContact == other.bindContact;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), bindContact.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GBindContactData')
          ..add('G__typename', G__typename)
          ..add('bindContact', bindContact))
        .toString();
  }
}

class GBindContactDataBuilder
    implements Builder<GBindContactData, GBindContactDataBuilder> {
  _$GBindContactData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GBindContactData_bindContactBuilder? _bindContact;
  GBindContactData_bindContactBuilder get bindContact =>
      _$this._bindContact ??= new GBindContactData_bindContactBuilder();
  set bindContact(GBindContactData_bindContactBuilder? bindContact) =>
      _$this._bindContact = bindContact;

  GBindContactDataBuilder() {
    GBindContactData._initializeBuilder(this);
  }

  GBindContactDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _bindContact = $v.bindContact?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBindContactData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GBindContactData;
  }

  @override
  void update(void Function(GBindContactDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GBindContactData build() {
    _$GBindContactData _$result;
    try {
      _$result = _$v ??
          new _$GBindContactData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GBindContactData', 'G__typename'),
              bindContact: _bindContact?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'bindContact';
        _bindContact?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GBindContactData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GBindContactData_bindContact extends GBindContactData_bindContact {
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

  factory _$GBindContactData_bindContact(
          [void Function(GBindContactData_bindContactBuilder)? updates]) =>
      (new GBindContactData_bindContactBuilder()..update(updates)).build();

  _$GBindContactData_bindContact._(
      {required this.G__typename,
      required this.userID,
      required this.role,
      this.userName,
      this.avatarURL,
      this.description,
      this.email,
      this.phone})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GBindContactData_bindContact', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        userID, 'GBindContactData_bindContact', 'userID');
    BuiltValueNullFieldError.checkNotNull(
        role, 'GBindContactData_bindContact', 'role');
  }

  @override
  GBindContactData_bindContact rebuild(
          void Function(GBindContactData_bindContactBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBindContactData_bindContactBuilder toBuilder() =>
      new GBindContactData_bindContactBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBindContactData_bindContact &&
        G__typename == other.G__typename &&
        userID == other.userID &&
        role == other.role &&
        userName == other.userName &&
        avatarURL == other.avatarURL &&
        description == other.description &&
        email == other.email &&
        phone == other.phone;
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
            email.hashCode),
        phone.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GBindContactData_bindContact')
          ..add('G__typename', G__typename)
          ..add('userID', userID)
          ..add('role', role)
          ..add('userName', userName)
          ..add('avatarURL', avatarURL)
          ..add('description', description)
          ..add('email', email)
          ..add('phone', phone))
        .toString();
  }
}

class GBindContactData_bindContactBuilder
    implements
        Builder<GBindContactData_bindContact,
            GBindContactData_bindContactBuilder> {
  _$GBindContactData_bindContact? _$v;

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

  GBindContactData_bindContactBuilder() {
    GBindContactData_bindContact._initializeBuilder(this);
  }

  GBindContactData_bindContactBuilder get _$this {
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
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBindContactData_bindContact other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GBindContactData_bindContact;
  }

  @override
  void update(void Function(GBindContactData_bindContactBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GBindContactData_bindContact build() {
    final _$result = _$v ??
        new _$GBindContactData_bindContact._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GBindContactData_bindContact', 'G__typename'),
            userID: BuiltValueNullFieldError.checkNotNull(
                userID, 'GBindContactData_bindContact', 'userID'),
            role: BuiltValueNullFieldError.checkNotNull(
                role, 'GBindContactData_bindContact', 'role'),
            userName: userName,
            avatarURL: avatarURL,
            description: description,
            email: email,
            phone: phone);
    replace(_$result);
    return _$result;
  }
}

class _$GLoginByOperationTokenData extends GLoginByOperationTokenData {
  @override
  final String G__typename;
  @override
  final GLoginByOperationTokenData_loginByOperationToken? loginByOperationToken;

  factory _$GLoginByOperationTokenData(
          [void Function(GLoginByOperationTokenDataBuilder)? updates]) =>
      (new GLoginByOperationTokenDataBuilder()..update(updates)).build();

  _$GLoginByOperationTokenData._(
      {required this.G__typename, this.loginByOperationToken})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GLoginByOperationTokenData', 'G__typename');
  }

  @override
  GLoginByOperationTokenData rebuild(
          void Function(GLoginByOperationTokenDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoginByOperationTokenDataBuilder toBuilder() =>
      new GLoginByOperationTokenDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoginByOperationTokenData &&
        G__typename == other.G__typename &&
        loginByOperationToken == other.loginByOperationToken;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, G__typename.hashCode), loginByOperationToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GLoginByOperationTokenData')
          ..add('G__typename', G__typename)
          ..add('loginByOperationToken', loginByOperationToken))
        .toString();
  }
}

class GLoginByOperationTokenDataBuilder
    implements
        Builder<GLoginByOperationTokenData, GLoginByOperationTokenDataBuilder> {
  _$GLoginByOperationTokenData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GLoginByOperationTokenData_loginByOperationTokenBuilder?
      _loginByOperationToken;
  GLoginByOperationTokenData_loginByOperationTokenBuilder
      get loginByOperationToken => _$this._loginByOperationToken ??=
          new GLoginByOperationTokenData_loginByOperationTokenBuilder();
  set loginByOperationToken(
          GLoginByOperationTokenData_loginByOperationTokenBuilder?
              loginByOperationToken) =>
      _$this._loginByOperationToken = loginByOperationToken;

  GLoginByOperationTokenDataBuilder() {
    GLoginByOperationTokenData._initializeBuilder(this);
  }

  GLoginByOperationTokenDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _loginByOperationToken = $v.loginByOperationToken?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLoginByOperationTokenData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoginByOperationTokenData;
  }

  @override
  void update(void Function(GLoginByOperationTokenDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GLoginByOperationTokenData build() {
    _$GLoginByOperationTokenData _$result;
    try {
      _$result = _$v ??
          new _$GLoginByOperationTokenData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GLoginByOperationTokenData', 'G__typename'),
              loginByOperationToken: _loginByOperationToken?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'loginByOperationToken';
        _loginByOperationToken?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GLoginByOperationTokenData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GLoginByOperationTokenData_loginByOperationToken
    extends GLoginByOperationTokenData_loginByOperationToken {
  @override
  final String G__typename;
  @override
  final String? userID;
  @override
  final String? accessTokenString;

  factory _$GLoginByOperationTokenData_loginByOperationToken(
          [void Function(
                  GLoginByOperationTokenData_loginByOperationTokenBuilder)?
              updates]) =>
      (new GLoginByOperationTokenData_loginByOperationTokenBuilder()
            ..update(updates))
          .build();

  _$GLoginByOperationTokenData_loginByOperationToken._(
      {required this.G__typename, this.userID, this.accessTokenString})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GLoginByOperationTokenData_loginByOperationToken', 'G__typename');
  }

  @override
  GLoginByOperationTokenData_loginByOperationToken rebuild(
          void Function(GLoginByOperationTokenData_loginByOperationTokenBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoginByOperationTokenData_loginByOperationTokenBuilder toBuilder() =>
      new GLoginByOperationTokenData_loginByOperationTokenBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoginByOperationTokenData_loginByOperationToken &&
        G__typename == other.G__typename &&
        userID == other.userID &&
        accessTokenString == other.accessTokenString;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, G__typename.hashCode), userID.hashCode),
        accessTokenString.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GLoginByOperationTokenData_loginByOperationToken')
          ..add('G__typename', G__typename)
          ..add('userID', userID)
          ..add('accessTokenString', accessTokenString))
        .toString();
  }
}

class GLoginByOperationTokenData_loginByOperationTokenBuilder
    implements
        Builder<GLoginByOperationTokenData_loginByOperationToken,
            GLoginByOperationTokenData_loginByOperationTokenBuilder> {
  _$GLoginByOperationTokenData_loginByOperationToken? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _userID;
  String? get userID => _$this._userID;
  set userID(String? userID) => _$this._userID = userID;

  String? _accessTokenString;
  String? get accessTokenString => _$this._accessTokenString;
  set accessTokenString(String? accessTokenString) =>
      _$this._accessTokenString = accessTokenString;

  GLoginByOperationTokenData_loginByOperationTokenBuilder() {
    GLoginByOperationTokenData_loginByOperationToken._initializeBuilder(this);
  }

  GLoginByOperationTokenData_loginByOperationTokenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userID = $v.userID;
      _accessTokenString = $v.accessTokenString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLoginByOperationTokenData_loginByOperationToken other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoginByOperationTokenData_loginByOperationToken;
  }

  @override
  void update(
      void Function(GLoginByOperationTokenData_loginByOperationTokenBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GLoginByOperationTokenData_loginByOperationToken build() {
    final _$result = _$v ??
        new _$GLoginByOperationTokenData_loginByOperationToken._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GLoginByOperationTokenData_loginByOperationToken',
                'G__typename'),
            userID: userID,
            accessTokenString: accessTokenString);
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateUserProfileData extends GUpdateUserProfileData {
  @override
  final String G__typename;
  @override
  final GUpdateUserProfileData_updateUserProfile? updateUserProfile;

  factory _$GUpdateUserProfileData(
          [void Function(GUpdateUserProfileDataBuilder)? updates]) =>
      (new GUpdateUserProfileDataBuilder()..update(updates)).build();

  _$GUpdateUserProfileData._(
      {required this.G__typename, this.updateUserProfile})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUpdateUserProfileData', 'G__typename');
  }

  @override
  GUpdateUserProfileData rebuild(
          void Function(GUpdateUserProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserProfileDataBuilder toBuilder() =>
      new GUpdateUserProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserProfileData &&
        G__typename == other.G__typename &&
        updateUserProfile == other.updateUserProfile;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), updateUserProfile.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUpdateUserProfileData')
          ..add('G__typename', G__typename)
          ..add('updateUserProfile', updateUserProfile))
        .toString();
  }
}

class GUpdateUserProfileDataBuilder
    implements Builder<GUpdateUserProfileData, GUpdateUserProfileDataBuilder> {
  _$GUpdateUserProfileData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUpdateUserProfileData_updateUserProfileBuilder? _updateUserProfile;
  GUpdateUserProfileData_updateUserProfileBuilder get updateUserProfile =>
      _$this._updateUserProfile ??=
          new GUpdateUserProfileData_updateUserProfileBuilder();
  set updateUserProfile(
          GUpdateUserProfileData_updateUserProfileBuilder? updateUserProfile) =>
      _$this._updateUserProfile = updateUserProfile;

  GUpdateUserProfileDataBuilder() {
    GUpdateUserProfileData._initializeBuilder(this);
  }

  GUpdateUserProfileDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _updateUserProfile = $v.updateUserProfile?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateUserProfileData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserProfileData;
  }

  @override
  void update(void Function(GUpdateUserProfileDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateUserProfileData build() {
    _$GUpdateUserProfileData _$result;
    try {
      _$result = _$v ??
          new _$GUpdateUserProfileData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GUpdateUserProfileData', 'G__typename'),
              updateUserProfile: _updateUserProfile?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updateUserProfile';
        _updateUserProfile?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUpdateUserProfileData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateUserProfileData_updateUserProfile
    extends GUpdateUserProfileData_updateUserProfile {
  @override
  final String G__typename;
  @override
  final BuiltList<GUpdateUserProfileData_updateUserProfile_fields>? fields;

  factory _$GUpdateUserProfileData_updateUserProfile(
          [void Function(GUpdateUserProfileData_updateUserProfileBuilder)?
              updates]) =>
      (new GUpdateUserProfileData_updateUserProfileBuilder()..update(updates))
          .build();

  _$GUpdateUserProfileData_updateUserProfile._(
      {required this.G__typename, this.fields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GUpdateUserProfileData_updateUserProfile', 'G__typename');
  }

  @override
  GUpdateUserProfileData_updateUserProfile rebuild(
          void Function(GUpdateUserProfileData_updateUserProfileBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserProfileData_updateUserProfileBuilder toBuilder() =>
      new GUpdateUserProfileData_updateUserProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserProfileData_updateUserProfile &&
        G__typename == other.G__typename &&
        fields == other.fields;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), fields.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GUpdateUserProfileData_updateUserProfile')
          ..add('G__typename', G__typename)
          ..add('fields', fields))
        .toString();
  }
}

class GUpdateUserProfileData_updateUserProfileBuilder
    implements
        Builder<GUpdateUserProfileData_updateUserProfile,
            GUpdateUserProfileData_updateUserProfileBuilder> {
  _$GUpdateUserProfileData_updateUserProfile? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GUpdateUserProfileData_updateUserProfile_fields>? _fields;
  ListBuilder<GUpdateUserProfileData_updateUserProfile_fields> get fields =>
      _$this._fields ??=
          new ListBuilder<GUpdateUserProfileData_updateUserProfile_fields>();
  set fields(
          ListBuilder<GUpdateUserProfileData_updateUserProfile_fields>?
              fields) =>
      _$this._fields = fields;

  GUpdateUserProfileData_updateUserProfileBuilder() {
    GUpdateUserProfileData_updateUserProfile._initializeBuilder(this);
  }

  GUpdateUserProfileData_updateUserProfileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _fields = $v.fields?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateUserProfileData_updateUserProfile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserProfileData_updateUserProfile;
  }

  @override
  void update(
      void Function(GUpdateUserProfileData_updateUserProfileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateUserProfileData_updateUserProfile build() {
    _$GUpdateUserProfileData_updateUserProfile _$result;
    try {
      _$result = _$v ??
          new _$GUpdateUserProfileData_updateUserProfile._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  'GUpdateUserProfileData_updateUserProfile', 'G__typename'),
              fields: _fields?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fields';
        _fields?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUpdateUserProfileData_updateUserProfile',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateUserProfileData_updateUserProfile_fields
    extends GUpdateUserProfileData_updateUserProfile_fields {
  @override
  final String G__typename;
  @override
  final String name;
  @override
  final bool? isRequired;
  @override
  final String title;
  @override
  final BuiltList<GUpdateUserProfileData_updateUserProfile_fields_options>?
      options;
  @override
  final BuiltList<
          GUpdateUserProfileData_updateUserProfile_fields_selectedOptions>?
      selectedOptions;
  @override
  final bool? isMultiple;

  factory _$GUpdateUserProfileData_updateUserProfile_fields(
          [void Function(
                  GUpdateUserProfileData_updateUserProfile_fieldsBuilder)?
              updates]) =>
      (new GUpdateUserProfileData_updateUserProfile_fieldsBuilder()
            ..update(updates))
          .build();

  _$GUpdateUserProfileData_updateUserProfile_fields._(
      {required this.G__typename,
      required this.name,
      this.isRequired,
      required this.title,
      this.options,
      this.selectedOptions,
      this.isMultiple})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GUpdateUserProfileData_updateUserProfile_fields', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name, 'GUpdateUserProfileData_updateUserProfile_fields', 'name');
    BuiltValueNullFieldError.checkNotNull(
        title, 'GUpdateUserProfileData_updateUserProfile_fields', 'title');
  }

  @override
  GUpdateUserProfileData_updateUserProfile_fields rebuild(
          void Function(GUpdateUserProfileData_updateUserProfile_fieldsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserProfileData_updateUserProfile_fieldsBuilder toBuilder() =>
      new GUpdateUserProfileData_updateUserProfile_fieldsBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserProfileData_updateUserProfile_fields &&
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
    return (newBuiltValueToStringHelper(
            'GUpdateUserProfileData_updateUserProfile_fields')
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

class GUpdateUserProfileData_updateUserProfile_fieldsBuilder
    implements
        Builder<GUpdateUserProfileData_updateUserProfile_fields,
            GUpdateUserProfileData_updateUserProfile_fieldsBuilder> {
  _$GUpdateUserProfileData_updateUserProfile_fields? _$v;

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

  ListBuilder<GUpdateUserProfileData_updateUserProfile_fields_options>?
      _options;
  ListBuilder<GUpdateUserProfileData_updateUserProfile_fields_options>
      get options => _$this._options ??= new ListBuilder<
          GUpdateUserProfileData_updateUserProfile_fields_options>();
  set options(
          ListBuilder<GUpdateUserProfileData_updateUserProfile_fields_options>?
              options) =>
      _$this._options = options;

  ListBuilder<GUpdateUserProfileData_updateUserProfile_fields_selectedOptions>?
      _selectedOptions;
  ListBuilder<GUpdateUserProfileData_updateUserProfile_fields_selectedOptions>
      get selectedOptions => _$this._selectedOptions ??= new ListBuilder<
          GUpdateUserProfileData_updateUserProfile_fields_selectedOptions>();
  set selectedOptions(
          ListBuilder<
                  GUpdateUserProfileData_updateUserProfile_fields_selectedOptions>?
              selectedOptions) =>
      _$this._selectedOptions = selectedOptions;

  bool? _isMultiple;
  bool? get isMultiple => _$this._isMultiple;
  set isMultiple(bool? isMultiple) => _$this._isMultiple = isMultiple;

  GUpdateUserProfileData_updateUserProfile_fieldsBuilder() {
    GUpdateUserProfileData_updateUserProfile_fields._initializeBuilder(this);
  }

  GUpdateUserProfileData_updateUserProfile_fieldsBuilder get _$this {
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
  void replace(GUpdateUserProfileData_updateUserProfile_fields other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserProfileData_updateUserProfile_fields;
  }

  @override
  void update(
      void Function(GUpdateUserProfileData_updateUserProfile_fieldsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateUserProfileData_updateUserProfile_fields build() {
    _$GUpdateUserProfileData_updateUserProfile_fields _$result;
    try {
      _$result = _$v ??
          new _$GUpdateUserProfileData_updateUserProfile_fields._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  'GUpdateUserProfileData_updateUserProfile_fields',
                  'G__typename'),
              name: BuiltValueNullFieldError.checkNotNull(name,
                  'GUpdateUserProfileData_updateUserProfile_fields', 'name'),
              isRequired: isRequired,
              title: BuiltValueNullFieldError.checkNotNull(title,
                  'GUpdateUserProfileData_updateUserProfile_fields', 'title'),
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
            'GUpdateUserProfileData_updateUserProfile_fields',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateUserProfileData_updateUserProfile_fields_options
    extends GUpdateUserProfileData_updateUserProfile_fields_options {
  @override
  final String G__typename;
  @override
  final String name;
  @override
  final String value;

  factory _$GUpdateUserProfileData_updateUserProfile_fields_options(
          [void Function(
                  GUpdateUserProfileData_updateUserProfile_fields_optionsBuilder)?
              updates]) =>
      (new GUpdateUserProfileData_updateUserProfile_fields_optionsBuilder()
            ..update(updates))
          .build();

  _$GUpdateUserProfileData_updateUserProfile_fields_options._(
      {required this.G__typename, required this.name, required this.value})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GUpdateUserProfileData_updateUserProfile_fields_options',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(name,
        'GUpdateUserProfileData_updateUserProfile_fields_options', 'name');
    BuiltValueNullFieldError.checkNotNull(value,
        'GUpdateUserProfileData_updateUserProfile_fields_options', 'value');
  }

  @override
  GUpdateUserProfileData_updateUserProfile_fields_options rebuild(
          void Function(
                  GUpdateUserProfileData_updateUserProfile_fields_optionsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserProfileData_updateUserProfile_fields_optionsBuilder toBuilder() =>
      new GUpdateUserProfileData_updateUserProfile_fields_optionsBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserProfileData_updateUserProfile_fields_options &&
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
            'GUpdateUserProfileData_updateUserProfile_fields_options')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('value', value))
        .toString();
  }
}

class GUpdateUserProfileData_updateUserProfile_fields_optionsBuilder
    implements
        Builder<GUpdateUserProfileData_updateUserProfile_fields_options,
            GUpdateUserProfileData_updateUserProfile_fields_optionsBuilder> {
  _$GUpdateUserProfileData_updateUserProfile_fields_options? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GUpdateUserProfileData_updateUserProfile_fields_optionsBuilder() {
    GUpdateUserProfileData_updateUserProfile_fields_options._initializeBuilder(
        this);
  }

  GUpdateUserProfileData_updateUserProfile_fields_optionsBuilder get _$this {
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
  void replace(GUpdateUserProfileData_updateUserProfile_fields_options other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserProfileData_updateUserProfile_fields_options;
  }

  @override
  void update(
      void Function(
              GUpdateUserProfileData_updateUserProfile_fields_optionsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateUserProfileData_updateUserProfile_fields_options build() {
    final _$result = _$v ??
        new _$GUpdateUserProfileData_updateUserProfile_fields_options._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GUpdateUserProfileData_updateUserProfile_fields_options',
                'G__typename'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                'GUpdateUserProfileData_updateUserProfile_fields_options',
                'name'),
            value: BuiltValueNullFieldError.checkNotNull(
                value,
                'GUpdateUserProfileData_updateUserProfile_fields_options',
                'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateUserProfileData_updateUserProfile_fields_selectedOptions
    extends GUpdateUserProfileData_updateUserProfile_fields_selectedOptions {
  @override
  final String G__typename;
  @override
  final String name;
  @override
  final String value;

  factory _$GUpdateUserProfileData_updateUserProfile_fields_selectedOptions(
          [void Function(
                  GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsBuilder)?
              updates]) =>
      (new GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsBuilder()
            ..update(updates))
          .build();

  _$GUpdateUserProfileData_updateUserProfile_fields_selectedOptions._(
      {required this.G__typename, required this.name, required this.value})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GUpdateUserProfileData_updateUserProfile_fields_selectedOptions',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name,
        'GUpdateUserProfileData_updateUserProfile_fields_selectedOptions',
        'name');
    BuiltValueNullFieldError.checkNotNull(
        value,
        'GUpdateUserProfileData_updateUserProfile_fields_selectedOptions',
        'value');
  }

  @override
  GUpdateUserProfileData_updateUserProfile_fields_selectedOptions rebuild(
          void Function(
                  GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsBuilder
      toBuilder() =>
          new GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GUpdateUserProfileData_updateUserProfile_fields_selectedOptions &&
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
            'GUpdateUserProfileData_updateUserProfile_fields_selectedOptions')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('value', value))
        .toString();
  }
}

class GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsBuilder
    implements
        Builder<GUpdateUserProfileData_updateUserProfile_fields_selectedOptions,
            GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsBuilder> {
  _$GUpdateUserProfileData_updateUserProfile_fields_selectedOptions? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsBuilder() {
    GUpdateUserProfileData_updateUserProfile_fields_selectedOptions
        ._initializeBuilder(this);
  }

  GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsBuilder
      get _$this {
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
  void replace(
      GUpdateUserProfileData_updateUserProfile_fields_selectedOptions other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GUpdateUserProfileData_updateUserProfile_fields_selectedOptions;
  }

  @override
  void update(
      void Function(
              GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateUserProfileData_updateUserProfile_fields_selectedOptions build() {
    final _$result = _$v ??
        new _$GUpdateUserProfileData_updateUserProfile_fields_selectedOptions._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GUpdateUserProfileData_updateUserProfile_fields_selectedOptions',
                'G__typename'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                'GUpdateUserProfileData_updateUserProfile_fields_selectedOptions',
                'name'),
            value: BuiltValueNullFieldError.checkNotNull(
                value,
                'GUpdateUserProfileData_updateUserProfile_fields_selectedOptions',
                'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GBindWechatData extends GBindWechatData {
  @override
  final String G__typename;
  @override
  final bool? bindWechat;

  factory _$GBindWechatData([void Function(GBindWechatDataBuilder)? updates]) =>
      (new GBindWechatDataBuilder()..update(updates)).build();

  _$GBindWechatData._({required this.G__typename, this.bindWechat})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GBindWechatData', 'G__typename');
  }

  @override
  GBindWechatData rebuild(void Function(GBindWechatDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBindWechatDataBuilder toBuilder() =>
      new GBindWechatDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBindWechatData &&
        G__typename == other.G__typename &&
        bindWechat == other.bindWechat;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), bindWechat.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GBindWechatData')
          ..add('G__typename', G__typename)
          ..add('bindWechat', bindWechat))
        .toString();
  }
}

class GBindWechatDataBuilder
    implements Builder<GBindWechatData, GBindWechatDataBuilder> {
  _$GBindWechatData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _bindWechat;
  bool? get bindWechat => _$this._bindWechat;
  set bindWechat(bool? bindWechat) => _$this._bindWechat = bindWechat;

  GBindWechatDataBuilder() {
    GBindWechatData._initializeBuilder(this);
  }

  GBindWechatDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _bindWechat = $v.bindWechat;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBindWechatData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GBindWechatData;
  }

  @override
  void update(void Function(GBindWechatDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GBindWechatData build() {
    final _$result = _$v ??
        new _$GBindWechatData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GBindWechatData', 'G__typename'),
            bindWechat: bindWechat);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
