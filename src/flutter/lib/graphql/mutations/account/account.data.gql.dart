// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;
import 'package:rime_app/graphql/types/user_profile/user_profile.data.gql.dart'
    as _i3;

part 'account.data.gql.g.dart';

abstract class GLoginByPasswordData
    implements Built<GLoginByPasswordData, GLoginByPasswordDataBuilder> {
  GLoginByPasswordData._();

  factory GLoginByPasswordData(
          [Function(GLoginByPasswordDataBuilder b) updates]) =
      _$GLoginByPasswordData;

  static void _initializeBuilder(GLoginByPasswordDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GLoginByPasswordData_loginByPassword? get loginByPassword;
  static Serializer<GLoginByPasswordData> get serializer =>
      _$gLoginByPasswordDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GLoginByPasswordData.serializer, this)
          as Map<String, dynamic>);
  static GLoginByPasswordData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GLoginByPasswordData.serializer, json);
}

abstract class GLoginByPasswordData_loginByPassword
    implements
        Built<GLoginByPasswordData_loginByPassword,
            GLoginByPasswordData_loginByPasswordBuilder> {
  GLoginByPasswordData_loginByPassword._();

  factory GLoginByPasswordData_loginByPassword(
          [Function(GLoginByPasswordData_loginByPasswordBuilder b) updates]) =
      _$GLoginByPasswordData_loginByPassword;

  static void _initializeBuilder(
          GLoginByPasswordData_loginByPasswordBuilder b) =>
      b..G__typename = 'AuthPayload';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get accessTokenString;
  String? get userID;
  static Serializer<GLoginByPasswordData_loginByPassword> get serializer =>
      _$gLoginByPasswordDataLoginByPasswordSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GLoginByPasswordData_loginByPassword.serializer, this)
      as Map<String, dynamic>);
  static GLoginByPasswordData_loginByPassword? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GLoginByPasswordData_loginByPassword.serializer, json);
}

abstract class GLoginWithAppleData
    implements Built<GLoginWithAppleData, GLoginWithAppleDataBuilder> {
  GLoginWithAppleData._();

  factory GLoginWithAppleData(
      [Function(GLoginWithAppleDataBuilder b) updates]) = _$GLoginWithAppleData;

  static void _initializeBuilder(GLoginWithAppleDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GLoginWithAppleData_loginWithApple? get loginWithApple;
  static Serializer<GLoginWithAppleData> get serializer =>
      _$gLoginWithAppleDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GLoginWithAppleData.serializer, this)
          as Map<String, dynamic>);
  static GLoginWithAppleData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GLoginWithAppleData.serializer, json);
}

abstract class GLoginWithAppleData_loginWithApple
    implements
        Built<GLoginWithAppleData_loginWithApple,
            GLoginWithAppleData_loginWithAppleBuilder> {
  GLoginWithAppleData_loginWithApple._();

  factory GLoginWithAppleData_loginWithApple(
          [Function(GLoginWithAppleData_loginWithAppleBuilder b) updates]) =
      _$GLoginWithAppleData_loginWithApple;

  static void _initializeBuilder(GLoginWithAppleData_loginWithAppleBuilder b) =>
      b..G__typename = 'AuthPayload';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get accessTokenString;
  String? get userID;
  static Serializer<GLoginWithAppleData_loginWithApple> get serializer =>
      _$gLoginWithAppleDataLoginWithAppleSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GLoginWithAppleData_loginWithApple.serializer, this)
      as Map<String, dynamic>);
  static GLoginWithAppleData_loginWithApple? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GLoginWithAppleData_loginWithApple.serializer, json);
}

abstract class GLoginByWeChatData
    implements Built<GLoginByWeChatData, GLoginByWeChatDataBuilder> {
  GLoginByWeChatData._();

  factory GLoginByWeChatData([Function(GLoginByWeChatDataBuilder b) updates]) =
      _$GLoginByWeChatData;

  static void _initializeBuilder(GLoginByWeChatDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GLoginByWeChatData_loginByWeChat? get loginByWeChat;
  static Serializer<GLoginByWeChatData> get serializer =>
      _$gLoginByWeChatDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GLoginByWeChatData.serializer, this)
          as Map<String, dynamic>);
  static GLoginByWeChatData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GLoginByWeChatData.serializer, json);
}

