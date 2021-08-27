// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/mutations/account/account.ast.gql.dart' as _i5;
import 'package:rime_app/graphql/mutations/account/account.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/mutations/account/account.var.gql.dart' as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'account.req.gql.g.dart';

abstract class GLoginByPasswordReq
    implements
        Built<GLoginByPasswordReq, GLoginByPasswordReqBuilder>,
        _i1.OperationRequest<_i2.GLoginByPasswordData,
            _i3.GLoginByPasswordVars> {
  GLoginByPasswordReq._();

  factory GLoginByPasswordReq(
      [Function(GLoginByPasswordReqBuilder b) updates]) = _$GLoginByPasswordReq;

  static void _initializeBuilder(GLoginByPasswordReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'LoginByPassword')
    ..executeOnListen = true;
  _i3.GLoginByPasswordVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GLoginByPasswordData? Function(
      _i2.GLoginByPasswordData?, _i2.GLoginByPasswordData?)? get updateResult;
  _i2.GLoginByPasswordData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GLoginByPasswordData? parseData(Map<String, dynamic> json) =>
      _i2.GLoginByPasswordData.fromJson(json);
  static Serializer<GLoginByPasswordReq> get serializer =>
      _$gLoginByPasswordReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GLoginByPasswordReq.serializer, this)
          as Map<String, dynamic>);
  static GLoginByPasswordReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GLoginByPasswordReq.serializer, json);
}

abstract class GLoginWithAppleReq
    implements
        Built<GLoginWithAppleReq, GLoginWithAppleReqBuilder>,
        _i1.OperationRequest<_i2.GLoginWithAppleData, _i3.GLoginWithAppleVars> {
  GLoginWithAppleReq._();

  factory GLoginWithAppleReq([Function(GLoginWithAppleReqBuilder b) updates]) =
      _$GLoginWithAppleReq;

  static void _initializeBuilder(GLoginWithAppleReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'LoginWithApple')
    ..executeOnListen = true;
  _i3.GLoginWithAppleVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GLoginWithAppleData? Function(
      _i2.GLoginWithAppleData?, _i2.GLoginWithAppleData?)? get updateResult;
  _i2.GLoginWithAppleData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GLoginWithAppleData? parseData(Map<String, dynamic> json) =>
      _i2.GLoginWithAppleData.fromJson(json);
  static Serializer<GLoginWithAppleReq> get serializer =>
      _$gLoginWithAppleReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GLoginWithAppleReq.serializer, this)
          as Map<String, dynamic>);
  static GLoginWithAppleReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GLoginWithAppleReq.serializer, json);
}

abstract class GLoginByWeChatReq
    implements
        Built<GLoginByWeChatReq, GLoginByWeChatReqBuilder>,
        _i1.OperationRequest<_i2.GLoginByWeChatData, _i3.GLoginByWeChatVars> {
  GLoginByWeChatReq._();

  factory GLoginByWeChatReq([Function(GLoginByWeChatReqBuilder b) updates]) =
      _$GLoginByWeChatReq;

  static void _initializeBuilder(GLoginByWeChatReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'LoginByWeChat')
    ..executeOnListen = true;
  _i3.GLoginByWeChatVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GLoginByWeChatData? Function(
      _i2.GLoginByWeChatData?, _i2.GLoginByWeChatData?)? get updateResult;
  _i2.GLoginByWeChatData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GLoginByWeChatData? parseData(Map<String, dynamic> json) =>
      _i2.GLoginByWeChatData.fromJson(json);
  static Serializer<GLoginByWeChatReq> get serializer =>
      _$gLoginByWeChatReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GLoginByWeChatReq.serializer, this)
          as Map<String, dynamic>);
  static GLoginByWeChatReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GLoginByWeChatReq.serializer, json);
}

