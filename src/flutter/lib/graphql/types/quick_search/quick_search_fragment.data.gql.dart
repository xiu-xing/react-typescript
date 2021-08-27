// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i4;
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i3;
import 'package:rime_app/graphql/types/entity/entity_fragment.data.gql.dart'
    as _i5;
import 'package:rime_app/graphql/types/tags/tags_fragment.data.gql.dart' as _i2;

part 'quick_search_fragment.data.gql.g.dart';

abstract class GQuickSearchEntityNodeFields {
  String get G__typename;
  GQuickSearchEntityNodeFields_action? get action;
  String? get description;
  BuiltList<String>? get highlightTexts;
  String? get logoURI;
  String get nodeId;
  String get searchType;
  String? get subtitle;
  String? get title;
  BuiltList<GQuickSearchEntityNodeFields_tags>? get tags;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchEntityNodeFields_action {
  String get G__typename;
  String? get data;
  Map<String, dynamic>? get args;
  String get name;
  _i1.GActionType get type;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchEntityNodeFields_tags {
  String get G__typename;
}

abstract class GQuickSearchEntityNodeFields_tags__base
    implements GQuickSearchEntityNodeFields_tags {
  String get G__typename;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchEntityNodeFields_tags__asQuickSearchTag
    implements GQuickSearchEntityNodeFields_tags, _i2.GQuickSearchTagFields {
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchEntityNodeFields_tags__asTextTag
    implements GQuickSearchEntityNodeFields_tags, _i2.GTextTagFields {
  String get G__typename;
  String? get name;
  GQuickSearchEntityNodeFields_tags__asTextTag_action? get action;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchEntityNodeFields_tags__asTextTag_action
    implements _i2.GTextTagFields_action {
  String get G__typename;
  String get name;
  _i1.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchEntityNodeFields_tags__asRiskTag
    implements GQuickSearchEntityNodeFields_tags, _i2.GRiskTagFields {
  String get G__typename;
  int? get level;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchEntityNodeFieldsData
    implements
        Built<GQuickSearchEntityNodeFieldsData,
            GQuickSearchEntityNodeFieldsDataBuilder>,
        GQuickSearchEntityNodeFields {
  GQuickSearchEntityNodeFieldsData._();

  factory GQuickSearchEntityNodeFieldsData(
          [Function(GQuickSearchEntityNodeFieldsDataBuilder b) updates]) =
      _$GQuickSearchEntityNodeFieldsData;

  static void _initializeBuilder(GQuickSearchEntityNodeFieldsDataBuilder b) =>
      b..G__typename = 'QuickSearchEntityNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GQuickSearchEntityNodeFieldsData_action? get action;
  String? get description;
  BuiltList<String>? get highlightTexts;
  String? get logoURI;
  String get nodeId;
  String get searchType;
  String? get subtitle;
  String? get title;
  BuiltList<GQuickSearchEntityNodeFieldsData_tags>? get tags;
  static Serializer<GQuickSearchEntityNodeFieldsData> get serializer =>
      _$gQuickSearchEntityNodeFieldsDataSerializer;
  Map<String, dynamic> toJson() => (_i3.serializers
          .serializeWith(GQuickSearchEntityNodeFieldsData.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchEntityNodeFieldsData? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers
          .deserializeWith(GQuickSearchEntityNodeFieldsData.serializer, json);
}

abstract class GQuickSearchEntityNodeFieldsData_action
    implements
        Built<GQuickSearchEntityNodeFieldsData_action,
            GQuickSearchEntityNodeFieldsData_actionBuilder>,
        GQuickSearchEntityNodeFields_action {
  GQuickSearchEntityNodeFieldsData_action._();

  factory GQuickSearchEntityNodeFieldsData_action(
      [Function(GQuickSearchEntityNodeFieldsData_actionBuilder b)
          updates]) = _$GQuickSearchEntityNodeFieldsData_action;

  static void _initializeBuilder(
          GQuickSearchEntityNodeFieldsData_actionBuilder b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get data;
  Map<String, dynamic>? get args;
  String get name;
  _i1.GActionType get type;
  static Serializer<GQuickSearchEntityNodeFieldsData_action> get serializer =>
      _$gQuickSearchEntityNodeFieldsDataActionSerializer;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
          GQuickSearchEntityNodeFieldsData_action.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchEntityNodeFieldsData_action? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
          GQuickSearchEntityNodeFieldsData_action.serializer, json);
}

abstract class GQuickSearchEntityNodeFieldsData_tags
    implements GQuickSearchEntityNodeFields_tags {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GQuickSearchEntityNodeFieldsData_tags> get serializer =>
      _i4.InlineFragmentSerializer<GQuickSearchEntityNodeFieldsData_tags>(
          'GQuickSearchEntityNodeFieldsData_tags',
          GQuickSearchEntityNodeFieldsData_tags__base, [
        GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag,
        GQuickSearchEntityNodeFieldsData_tags__asTextTag,
        GQuickSearchEntityNodeFieldsData_tags__asRiskTag
      ]);
  Map<String, dynamic> toJson() => (_i3.serializers
          .serializeWith(GQuickSearchEntityNodeFieldsData_tags.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchEntityNodeFieldsData_tags? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
          GQuickSearchEntityNodeFieldsData_tags.serializer, json);
}

abstract class GQuickSearchEntityNodeFieldsData_tags__base
    implements
        Built<GQuickSearchEntityNodeFieldsData_tags__base,
            GQuickSearchEntityNodeFieldsData_tags__baseBuilder>,
        GQuickSearchEntityNodeFieldsData_tags {
  GQuickSearchEntityNodeFieldsData_tags__base._();

  factory GQuickSearchEntityNodeFieldsData_tags__base(
      [Function(GQuickSearchEntityNodeFieldsData_tags__baseBuilder b)
          updates]) = _$GQuickSearchEntityNodeFieldsData_tags__base;

  static void _initializeBuilder(
          GQuickSearchEntityNodeFieldsData_tags__baseBuilder b) =>
      b..G__typename = 'Tag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GQuickSearchEntityNodeFieldsData_tags__base>
      get serializer => _$gQuickSearchEntityNodeFieldsDataTagsBaseSerializer;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
          GQuickSearchEntityNodeFieldsData_tags__base.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchEntityNodeFieldsData_tags__base? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
          GQuickSearchEntityNodeFieldsData_tags__base.serializer, json);
}

abstract class GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag
    implements
        Built<GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag,
            GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagBuilder>,
        GQuickSearchEntityNodeFieldsData_tags,
        _i2.GQuickSearchTagFields {
  GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag._();

  factory GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag(
      [Function(
              GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagBuilder b)
          updates]) = _$GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag;

  static void _initializeBuilder(
          GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTagBuilder b) =>
      b..G__typename = 'QuickSearchTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  static Serializer<GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag>
      get serializer =>
          _$gQuickSearchEntityNodeFieldsDataTagsAsQuickSearchTagSerializer;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
      GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag.serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
          GQuickSearchEntityNodeFieldsData_tags__asQuickSearchTag.serializer,
          json);
}

abstract class GQuickSearchEntityNodeFieldsData_tags__asTextTag
    implements
        Built<GQuickSearchEntityNodeFieldsData_tags__asTextTag,
            GQuickSearchEntityNodeFieldsData_tags__asTextTagBuilder>,
        GQuickSearchEntityNodeFieldsData_tags,
        _i2.GTextTagFields {
  GQuickSearchEntityNodeFieldsData_tags__asTextTag._();

  factory GQuickSearchEntityNodeFieldsData_tags__asTextTag(
      [Function(GQuickSearchEntityNodeFieldsData_tags__asTextTagBuilder b)
          updates]) = _$GQuickSearchEntityNodeFieldsData_tags__asTextTag;

  static void _initializeBuilder(
          GQuickSearchEntityNodeFieldsData_tags__asTextTagBuilder b) =>
      b..G__typename = 'TextTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get name;
  GQuickSearchEntityNodeFieldsData_tags__asTextTag_action? get action;
  static Serializer<GQuickSearchEntityNodeFieldsData_tags__asTextTag>
      get serializer =>
          _$gQuickSearchEntityNodeFieldsDataTagsAsTextTagSerializer;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
          GQuickSearchEntityNodeFieldsData_tags__asTextTag.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchEntityNodeFieldsData_tags__asTextTag? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
          GQuickSearchEntityNodeFieldsData_tags__asTextTag.serializer, json);
}

abstract class GQuickSearchEntityNodeFieldsData_tags__asTextTag_action
    implements
        Built<GQuickSearchEntityNodeFieldsData_tags__asTextTag_action,
            GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder>,
        _i2.GTextTagFields_action {
  GQuickSearchEntityNodeFieldsData_tags__asTextTag_action._();

  factory GQuickSearchEntityNodeFieldsData_tags__asTextTag_action(
      [Function(
              GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder b)
          updates]) = _$GQuickSearchEntityNodeFieldsData_tags__asTextTag_action;

  static void _initializeBuilder(
          GQuickSearchEntityNodeFieldsData_tags__asTextTag_actionBuilder b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  _i1.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  static Serializer<GQuickSearchEntityNodeFieldsData_tags__asTextTag_action>
      get serializer =>
          _$gQuickSearchEntityNodeFieldsDataTagsAsTextTagActionSerializer;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
      GQuickSearchEntityNodeFieldsData_tags__asTextTag_action.serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchEntityNodeFieldsData_tags__asTextTag_action? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
          GQuickSearchEntityNodeFieldsData_tags__asTextTag_action.serializer,
          json);
}

abstract class GQuickSearchEntityNodeFieldsData_tags__asRiskTag
    implements
        Built<GQuickSearchEntityNodeFieldsData_tags__asRiskTag,
            GQuickSearchEntityNodeFieldsData_tags__asRiskTagBuilder>,
        GQuickSearchEntityNodeFieldsData_tags,
        _i2.GRiskTagFields {
  GQuickSearchEntityNodeFieldsData_tags__asRiskTag._();

  factory GQuickSearchEntityNodeFieldsData_tags__asRiskTag(
      [Function(GQuickSearchEntityNodeFieldsData_tags__asRiskTagBuilder b)
          updates]) = _$GQuickSearchEntityNodeFieldsData_tags__asRiskTag;

  static void _initializeBuilder(
          GQuickSearchEntityNodeFieldsData_tags__asRiskTagBuilder b) =>
      b..G__typename = 'RiskTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get level;
  static Serializer<GQuickSearchEntityNodeFieldsData_tags__asRiskTag>
      get serializer =>
          _$gQuickSearchEntityNodeFieldsDataTagsAsRiskTagSerializer;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
          GQuickSearchEntityNodeFieldsData_tags__asRiskTag.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchEntityNodeFieldsData_tags__asRiskTag? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
          GQuickSearchEntityNodeFieldsData_tags__asRiskTag.serializer, json);
}

abstract class GQuickSearchInfoFlowNodeFields {
  String get G__typename;
  GQuickSearchInfoFlowNodeFields_action? get action;
  String? get imageURI;
  int? get publishTime;
  String? get description;
  BuiltList<String>? get highlightTexts;
  String get nodeId;
  String get searchType;
  String? get subtitle;
  String? get title;
  BuiltList<GQuickSearchInfoFlowNodeFields_tags>? get tags;
  BuiltList<GQuickSearchInfoFlowNodeFields_relatedEntity>? get relatedEntity;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchInfoFlowNodeFields_action {
  String get G__typename;
  Map<String, dynamic>? get args;
  String get name;
  _i1.GActionType get type;
  String? get data;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchInfoFlowNodeFields_tags {
  String get G__typename;
}

abstract class GQuickSearchInfoFlowNodeFields_tags__base
    implements GQuickSearchInfoFlowNodeFields_tags {
  String get G__typename;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchInfoFlowNodeFields_tags__asQuickSearchTag
    implements GQuickSearchInfoFlowNodeFields_tags, _i2.GQuickSearchTagFields {
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchInfoFlowNodeFields_tags__asTextTag
    implements GQuickSearchInfoFlowNodeFields_tags, _i2.GTextTagFields {
  String get G__typename;
  String? get name;
  GQuickSearchInfoFlowNodeFields_tags__asTextTag_action? get action;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchInfoFlowNodeFields_tags__asTextTag_action
    implements _i2.GTextTagFields_action {
  String get G__typename;
  String get name;
  _i1.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchInfoFlowNodeFields_tags__asRiskTag
    implements GQuickSearchInfoFlowNodeFields_tags, _i2.GRiskTagFields {
  String get G__typename;
  int? get level;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchInfoFlowNodeFields_relatedEntity
    implements _i5.GEntityFields {
  String get G__typename;
  String? get entityId;
  _i1.GEntityType get entityType;
  String get entityName;
  String? get portraitURL;
  Map<String, dynamic> toJson();
}

abstract class GQuickSearchInfoFlowNodeFieldsData
    implements
        Built<GQuickSearchInfoFlowNodeFieldsData,
            GQuickSearchInfoFlowNodeFieldsDataBuilder>,
        GQuickSearchInfoFlowNodeFields {
  GQuickSearchInfoFlowNodeFieldsData._();

  factory GQuickSearchInfoFlowNodeFieldsData(
          [Function(GQuickSearchInfoFlowNodeFieldsDataBuilder b) updates]) =
      _$GQuickSearchInfoFlowNodeFieldsData;

  static void _initializeBuilder(GQuickSearchInfoFlowNodeFieldsDataBuilder b) =>
      b..G__typename = 'QuickSearchInfoFlowNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GQuickSearchInfoFlowNodeFieldsData_action? get action;
  String? get imageURI;
  int? get publishTime;
  String? get description;
  BuiltList<String>? get highlightTexts;
  String get nodeId;
  String get searchType;
  String? get subtitle;
  String? get title;
  BuiltList<GQuickSearchInfoFlowNodeFieldsData_tags>? get tags;
  BuiltList<GQuickSearchInfoFlowNodeFieldsData_relatedEntity>?
      get relatedEntity;
  static Serializer<GQuickSearchInfoFlowNodeFieldsData> get serializer =>
      _$gQuickSearchInfoFlowNodeFieldsDataSerializer;
  Map<String, dynamic> toJson() => (_i3.serializers
          .serializeWith(GQuickSearchInfoFlowNodeFieldsData.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchInfoFlowNodeFieldsData? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers
          .deserializeWith(GQuickSearchInfoFlowNodeFieldsData.serializer, json);
}

abstract class GQuickSearchInfoFlowNodeFieldsData_action
    implements
        Built<GQuickSearchInfoFlowNodeFieldsData_action,
            GQuickSearchInfoFlowNodeFieldsData_actionBuilder>,
        GQuickSearchInfoFlowNodeFields_action {
  GQuickSearchInfoFlowNodeFieldsData_action._();

  factory GQuickSearchInfoFlowNodeFieldsData_action(
      [Function(GQuickSearchInfoFlowNodeFieldsData_actionBuilder b)
          updates]) = _$GQuickSearchInfoFlowNodeFieldsData_action;

  static void _initializeBuilder(
          GQuickSearchInfoFlowNodeFieldsData_actionBuilder b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  Map<String, dynamic>? get args;
  String get name;
  _i1.GActionType get type;
  String? get data;
  static Serializer<GQuickSearchInfoFlowNodeFieldsData_action> get serializer =>
      _$gQuickSearchInfoFlowNodeFieldsDataActionSerializer;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
          GQuickSearchInfoFlowNodeFieldsData_action.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchInfoFlowNodeFieldsData_action? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
          GQuickSearchInfoFlowNodeFieldsData_action.serializer, json);
}

abstract class GQuickSearchInfoFlowNodeFieldsData_tags
    implements GQuickSearchInfoFlowNodeFields_tags {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GQuickSearchInfoFlowNodeFieldsData_tags> get serializer =>
      _i4.InlineFragmentSerializer<GQuickSearchInfoFlowNodeFieldsData_tags>(
          'GQuickSearchInfoFlowNodeFieldsData_tags',
          GQuickSearchInfoFlowNodeFieldsData_tags__base, [
        GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag,
        GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag,
        GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag
      ]);
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
          GQuickSearchInfoFlowNodeFieldsData_tags.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchInfoFlowNodeFieldsData_tags? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
          GQuickSearchInfoFlowNodeFieldsData_tags.serializer, json);
}

abstract class GQuickSearchInfoFlowNodeFieldsData_tags__base
    implements
        Built<GQuickSearchInfoFlowNodeFieldsData_tags__base,
            GQuickSearchInfoFlowNodeFieldsData_tags__baseBuilder>,
        GQuickSearchInfoFlowNodeFieldsData_tags {
  GQuickSearchInfoFlowNodeFieldsData_tags__base._();

  factory GQuickSearchInfoFlowNodeFieldsData_tags__base(
      [Function(GQuickSearchInfoFlowNodeFieldsData_tags__baseBuilder b)
          updates]) = _$GQuickSearchInfoFlowNodeFieldsData_tags__base;

  static void _initializeBuilder(
          GQuickSearchInfoFlowNodeFieldsData_tags__baseBuilder b) =>
      b..G__typename = 'Tag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GQuickSearchInfoFlowNodeFieldsData_tags__base>
      get serializer => _$gQuickSearchInfoFlowNodeFieldsDataTagsBaseSerializer;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
          GQuickSearchInfoFlowNodeFieldsData_tags__base.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchInfoFlowNodeFieldsData_tags__base? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
          GQuickSearchInfoFlowNodeFieldsData_tags__base.serializer, json);
}

abstract class GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag
    implements
        Built<GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag,
            GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagBuilder>,
        GQuickSearchInfoFlowNodeFieldsData_tags,
        _i2.GQuickSearchTagFields {
  GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag._();

  factory GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag(
      [Function(
              GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagBuilder
                  b)
          updates]) = _$GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag;

  static void _initializeBuilder(
          GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTagBuilder b) =>
      b..G__typename = 'QuickSearchTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get icon;
  String? get nameType;
  String? get matchedName;
  static Serializer<GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag>
      get serializer =>
          _$gQuickSearchInfoFlowNodeFieldsDataTagsAsQuickSearchTagSerializer;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
      GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag.serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
          GQuickSearchInfoFlowNodeFieldsData_tags__asQuickSearchTag.serializer,
          json);
}

abstract class GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag
    implements
        Built<GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag,
            GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagBuilder>,
        GQuickSearchInfoFlowNodeFieldsData_tags,
        _i2.GTextTagFields {
  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag._();

  factory GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag(
      [Function(GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagBuilder b)
          updates]) = _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag;

  static void _initializeBuilder(
          GQuickSearchInfoFlowNodeFieldsData_tags__asTextTagBuilder b) =>
      b..G__typename = 'TextTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get name;
  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action? get action;
  static Serializer<GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag>
      get serializer =>
          _$gQuickSearchInfoFlowNodeFieldsDataTagsAsTextTagSerializer;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
          GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
          GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag.serializer, json);
}

abstract class GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action
    implements
        Built<GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action,
            GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder>,
        _i2.GTextTagFields_action {
  GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action._();

  factory GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action(
      [Function(
              GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder
                  b)
          updates]) = _$GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action;

  static void _initializeBuilder(
          GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_actionBuilder b) =>
      b..G__typename = 'Action';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  _i1.GActionType get type;
  Map<String, dynamic>? get args;
  String? get data;
  static Serializer<GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action>
      get serializer =>
          _$gQuickSearchInfoFlowNodeFieldsDataTagsAsTextTagActionSerializer;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
      GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action.serializer,
      this) as Map<String, dynamic>);
  static GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
          GQuickSearchInfoFlowNodeFieldsData_tags__asTextTag_action.serializer,
          json);
}

abstract class GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag
    implements
        Built<GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag,
            GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagBuilder>,
        GQuickSearchInfoFlowNodeFieldsData_tags,
        _i2.GRiskTagFields {
  GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag._();

  factory GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag(
      [Function(GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagBuilder b)
          updates]) = _$GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag;

  static void _initializeBuilder(
          GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTagBuilder b) =>
      b..G__typename = 'RiskTag';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get level;
  static Serializer<GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag>
      get serializer =>
          _$gQuickSearchInfoFlowNodeFieldsDataTagsAsRiskTagSerializer;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
          GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
          GQuickSearchInfoFlowNodeFieldsData_tags__asRiskTag.serializer, json);
}

abstract class GQuickSearchInfoFlowNodeFieldsData_relatedEntity
    implements
        Built<GQuickSearchInfoFlowNodeFieldsData_relatedEntity,
            GQuickSearchInfoFlowNodeFieldsData_relatedEntityBuilder>,
        GQuickSearchInfoFlowNodeFields_relatedEntity,
        _i5.GEntityFields {
  GQuickSearchInfoFlowNodeFieldsData_relatedEntity._();

  factory GQuickSearchInfoFlowNodeFieldsData_relatedEntity(
      [Function(GQuickSearchInfoFlowNodeFieldsData_relatedEntityBuilder b)
          updates]) = _$GQuickSearchInfoFlowNodeFieldsData_relatedEntity;

  static void _initializeBuilder(
          GQuickSearchInfoFlowNodeFieldsData_relatedEntityBuilder b) =>
      b..G__typename = 'Entity';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get entityId;
  _i1.GEntityType get entityType;
  String get entityName;
  String? get portraitURL;
  static Serializer<GQuickSearchInfoFlowNodeFieldsData_relatedEntity>
      get serializer =>
          _$gQuickSearchInfoFlowNodeFieldsDataRelatedEntitySerializer;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
          GQuickSearchInfoFlowNodeFieldsData_relatedEntity.serializer, this)
      as Map<String, dynamic>);
  static GQuickSearchInfoFlowNodeFieldsData_relatedEntity? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
          GQuickSearchInfoFlowNodeFieldsData_relatedEntity.serializer, json);
}