abstract class GLoginByWeChatData_loginByWeChat
    implements
        Built<GLoginByWeChatData_loginByWeChat,
            GLoginByWeChatData_loginByWeChatBuilder> {
  GLoginByWeChatData_loginByWeChat._();

  factory GLoginByWeChatData_loginByWeChat(
          [Function(GLoginByWeChatData_loginByWeChatBuilder b) updates]) =
      _$GLoginByWeChatData_loginByWeChat;

  static void _initializeBuilder(GLoginByWeChatData_loginByWeChatBuilder b) =>
      b..G__typename = 'AuthPayload';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get accessTokenString;
  String? get userID;
  static Serializer<GLoginByWeChatData_loginByWeChat> get serializer =>
      _$gLoginByWeChatDataLoginByWeChatSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GLoginByWeChatData_loginByWeChat.serializer, this)
      as Map<String, dynamic>);
  static GLoginByWeChatData_loginByWeChat? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GLoginByWeChatData_loginByWeChat.serializer, json);
}

abstract class GUpdateAccessTokenData
    implements Built<GUpdateAccessTokenData, GUpdateAccessTokenDataBuilder> {
  GUpdateAccessTokenData._();

  factory GUpdateAccessTokenData(
          [Function(GUpdateAccessTokenDataBuilder b) updates]) =
      _$GUpdateAccessTokenData;

  static void _initializeBuilder(GUpdateAccessTokenDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get updateAccessToken;
  static Serializer<GUpdateAccessTokenData> get serializer =>
      _$gUpdateAccessTokenDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUpdateAccessTokenData.serializer, this)
          as Map<String, dynamic>);
  static GUpdateAccessTokenData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdateAccessTokenData.serializer, json);
}

abstract class GVerifyCodeData
    implements Built<GVerifyCodeData, GVerifyCodeDataBuilder> {
  GVerifyCodeData._();

  factory GVerifyCodeData([Function(GVerifyCodeDataBuilder b) updates]) =
      _$GVerifyCodeData;

  static void _initializeBuilder(GVerifyCodeDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get verifyCode;
  static Serializer<GVerifyCodeData> get serializer =>
      _$gVerifyCodeDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GVerifyCodeData.serializer, this)
          as Map<String, dynamic>);
  static GVerifyCodeData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GVerifyCodeData.serializer, json);
}

abstract class GCreateVerificationCodeForBindingContactData
    implements
        Built<GCreateVerificationCodeForBindingContactData,
            GCreateVerificationCodeForBindingContactDataBuilder> {
  GCreateVerificationCodeForBindingContactData._();

  factory GCreateVerificationCodeForBindingContactData(
      [Function(GCreateVerificationCodeForBindingContactDataBuilder b)
          updates]) = _$GCreateVerificationCodeForBindingContactData;

  static void _initializeBuilder(
          GCreateVerificationCodeForBindingContactDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get createVerificationCodeForBindingContact;
  static Serializer<GCreateVerificationCodeForBindingContactData>
      get serializer =>
          _$gCreateVerificationCodeForBindingContactDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GCreateVerificationCodeForBindingContactData.serializer, this)
      as Map<String, dynamic>);
  static GCreateVerificationCodeForBindingContactData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GCreateVerificationCodeForBindingContactData.serializer, json);
}

abstract class GBindContactData
    implements Built<GBindContactData, GBindContactDataBuilder> {
  GBindContactData._();

  factory GBindContactData([Function(GBindContactDataBuilder b) updates]) =
      _$GBindContactData;

  static void _initializeBuilder(GBindContactDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GBindContactData_bindContact? get bindContact;
  static Serializer<GBindContactData> get serializer =>
      _$gBindContactDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GBindContactData.serializer, this)
          as Map<String, dynamic>);
  static GBindContactData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GBindContactData.serializer, json);
}

abstract class GBindContactData_bindContact
    implements
        Built<GBindContactData_bindContact,
            GBindContactData_bindContactBuilder> {
  GBindContactData_bindContact._();

  factory GBindContactData_bindContact(
          [Function(GBindContactData_bindContactBuilder b) updates]) =
      _$GBindContactData_bindContact;

  static void _initializeBuilder(GBindContactData_bindContactBuilder b) =>
      b..G__typename = 'UserInformation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get userID;
  _i2.GRole get role;
  String? get userName;
  String? get avatarURL;
  String? get description;
  String? get email;
  String? get phone;
  static Serializer<GBindContactData_bindContact> get serializer =>
      _$gBindContactDataBindContactSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GBindContactData_bindContact.serializer, this) as Map<String, dynamic>);
  static GBindContactData_bindContact? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GBindContactData_bindContact.serializer, json);
}