abstract class GUpdateAccessTokenReq
    implements
        Built<GUpdateAccessTokenReq, GUpdateAccessTokenReqBuilder>,
        _i1.OperationRequest<_i2.GUpdateAccessTokenData,
            _i3.GUpdateAccessTokenVars> {
  GUpdateAccessTokenReq._();

  factory GUpdateAccessTokenReq(
          [Function(GUpdateAccessTokenReqBuilder b) updates]) =
      _$GUpdateAccessTokenReq;

  static void _initializeBuilder(GUpdateAccessTokenReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'UpdateAccessToken')
    ..executeOnListen = true;
  _i3.GUpdateAccessTokenVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GUpdateAccessTokenData? Function(
          _i2.GUpdateAccessTokenData?, _i2.GUpdateAccessTokenData?)?
      get updateResult;
  _i2.GUpdateAccessTokenData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GUpdateAccessTokenData? parseData(Map<String, dynamic> json) =>
      _i2.GUpdateAccessTokenData.fromJson(json);
  static Serializer<GUpdateAccessTokenReq> get serializer =>
      _$gUpdateAccessTokenReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GUpdateAccessTokenReq.serializer, this)
          as Map<String, dynamic>);
  static GUpdateAccessTokenReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GUpdateAccessTokenReq.serializer, json);
}

abstract class GVerifyCodeReq
    implements
        Built<GVerifyCodeReq, GVerifyCodeReqBuilder>,
        _i1.OperationRequest<_i2.GVerifyCodeData, _i3.GVerifyCodeVars> {
  GVerifyCodeReq._();

  factory GVerifyCodeReq([Function(GVerifyCodeReqBuilder b) updates]) =
      _$GVerifyCodeReq;

  static void _initializeBuilder(GVerifyCodeReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'VerifyCode')
    ..executeOnListen = true;
  _i3.GVerifyCodeVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GVerifyCodeData? Function(_i2.GVerifyCodeData?, _i2.GVerifyCodeData?)?
      get updateResult;
  _i2.GVerifyCodeData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GVerifyCodeData? parseData(Map<String, dynamic> json) =>
      _i2.GVerifyCodeData.fromJson(json);
  static Serializer<GVerifyCodeReq> get serializer =>
      _$gVerifyCodeReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GVerifyCodeReq.serializer, this)
          as Map<String, dynamic>);
  static GVerifyCodeReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GVerifyCodeReq.serializer, json);
}

abstract class GCreateVerificationCodeForBindingContactReq
    implements
        Built<GCreateVerificationCodeForBindingContactReq,
            GCreateVerificationCodeForBindingContactReqBuilder>,
        _i1.OperationRequest<_i2.GCreateVerificationCodeForBindingContactData,
            _i3.GCreateVerificationCodeForBindingContactVars> {
  GCreateVerificationCodeForBindingContactReq._();

  factory GCreateVerificationCodeForBindingContactReq(
      [Function(GCreateVerificationCodeForBindingContactReqBuilder b)
          updates]) = _$GCreateVerificationCodeForBindingContactReq;

  static void _initializeBuilder(
          GCreateVerificationCodeForBindingContactReqBuilder b) =>
      b
        ..operation = _i4.Operation(
            document: _i5.document,
            operationName: 'CreateVerificationCodeForBindingContact')
        ..executeOnListen = true;
  _i3.GCreateVerificationCodeForBindingContactVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GCreateVerificationCodeForBindingContactData? Function(
      _i2.GCreateVerificationCodeForBindingContactData?,
      _i2.GCreateVerificationCodeForBindingContactData?)? get updateResult;
  _i2.GCreateVerificationCodeForBindingContactData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GCreateVerificationCodeForBindingContactData? parseData(
          Map<String, dynamic> json) =>
      _i2.GCreateVerificationCodeForBindingContactData.fromJson(json);
  static Serializer<GCreateVerificationCodeForBindingContactReq>
      get serializer => _$gCreateVerificationCodeForBindingContactReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
          GCreateVerificationCodeForBindingContactReq.serializer, this)
      as Map<String, dynamic>);
  static GCreateVerificationCodeForBindingContactReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
          GCreateVerificationCodeForBindingContactReq.serializer, json);
}

