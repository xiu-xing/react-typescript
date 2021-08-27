// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'team.data.gql.g.dart';

abstract class GTeamsData implements Built<GTeamsData, GTeamsDataBuilder> {
  GTeamsData._();

  factory GTeamsData([Function(GTeamsDataBuilder b) updates]) = _$GTeamsData;

  static void _initializeBuilder(GTeamsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GTeamsData_teams> get teams;
  static Serializer<GTeamsData> get serializer => _$gTeamsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GTeamsData.serializer, this)
          as Map<String, dynamic>);
  static GTeamsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GTeamsData.serializer, json);
}

abstract class GTeamsData_teams
    implements Built<GTeamsData_teams, GTeamsData_teamsBuilder> {
  GTeamsData_teams._();

  factory GTeamsData_teams([Function(GTeamsData_teamsBuilder b) updates]) =
      _$GTeamsData_teams;

  static void _initializeBuilder(GTeamsData_teamsBuilder b) =>
      b..G__typename = 'TeamInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String? get entityId;
  _i2.GEntityType? get entityType;
  String? get portraitUri;
  static Serializer<GTeamsData_teams> get serializer =>
      _$gTeamsDataTeamsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GTeamsData_teams.serializer, this)
          as Map<String, dynamic>);
  static GTeamsData_teams? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GTeamsData_teams.serializer, json);
}

abstract class GIsEmailBindingRequiredData
    implements
        Built<GIsEmailBindingRequiredData, GIsEmailBindingRequiredDataBuilder> {
  GIsEmailBindingRequiredData._();

  factory GIsEmailBindingRequiredData(
          [Function(GIsEmailBindingRequiredDataBuilder b) updates]) =
      _$GIsEmailBindingRequiredData;

  static void _initializeBuilder(GIsEmailBindingRequiredDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GIsEmailBindingRequiredData_isEmailBindingRequired get isEmailBindingRequired;
  static Serializer<GIsEmailBindingRequiredData> get serializer =>
      _$gIsEmailBindingRequiredDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GIsEmailBindingRequiredData.serializer, this) as Map<String, dynamic>);
  static GIsEmailBindingRequiredData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GIsEmailBindingRequiredData.serializer, json);
}

abstract class GIsEmailBindingRequiredData_isEmailBindingRequired
    implements
        Built<GIsEmailBindingRequiredData_isEmailBindingRequired,
            GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder> {
  GIsEmailBindingRequiredData_isEmailBindingRequired._();

  factory GIsEmailBindingRequiredData_isEmailBindingRequired(
      [Function(GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder b)
          updates]) = _$GIsEmailBindingRequiredData_isEmailBindingRequired;

  static void _initializeBuilder(
          GIsEmailBindingRequiredData_isEmailBindingRequiredBuilder b) =>
      b..G__typename = 'IsEmailBindingRequiredResponse';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<String>? get domain;
  bool get isBindingRequired;
  static Serializer<GIsEmailBindingRequiredData_isEmailBindingRequired>
      get serializer =>
          _$gIsEmailBindingRequiredDataIsEmailBindingRequiredSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GIsEmailBindingRequiredData_isEmailBindingRequired.serializer, this)
      as Map<String, dynamic>);
  static GIsEmailBindingRequiredData_isEmailBindingRequired? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GIsEmailBindingRequiredData_isEmailBindingRequired.serializer, json);
}
