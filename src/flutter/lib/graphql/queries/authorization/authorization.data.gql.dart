// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;
import 'package:rime_app/graphql/types/user_profile/user_profile.data.gql.dart'
    as _i3;

part 'authorization.data.gql.g.dart';

abstract class GUserInfoData
    implements Built<GUserInfoData, GUserInfoDataBuilder> {
  GUserInfoData._();

  factory GUserInfoData([Function(GUserInfoDataBuilder b) updates]) =
      _$GUserInfoData;

  static void _initializeBuilder(GUserInfoDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserInfoData_user? get user;
  static Serializer<GUserInfoData> get serializer => _$gUserInfoDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUserInfoData.serializer, this)
          as Map<String, dynamic>);
  static GUserInfoData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUserInfoData.serializer, json);
}

abstract class GUserInfoData_user
    implements Built<GUserInfoData_user, GUserInfoData_userBuilder> {
  GUserInfoData_user._();

  factory GUserInfoData_user([Function(GUserInfoData_userBuilder b) updates]) =
      _$GUserInfoData_user;

  static void _initializeBuilder(GUserInfoData_userBuilder b) =>
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
  bool? get hasBoundWechat;
  static Serializer<GUserInfoData_user> get serializer =>
      _$gUserInfoDataUserSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUserInfoData_user.serializer, this)
          as Map<String, dynamic>);
  static GUserInfoData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUserInfoData_user.serializer, json);
}

abstract class GUserProfileData
    implements Built<GUserProfileData, GUserProfileDataBuilder> {
  GUserProfileData._();

  factory GUserProfileData([Function(GUserProfileDataBuilder b) updates]) =
      _$GUserProfileData;

  static void _initializeBuilder(GUserProfileDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserProfileData_userProfile? get userProfile;
  static Serializer<GUserProfileData> get serializer =>
      _$gUserProfileDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUserProfileData.serializer, this)
          as Map<String, dynamic>);
  static GUserProfileData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUserProfileData.serializer, json);
}

abstract class GUserProfileData_userProfile
    implements
        Built<GUserProfileData_userProfile,
            GUserProfileData_userProfileBuilder>,
        _i3.GUserProfileFields {
  GUserProfileData_userProfile._();

  factory GUserProfileData_userProfile(
          [Function(GUserProfileData_userProfileBuilder b) updates]) =
      _$GUserProfileData_userProfile;

  static void _initializeBuilder(GUserProfileData_userProfileBuilder b) =>
      b..G__typename = 'UserProfile';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GUserProfileData_userProfile_fields>? get fields;
  static Serializer<GUserProfileData_userProfile> get serializer =>
      _$gUserProfileDataUserProfileSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GUserProfileData_userProfile.serializer, this) as Map<String, dynamic>);
  static GUserProfileData_userProfile? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GUserProfileData_userProfile.serializer, json);
}

abstract class GUserProfileData_userProfile_fields
    implements
        Built<GUserProfileData_userProfile_fields,
            GUserProfileData_userProfile_fieldsBuilder>,
        _i3.GUserProfileFields_fields {
  GUserProfileData_userProfile_fields._();

  factory GUserProfileData_userProfile_fields(
          [Function(GUserProfileData_userProfile_fieldsBuilder b) updates]) =
      _$GUserProfileData_userProfile_fields;

  static void _initializeBuilder(
          GUserProfileData_userProfile_fieldsBuilder b) =>
      b..G__typename = 'UserProfileField';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  bool? get isRequired;
  String get title;
  BuiltList<GUserProfileData_userProfile_fields_options>? get options;
  BuiltList<GUserProfileData_userProfile_fields_selectedOptions>?
      get selectedOptions;
  bool? get isMultiple;
  static Serializer<GUserProfileData_userProfile_fields> get serializer =>
      _$gUserProfileDataUserProfileFieldsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GUserProfileData_userProfile_fields.serializer, this)
      as Map<String, dynamic>);
  static GUserProfileData_userProfile_fields? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GUserProfileData_userProfile_fields.serializer, json);
}