abstract class GBindContactReq
    implements
        Built<GBindContactReq, GBindContactReqBuilder>,
        _i1.OperationRequest<_i2.GBindContactData, _i3.GBindContactVars> {
  GBindContactReq._();

  factory GBindContactReq([Function(GBindContactReqBuilder b) updates]) =
      _$GBindContactReq;

  static void _initializeBuilder(GBindContactReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'BindContact')
    ..executeOnListen = true;
  _i3.GBindContactVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GBindContactData? Function(_i2.GBindContactData?, _i2.GBindContactData?)?
      get updateResult;
  _i2.GBindContactData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GBindContactData? parseData(Map<String, dynamic> json) =>
      _i2.GBindContactData.fromJson(json);
  static Serializer<GBindContactReq> get serializer =>
      _$gBindContactReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GBindContactReq.serializer, this)
          as Map<String, dynamic>);
  static GBindContactReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GBindContactReq.serializer, json);
}

abstract class GLoginByOperationTokenReq
    implements
        Built<GLoginByOperationTokenReq, GLoginByOperationTokenReqBuilder>,
        _i1.OperationRequest<_i2.GLoginByOperationTokenData,
            _i3.GLoginByOperationTokenVars> {
  GLoginByOperationTokenReq._();

  factory GLoginByOperationTokenReq(
          [Function(GLoginByOperationTokenReqBuilder b) updates]) =
      _$GLoginByOperationTokenReq;

  static void _initializeBuilder(GLoginByOperationTokenReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'LoginByOperationToken')
    ..executeOnListen = true;
  _i3.GLoginByOperationTokenVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GLoginByOperationTokenData? Function(
          _i2.GLoginByOperationTokenData?, _i2.GLoginByOperationTokenData?)?
      get updateResult;
  _i2.GLoginByOperationTokenData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GLoginByOperationTokenData? parseData(Map<String, dynamic> json) =>
      _i2.GLoginByOperationTokenData.fromJson(json);
  static Serializer<GLoginByOperationTokenReq> get serializer =>
      _$gLoginByOperationTokenReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GLoginByOperationTokenReq.serializer, this)
          as Map<String, dynamic>);
  static GLoginByOperationTokenReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GLoginByOperationTokenReq.serializer, json);
}

abstract class GUpdateUserProfileReq
    implements
        Built<GUpdateUserProfileReq, GUpdateUserProfileReqBuilder>,
        _i1.OperationRequest<_i2.GUpdateUserProfileData,
            _i3.GUpdateUserProfileVars> {
  GUpdateUserProfileReq._();

  factory GUpdateUserProfileReq(
          [Function(GUpdateUserProfileReqBuilder b) updates]) =
      _$GUpdateUserProfileReq;

  static void _initializeBuilder(GUpdateUserProfileReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'UpdateUserProfile')
    ..executeOnListen = true;
  _i3.GUpdateUserProfileVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GUpdateUserProfileData? Function(
          _i2.GUpdateUserProfileData?, _i2.GUpdateUserProfileData?)?
      get updateResult;
  _i2.GUpdateUserProfileData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GUpdateUserProfileData? parseData(Map<String, dynamic> json) =>
      _i2.GUpdateUserProfileData.fromJson(json);
  static Serializer<GUpdateUserProfileReq> get serializer =>
      _$gUpdateUserProfileReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GUpdateUserProfileReq.serializer, this)
          as Map<String, dynamic>);
  static GUpdateUserProfileReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GUpdateUserProfileReq.serializer, json);
}

abstract class GBindWechatReq
    implements
        Built<GBindWechatReq, GBindWechatReqBuilder>,
        _i1.OperationRequest<_i2.GBindWechatData, _i3.GBindWechatVars> {
  GBindWechatReq._();

  factory GBindWechatReq([Function(GBindWechatReqBuilder b) updates]) =
      _$GBindWechatReq;

  static void _initializeBuilder(GBindWechatReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'BindWechat')
    ..executeOnListen = true;
  _i3.GBindWechatVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GBindWechatData? Function(_i2.GBindWechatData?, _i2.GBindWechatData?)?
      get updateResult;
  _i2.GBindWechatData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GBindWechatData? parseData(Map<String, dynamic> json) =>
      _i2.GBindWechatData.fromJson(json);
  static Serializer<GBindWechatReq> get serializer =>
      _$gBindWechatReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GBindWechatReq.serializer, this)
          as Map<String, dynamic>);
  static GBindWechatReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GBindWechatReq.serializer, json);
}
