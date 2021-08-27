// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'user_profile.data.gql.g.dart';

abstract class GUserProfileFields {
  String get G__typename;
  BuiltList<GUserProfileFields_fields>? get fields;
  Map<String, dynamic> toJson();
}

abstract class GUserProfileFields_fields {
  String get G__typename;
  String get name;
  bool? get isRequired;
  String get title;
  BuiltList<GUserProfileFields_fields_options>? get options;
  BuiltList<GUserProfileFields_fields_selectedOptions>? get selectedOptions;
  bool? get isMultiple;
  Map<String, dynamic> toJson();
}

abstract class GUserProfileFields_fields_options {
  String get G__typename;
  String get name;
  String get value;
  Map<String, dynamic> toJson();
}

abstract class GUserProfileFields_fields_selectedOptions {
  String get G__typename;
  String get name;
  String get value;
  Map<String, dynamic> toJson();
}

abstract class GUserProfileFieldsData
    implements
        Built<GUserProfileFieldsData, GUserProfileFieldsDataBuilder>,
        GUserProfileFields {
  GUserProfileFieldsData._();

  factory GUserProfileFieldsData(
          [Function(GUserProfileFieldsDataBuilder b) updates]) =
      _$GUserProfileFieldsData;

  static void _initializeBuilder(GUserProfileFieldsDataBuilder b) =>
      b..G__typename = 'UserProfile';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GUserProfileFieldsData_fields>? get fields;
  static Serializer<GUserProfileFieldsData> get serializer =>
      _$gUserProfileFieldsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUserProfileFieldsData.serializer, this)
          as Map<String, dynamic>);
  static GUserProfileFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUserProfileFieldsData.serializer, json);
}

abstract class GUserProfileFieldsData_fields
    implements
        Built<GUserProfileFieldsData_fields,
            GUserProfileFieldsData_fieldsBuilder>,
        GUserProfileFields_fields {
  GUserProfileFieldsData_fields._();

  factory GUserProfileFieldsData_fields(
          [Function(GUserProfileFieldsData_fieldsBuilder b) updates]) =
      _$GUserProfileFieldsData_fields;

  static void _initializeBuilder(GUserProfileFieldsData_fieldsBuilder b) =>
      b..G__typename = 'UserProfileField';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  bool? get isRequired;
  String get title;
  BuiltList<GUserProfileFieldsData_fields_options>? get options;
  BuiltList<GUserProfileFieldsData_fields_selectedOptions>? get selectedOptions;
  bool? get isMultiple;
  static Serializer<GUserProfileFieldsData_fields> get serializer =>
      _$gUserProfileFieldsDataFieldsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GUserProfileFieldsData_fields.serializer, this) as Map<String, dynamic>);
  static GUserProfileFieldsData_fields? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GUserProfileFieldsData_fields.serializer, json);
}

abstract class GUserProfileFieldsData_fields_options
    implements
        Built<GUserProfileFieldsData_fields_options,
            GUserProfileFieldsData_fields_optionsBuilder>,
        GUserProfileFields_fields_options {
  GUserProfileFieldsData_fields_options._();

  factory GUserProfileFieldsData_fields_options(
          [Function(GUserProfileFieldsData_fields_optionsBuilder b) updates]) =
      _$GUserProfileFieldsData_fields_options;

  static void _initializeBuilder(
          GUserProfileFieldsData_fields_optionsBuilder b) =>
      b..G__typename = 'UserProfileFieldOption';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  String get value;
  static Serializer<GUserProfileFieldsData_fields_options> get serializer =>
      _$gUserProfileFieldsDataFieldsOptionsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GUserProfileFieldsData_fields_options.serializer, this)
      as Map<String, dynamic>);
  static GUserProfileFieldsData_fields_options? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GUserProfileFieldsData_fields_options.serializer, json);
}

abstract class GUserProfileFieldsData_fields_selectedOptions
    implements
        Built<GUserProfileFieldsData_fields_selectedOptions,
            GUserProfileFieldsData_fields_selectedOptionsBuilder>,
        GUserProfileFields_fields_selectedOptions {
  GUserProfileFieldsData_fields_selectedOptions._();

  factory GUserProfileFieldsData_fields_selectedOptions(
      [Function(GUserProfileFieldsData_fields_selectedOptionsBuilder b)
          updates]) = _$GUserProfileFieldsData_fields_selectedOptions;

  static void _initializeBuilder(
          GUserProfileFieldsData_fields_selectedOptionsBuilder b) =>
      b..G__typename = 'UserProfileFieldOption';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  String get value;
  static Serializer<GUserProfileFieldsData_fields_selectedOptions>
      get serializer => _$gUserProfileFieldsDataFieldsSelectedOptionsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GUserProfileFieldsData_fields_selectedOptions.serializer, this)
      as Map<String, dynamic>);
  static GUserProfileFieldsData_fields_selectedOptions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GUserProfileFieldsData_fields_selectedOptions.serializer, json);
}
