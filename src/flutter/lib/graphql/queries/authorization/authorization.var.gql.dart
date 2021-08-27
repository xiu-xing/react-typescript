// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'authorization.var.gql.g.dart';

abstract class GUserInfoVars
    implements Built<GUserInfoVars, GUserInfoVarsBuilder> {
  GUserInfoVars._();

  factory GUserInfoVars([Function(GUserInfoVarsBuilder b) updates]) =
      _$GUserInfoVars;

  static Serializer<GUserInfoVars> get serializer => _$gUserInfoVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUserInfoVars.serializer, this)
          as Map<String, dynamic>);
  static GUserInfoVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUserInfoVars.serializer, json);
}

abstract class GUserProfileVars
    implements Built<GUserProfileVars, GUserProfileVarsBuilder> {
  GUserProfileVars._();

  factory GUserProfileVars([Function(GUserProfileVarsBuilder b) updates]) =
      _$GUserProfileVars;

  static Serializer<GUserProfileVars> get serializer =>
      _$gUserProfileVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUserProfileVars.serializer, this)
          as Map<String, dynamic>);
  static GUserProfileVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUserProfileVars.serializer, json);
}

abstract class GUserPremiumSubscriptionBalanceVars
    implements
        Built<GUserPremiumSubscriptionBalanceVars,
            GUserPremiumSubscriptionBalanceVarsBuilder> {
  GUserPremiumSubscriptionBalanceVars._();

  factory GUserPremiumSubscriptionBalanceVars(
          [Function(GUserPremiumSubscriptionBalanceVarsBuilder b) updates]) =
      _$GUserPremiumSubscriptionBalanceVars;

  static Serializer<GUserPremiumSubscriptionBalanceVars> get serializer =>
      _$gUserPremiumSubscriptionBalanceVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GUserPremiumSubscriptionBalanceVars.serializer, this)
      as Map<String, dynamic>);
  static GUserPremiumSubscriptionBalanceVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GUserPremiumSubscriptionBalanceVars.serializer, json);
}