abstract class GLoginByOperationTokenData
    implements
        Built<GLoginByOperationTokenData, GLoginByOperationTokenDataBuilder> {
  GLoginByOperationTokenData._();

  factory GLoginByOperationTokenData(
          [Function(GLoginByOperationTokenDataBuilder b) updates]) =
      _$GLoginByOperationTokenData;

  static void _initializeBuilder(GLoginByOperationTokenDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GLoginByOperationTokenData_loginByOperationToken? get loginByOperationToken;
  static Serializer<GLoginByOperationTokenData> get serializer =>
      _$gLoginByOperationTokenDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GLoginByOperationTokenData.serializer, this) as Map<String, dynamic>);
  static GLoginByOperationTokenData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GLoginByOperationTokenData.serializer, json);
}

abstract class GLoginByOperationTokenData_loginByOperationToken
    implements
        Built<GLoginByOperationTokenData_loginByOperationToken,
            GLoginByOperationTokenData_loginByOperationTokenBuilder> {
  GLoginByOperationTokenData_loginByOperationToken._();

  factory GLoginByOperationTokenData_loginByOperationToken(
      [Function(GLoginByOperationTokenData_loginByOperationTokenBuilder b)
          updates]) = _$GLoginByOperationTokenData_loginByOperationToken;

  static void _initializeBuilder(
          GLoginByOperationTokenData_loginByOperationTokenBuilder b) =>
      b..G__typename = 'AuthPayload';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get userID;
  String? get accessTokenString;
  static Serializer<GLoginByOperationTokenData_loginByOperationToken>
      get serializer =>
          _$gLoginByOperationTokenDataLoginByOperationTokenSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GLoginByOperationTokenData_loginByOperationToken.serializer, this)
      as Map<String, dynamic>);
  static GLoginByOperationTokenData_loginByOperationToken? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GLoginByOperationTokenData_loginByOperationToken.serializer, json);
}

abstract class GUpdateUserProfileData
    implements Built<GUpdateUserProfileData, GUpdateUserProfileDataBuilder> {
  GUpdateUserProfileData._();

  factory GUpdateUserProfileData(
          [Function(GUpdateUserProfileDataBuilder b) updates]) =
      _$GUpdateUserProfileData;

  static void _initializeBuilder(GUpdateUserProfileDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateUserProfileData_updateUserProfile? get updateUserProfile;
  static Serializer<GUpdateUserProfileData> get serializer =>
      _$gUpdateUserProfileDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUpdateUserProfileData.serializer, this)
          as Map<String, dynamic>);
  static GUpdateUserProfileData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdateUserProfileData.serializer, json);
}

abstract class GUpdateUserProfileData_updateUserProfile
    implements
        Built<GUpdateUserProfileData_updateUserProfile,
            GUpdateUserProfileData_updateUserProfileBuilder>,
        _i3.GUserProfileFields {
  GUpdateUserProfileData_updateUserProfile._();

  factory GUpdateUserProfileData_updateUserProfile(
      [Function(GUpdateUserProfileData_updateUserProfileBuilder b)
          updates]) = _$GUpdateUserProfileData_updateUserProfile;

  static void _initializeBuilder(
          GUpdateUserProfileData_updateUserProfileBuilder b) =>
      b..G__typename = 'UserProfile';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GUpdateUserProfileData_updateUserProfile_fields>? get fields;
  static Serializer<GUpdateUserProfileData_updateUserProfile> get serializer =>
      _$gUpdateUserProfileDataUpdateUserProfileSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GUpdateUserProfileData_updateUserProfile.serializer, this)
      as Map<String, dynamic>);
  static GUpdateUserProfileData_updateUserProfile? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GUpdateUserProfileData_updateUserProfile.serializer, json);
}

