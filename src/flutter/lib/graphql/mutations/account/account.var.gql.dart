// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'account.var.gql.g.dart';

abstract class GLoginByPasswordVars
    implements Built<GLoginByPasswordVars, GLoginByPasswordVarsBuilder> {
  GLoginByPasswordVars._();

  factory GLoginByPasswordVars(
          [Function(GLoginByPasswordVarsBuilder b) updates]) =
      _$GLoginByPasswordVars;

  String get account;
  String get password;
  static Serializer<GLoginByPasswordVars> get serializer =>
      _$gLoginByPasswordVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GLoginByPasswordVars.serializer, this)
          as Map<String, dynamic>);
  static GLoginByPasswordVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GLoginByPasswordVars.serializer, json);
}

abstract class GLoginWithAppleVars
    implements Built<GLoginWithAppleVars, GLoginWithAppleVarsBuilder> {
  GLoginWithAppleVars._();

  factory GLoginWithAppleVars(
      [Function(GLoginWithAppleVarsBuilder b) updates]) = _$GLoginWithAppleVars;

  String get userID;
  String get identityToken;
  String? get name;
  static Serializer<GLoginWithAppleVars> get serializer =>
      _$gLoginWithAppleVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GLoginWithAppleVars.serializer, this)
          as Map<String, dynamic>);
  static GLoginWithAppleVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GLoginWithAppleVars.serializer, json);
}

abstract class GLoginByWeChatVars
    implements Built<GLoginByWeChatVars, GLoginByWeChatVarsBuilder> {
  GLoginByWeChatVars._();

  factory GLoginByWeChatVars([Function(GLoginByWeChatVarsBuilder b) updates]) =
      _$GLoginByWeChatVars;

  String get code;
  _i2.GNextPlatform get platform;
  static Serializer<GLoginByWeChatVars> get serializer =>
      _$gLoginByWeChatVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GLoginByWeChatVars.serializer, this)
          as Map<String, dynamic>);
  static GLoginByWeChatVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GLoginByWeChatVars.serializer, json);
}

abstract class GUpdateAccessTokenVars
    implements Built<GUpdateAccessTokenVars, GUpdateAccessTokenVarsBuilder> {
  GUpdateAccessTokenVars._();

  factory GUpdateAccessTokenVars(
          [Function(GUpdateAccessTokenVarsBuilder b) updates]) =
      _$GUpdateAccessTokenVars;

  static Serializer<GUpdateAccessTokenVars> get serializer =>
      _$gUpdateAccessTokenVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUpdateAccessTokenVars.serializer, this)
          as Map<String, dynamic>);
  static GUpdateAccessTokenVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdateAccessTokenVars.serializer, json);
}

abstract class GVerifyCodeVars
    implements Built<GVerifyCodeVars, GVerifyCodeVarsBuilder> {
  GVerifyCodeVars._();

  factory GVerifyCodeVars([Function(GVerifyCodeVarsBuilder b) updates]) =
      _$GVerifyCodeVars;

  _i2.GVerifyCodeInput get input;
  static Serializer<GVerifyCodeVars> get serializer =>
      _$gVerifyCodeVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GVerifyCodeVars.serializer, this)
          as Map<String, dynamic>);
  static GVerifyCodeVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GVerifyCodeVars.serializer, json);
}

abstract class GCreateVerificationCodeForBindingContactVars
    implements
        Built<GCreateVerificationCodeForBindingContactVars,
            GCreateVerificationCodeForBindingContactVarsBuilder> {
  GCreateVerificationCodeForBindingContactVars._();

  factory GCreateVerificationCodeForBindingContactVars(
      [Function(GCreateVerificationCodeForBindingContactVarsBuilder b)
          updates]) = _$GCreateVerificationCodeForBindingContactVars;

  String get contactInfo;
  _i2.GContactType get contactType;
  static Serializer<GCreateVerificationCodeForBindingContactVars>
      get serializer =>
          _$gCreateVerificationCodeForBindingContactVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GCreateVerificationCodeForBindingContactVars.serializer, this)
      as Map<String, dynamic>);
  static GCreateVerificationCodeForBindingContactVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GCreateVerificationCodeForBindingContactVars.serializer, json);
}

abstract class GBindContactVars
    implements Built<GBindContactVars, GBindContactVarsBuilder> {
  GBindContactVars._();

  factory GBindContactVars([Function(GBindContactVarsBuilder b) updates]) =
      _$GBindContactVars;

  String get contactInfo;
  _i2.GContactType get contactType;
  String get operationToken;
  static Serializer<GBindContactVars> get serializer =>
      _$gBindContactVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GBindContactVars.serializer, this)
          as Map<String, dynamic>);
  static GBindContactVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GBindContactVars.serializer, json);
}

abstract class GLoginByOperationTokenVars
    implements
        Built<GLoginByOperationTokenVars, GLoginByOperationTokenVarsBuilder> {
  GLoginByOperationTokenVars._();

  factory GLoginByOperationTokenVars(
          [Function(GLoginByOperationTokenVarsBuilder b) updates]) =
      _$GLoginByOperationTokenVars;

  String get contactInfo;
  _i2.GContactType get contactType;
  String get operationToken;
  static Serializer<GLoginByOperationTokenVars> get serializer =>
      _$gLoginByOperationTokenVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GLoginByOperationTokenVars.serializer, this) as Map<String, dynamic>);
  static GLoginByOperationTokenVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GLoginByOperationTokenVars.serializer, json);
}

abstract class GUpdateUserProfileVars
    implements Built<GUpdateUserProfileVars, GUpdateUserProfileVarsBuilder> {
  GUpdateUserProfileVars._();

  factory GUpdateUserProfileVars(
          [Function(GUpdateUserProfileVarsBuilder b) updates]) =
      _$GUpdateUserProfileVars;

  _i2.GUpdateUserProfileInput? get input;
  static Serializer<GUpdateUserProfileVars> get serializer =>
      _$gUpdateUserProfileVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUpdateUserProfileVars.serializer, this)
          as Map<String, dynamic>);
  static GUpdateUserProfileVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdateUserProfileVars.serializer, json);
}

abstract class GBindWechatVars
    implements Built<GBindWechatVars, GBindWechatVarsBuilder> {
  GBindWechatVars._();

  factory GBindWechatVars([Function(GBindWechatVarsBuilder b) updates]) =
      _$GBindWechatVars;

  String get code;
  _i2.GNextPlatform get platform;
  static Serializer<GBindWechatVars> get serializer =>
      _$gBindWechatVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GBindWechatVars.serializer, this)
          as Map<String, dynamic>);
  static GBindWechatVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GBindWechatVars.serializer, json);
}
