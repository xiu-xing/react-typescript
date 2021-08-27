// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i2;

part 'tags_fragment.data.gql.g.dart';

abstract class GTextTagFields {
  String get G__typename;
  String? get name;
  GTextTagFields_action? get action;
  Map<String, dynamic> toJson();
}

abstract class GTextTagFields_action {
  String get G__typename;
  String get name;
  _i1.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  Map<String, dynamic> toJson();
}

abstract class GTextTagFieldsData
    implements
        Built<GTextTagFieldsData, GTextTagFieldsDataBuilder>,
        GTextTagFields {
  GTextTagFieldsData._();

  factory GTextTagFieldsData([Function(GTextTagFieldsDataBuilder b) updates]) =
      _$GTextTagFieldsData;

  static void _initializeBuilder(GTextTagFieldsDataBuilder b) =>
      b..G__typename = 'TextTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get name;
  GTextTagFieldsData_action? get action;
  static Serializer<GTextTagFieldsData> get serializer =>
      _$gTextTagFieldsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GTextTagFieldsData.serializer, this)
          as Map<String, dynamic>);
  static GTextTagFieldsData? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GTextTagFieldsData.serializer, json);
}

abstract class GTextTagFieldsData_action
    implements
        Built<GTextTagFieldsData_action, GTextTagFieldsData_actionBuilder>,
        GTextTagFields_action {
  GTextTagFieldsData_action._();

  factory GTextTagFieldsData_action(
          [Function(GTextTagFieldsData_actionBuilder b) updates]) =
      _$GTextTagFieldsData_action;

  static void _initializeBuilder(GTextTagFieldsData_actionBuilder b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  _i1.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  static Serializer<GTextTagFieldsData_action> get serializer =>
      _$gTextTagFieldsDataActionSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GTextTagFieldsData_action.serializer, this)
          as Map<String, dynamic>);
  static GTextTagFieldsData_action? fromJson(Map<String, dynamic> json) =>
      _i2.serializers
          .deserializeWith(GTextTagFieldsData_action.serializer, json);
}

abstract class GRiskTagFields {
  String get G__typename;
  int? get level;
  Map<String, dynamic> toJson();
}

abstract class GRiskTagFieldsData
    implements
        Built<GRiskTagFieldsData, GRiskTagFieldsDataBuilder>,
        GRiskTagFields {
  GRiskTagFieldsData._();

  factory GRiskTagFieldsData([Function(GRiskTagFieldsDataBuilder b) updates]) =
      _$GRiskTagFieldsData;

  static void _initializeBuilder(GRiskTagFieldsDataBuilder b) =>
      b..G__typename = 'RiskTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get level;
  static Serializer<GRiskTagFieldsData> get serializer =>
      _$gRiskTagFieldsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GRiskTagFieldsData.serializer, this)
          as Map<String, dynamic>);
  static GRiskTagFieldsData? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GRiskTagFieldsData.serializer, json);
}

abstract class GQuickSearchTagFields {
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchTagFieldsData
    implements
        Built<GQuickSearchTagFieldsData, GQuickSearchTagFieldsDataBuilder>,
        GQuickSearchTagFields {
  GQuickSearchTagFieldsData._();

  factory GQuickSearchTagFieldsData(
          [Function(GQuickSearchTagFieldsDataBuilder b) updates]) =
      _$GQuickSearchTagFieldsData;

  static void _initializeBuilder(GQuickSearchTagFieldsDataBuilder b) =>
      b..G__typename = 'QuickSearchTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  static Serializer<GQuickSearchTagFieldsData> get serializer =>
      _$gQuickSearchTagFieldsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GQuickSearchTagFieldsData.serializer, this)
          as Map<String, dynamic>);
  static GQuickSearchTagFieldsData? fromJson(Map<String, dynamic> json) =>
      _i2.serializers
          .deserializeWith(GQuickSearchTagFieldsData.serializer, json);
}