abstract class GUpdateUserProfileData_updateUserProfile_fields
    implements
        Built<GUpdateUserProfileData_updateUserProfile_fields,
            GUpdateUserProfileData_updateUserProfile_fieldsBuilder>,
        _i3.GUserProfileFields_fields {
  GUpdateUserProfileData_updateUserProfile_fields._();

  factory GUpdateUserProfileData_updateUserProfile_fields(
      [Function(GUpdateUserProfileData_updateUserProfile_fieldsBuilder b)
          updates]) = _$GUpdateUserProfileData_updateUserProfile_fields;

  static void _initializeBuilder(
          GUpdateUserProfileData_updateUserProfile_fieldsBuilder b) =>
      b..G__typename = 'UserProfileField';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  bool? get isRequired;
  String get title;
  BuiltList<GUpdateUserProfileData_updateUserProfile_fields_options>?
      get options;
  BuiltList<GUpdateUserProfileData_updateUserProfile_fields_selectedOptions>?
      get selectedOptions;
  bool? get isMultiple;
  static Serializer<GUpdateUserProfileData_updateUserProfile_fields>
      get serializer =>
          _$gUpdateUserProfileDataUpdateUserProfileFieldsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GUpdateUserProfileData_updateUserProfile_fields.serializer, this)
      as Map<String, dynamic>);
  static GUpdateUserProfileData_updateUserProfile_fields? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GUpdateUserProfileData_updateUserProfile_fields.serializer, json);
}

abstract class GUpdateUserProfileData_updateUserProfile_fields_options
    implements
        Built<GUpdateUserProfileData_updateUserProfile_fields_options,
            GUpdateUserProfileData_updateUserProfile_fields_optionsBuilder>,
        _i3.GUserProfileFields_fields_options {
  GUpdateUserProfileData_updateUserProfile_fields_options._();

  factory GUpdateUserProfileData_updateUserProfile_fields_options(
      [Function(
              GUpdateUserProfileData_updateUserProfile_fields_optionsBuilder b)
          updates]) = _$GUpdateUserProfileData_updateUserProfile_fields_options;

  static void _initializeBuilder(
          GUpdateUserProfileData_updateUserProfile_fields_optionsBuilder b) =>
      b..G__typename = 'UserProfileFieldOption';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  String get value;
  static Serializer<GUpdateUserProfileData_updateUserProfile_fields_options>
      get serializer =>
          _$gUpdateUserProfileDataUpdateUserProfileFieldsOptionsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GUpdateUserProfileData_updateUserProfile_fields_options.serializer,
      this) as Map<String, dynamic>);
  static GUpdateUserProfileData_updateUserProfile_fields_options? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GUpdateUserProfileData_updateUserProfile_fields_options.serializer,
          json);
}

abstract class GUpdateUserProfileData_updateUserProfile_fields_selectedOptions
    implements
        Built<GUpdateUserProfileData_updateUserProfile_fields_selectedOptions,
            GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsBuilder>,
        _i3.GUserProfileFields_fields_selectedOptions {
  GUpdateUserProfileData_updateUserProfile_fields_selectedOptions._();

  factory GUpdateUserProfileData_updateUserProfile_fields_selectedOptions(
          [Function(
                  GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsBuilder
                      b)
              updates]) =
      _$GUpdateUserProfileData_updateUserProfile_fields_selectedOptions;

  static void _initializeBuilder(
          GUpdateUserProfileData_updateUserProfile_fields_selectedOptionsBuilder
              b) =>
      b..G__typename = 'UserProfileFieldOption';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  String get value;
  static Serializer<
          GUpdateUserProfileData_updateUserProfile_fields_selectedOptions>
      get serializer =>
          _$gUpdateUserProfileDataUpdateUserProfileFieldsSelectedOptionsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GUpdateUserProfileData_updateUserProfile_fields_selectedOptions
          .serializer,
      this) as Map<String, dynamic>);
  static GUpdateUserProfileData_updateUserProfile_fields_selectedOptions?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GUpdateUserProfileData_updateUserProfile_fields_selectedOptions
              .serializer,
          json);
}

abstract class GBindWechatData
    implements Built<GBindWechatData, GBindWechatDataBuilder> {
  GBindWechatData._();

  factory GBindWechatData([Function(GBindWechatDataBuilder b) updates]) =
      _$GBindWechatData;

  static void _initializeBuilder(GBindWechatDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get bindWechat;
  static Serializer<GBindWechatData> get serializer =>
      _$gBindWechatDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GBindWechatData.serializer, this)
          as Map<String, dynamic>);
  static GBindWechatData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GBindWechatData.serializer, json);
}