abstract class GUserProfileData_userProfile_fields_options
    implements
        Built<GUserProfileData_userProfile_fields_options,
            GUserProfileData_userProfile_fields_optionsBuilder>,
        _i3.GUserProfileFields_fields_options {
  GUserProfileData_userProfile_fields_options._();

  factory GUserProfileData_userProfile_fields_options(
      [Function(GUserProfileData_userProfile_fields_optionsBuilder b)
          updates]) = _$GUserProfileData_userProfile_fields_options;

  static void _initializeBuilder(
          GUserProfileData_userProfile_fields_optionsBuilder b) =>
      b..G__typename = 'UserProfileFieldOption';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  String get value;
  static Serializer<GUserProfileData_userProfile_fields_options>
      get serializer => _$gUserProfileDataUserProfileFieldsOptionsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GUserProfileData_userProfile_fields_options.serializer, this)
      as Map<String, dynamic>);
  static GUserProfileData_userProfile_fields_options? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GUserProfileData_userProfile_fields_options.serializer, json);
}

abstract class GUserProfileData_userProfile_fields_selectedOptions
    implements
        Built<GUserProfileData_userProfile_fields_selectedOptions,
            GUserProfileData_userProfile_fields_selectedOptionsBuilder>,
        _i3.GUserProfileFields_fields_selectedOptions {
  GUserProfileData_userProfile_fields_selectedOptions._();

  factory GUserProfileData_userProfile_fields_selectedOptions(
      [Function(GUserProfileData_userProfile_fields_selectedOptionsBuilder b)
          updates]) = _$GUserProfileData_userProfile_fields_selectedOptions;

  static void _initializeBuilder(
          GUserProfileData_userProfile_fields_selectedOptionsBuilder b) =>
      b..G__typename = 'UserProfileFieldOption';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  String get value;
  static Serializer<GUserProfileData_userProfile_fields_selectedOptions>
      get serializer =>
          _$gUserProfileDataUserProfileFieldsSelectedOptionsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GUserProfileData_userProfile_fields_selectedOptions.serializer, this)
      as Map<String, dynamic>);
  static GUserProfileData_userProfile_fields_selectedOptions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GUserProfileData_userProfile_fields_selectedOptions.serializer, json);
}

abstract class GUserPremiumSubscriptionBalanceData
    implements
        Built<GUserPremiumSubscriptionBalanceData,
            GUserPremiumSubscriptionBalanceDataBuilder> {
  GUserPremiumSubscriptionBalanceData._();

  factory GUserPremiumSubscriptionBalanceData(
          [Function(GUserPremiumSubscriptionBalanceDataBuilder b) updates]) =
      _$GUserPremiumSubscriptionBalanceData;

  static void _initializeBuilder(
          GUserPremiumSubscriptionBalanceDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance
      get UserPremiumSubscriptionBalance;
  static Serializer<GUserPremiumSubscriptionBalanceData> get serializer =>
      _$gUserPremiumSubscriptionBalanceDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GUserPremiumSubscriptionBalanceData.serializer, this)
      as Map<String, dynamic>);
  static GUserPremiumSubscriptionBalanceData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GUserPremiumSubscriptionBalanceData.serializer, json);
}

abstract class GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance
    implements
        Built<
            GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance,
            GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder> {
  GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance._();

  factory GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance(
          [Function(
                  GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder
                      b)
              updates]) =
      _$GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance;

  static void _initializeBuilder(
          GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalanceBuilder
              b) =>
      b..G__typename = 'UserPremiumSubscriptionBalancesResponse';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get userID;
  String get serviceID;
  int get serviceEndTime;
  static Serializer<
          GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance>
      get serializer =>
          _$gUserPremiumSubscriptionBalanceDataUserPremiumSubscriptionBalanceSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance
          .serializer,
      this) as Map<String, dynamic>);
  static GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GUserPremiumSubscriptionBalanceData_UserPremiumSubscriptionBalance
              .serializer,
          json);
}
