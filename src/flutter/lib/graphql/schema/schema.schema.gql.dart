// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i2;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'schema.schema.gql.g.dart';

class GActionType extends EnumClass {
  const GActionType._(String name) : super(name);

  static const GActionType EXTERNAL_LINK = _$gActionTypeEXTERNAL_LINK;

  static const GActionType POP_UP = _$gActionTypePOP_UP;

  static const GActionType PROFILE = _$gActionTypePROFILE;

  static const GActionType SUB_PROFILE = _$gActionTypeSUB_PROFILE;

  static const GActionType FULL_SCREEN_CHART = _$gActionTypeFULL_SCREEN_CHART;

  static const GActionType FULL_SCREEN_GRAPH = _$gActionTypeFULL_SCREEN_GRAPH;

  static const GActionType RISK_DETAIL = _$gActionTypeRISK_DETAIL;

  static Serializer<GActionType> get serializer => _$gActionTypeSerializer;
  static BuiltSet<GActionType> get values => _$gActionTypeValues;
  static GActionType valueOf(String name) => _$gActionTypeValueOf(name);
}

abstract class GAddCommodityRequest
    implements Built<GAddCommodityRequest, GAddCommodityRequestBuilder> {
  GAddCommodityRequest._();

  factory GAddCommodityRequest(
          [Function(GAddCommodityRequestBuilder b) updates]) =
      _$GAddCommodityRequest;

  String? get name;
  double? get amount;
  int? get day;
  String? get serviceID;
  static Serializer<GAddCommodityRequest> get serializer =>
      _$gAddCommodityRequestSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAddCommodityRequest.serializer, this)
          as Map<String, dynamic>);
  static GAddCommodityRequest? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAddCommodityRequest.serializer, json);
}

class GAlignment extends EnumClass {
  const GAlignment._(String name) : super(name);

  static const GAlignment ALIGNMENT_LEFT = _$gAlignmentALIGNMENT_LEFT;

  static const GAlignment ALIGNMENT_RIGHT = _$gAlignmentALIGNMENT_RIGHT;

  static const GAlignment ALIGNMENT_MIDDLE = _$gAlignmentALIGNMENT_MIDDLE;

  static Serializer<GAlignment> get serializer => _$gAlignmentSerializer;
  static BuiltSet<GAlignment> get values => _$gAlignmentValues;
  static GAlignment valueOf(String name) => _$gAlignmentValueOf(name);
}

abstract class GAny implements Built<GAny, GAnyBuilder> {
  GAny._();

  factory GAny([String? value]) =>
      _$GAny((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GAny> get serializer => _i2.DefaultScalarSerializer<GAny>(
      (Object serialized) => GAny((serialized as String?)));
}

abstract class GApplePayRequest
    implements Built<GApplePayRequest, GApplePayRequestBuilder> {
  GApplePayRequest._();

  factory GApplePayRequest([Function(GApplePayRequestBuilder b) updates]) =
      _$GApplePayRequest;

  String? get payload;
  String? get orderID;
  static Serializer<GApplePayRequest> get serializer =>
      _$gApplePayRequestSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GApplePayRequest.serializer, this)
          as Map<String, dynamic>);
  static GApplePayRequest? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GApplePayRequest.serializer, json);
}

class GArticleType extends EnumClass {
  const GArticleType._(String name) : super(name);

  static const GArticleType ARTICLE_TYPE_UNDEFINED =
      _$gArticleTypeARTICLE_TYPE_UNDEFINED;

  static const GArticleType ARTICLE_TYPE_RESEARCH_REPORT =
      _$gArticleTypeARTICLE_TYPE_RESEARCH_REPORT;

  static const GArticleType ARTICLE_TYPE_RESEARCH_CHART =
      _$gArticleTypeARTICLE_TYPE_RESEARCH_CHART;

  static const GArticleType ARTICLE_TYPE_NEWS = _$gArticleTypeARTICLE_TYPE_NEWS;

  static Serializer<GArticleType> get serializer => _$gArticleTypeSerializer;
  static BuiltSet<GArticleType> get values => _$gArticleTypeValues;
  static GArticleType valueOf(String name) => _$gArticleTypeValueOf(name);
}

abstract class GCancelOrderRequest
    implements Built<GCancelOrderRequest, GCancelOrderRequestBuilder> {
  GCancelOrderRequest._();

  factory GCancelOrderRequest(
      [Function(GCancelOrderRequestBuilder b) updates]) = _$GCancelOrderRequest;

  String? get orderID;
  static Serializer<GCancelOrderRequest> get serializer =>
      _$gCancelOrderRequestSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCancelOrderRequest.serializer, this)
          as Map<String, dynamic>);
  static GCancelOrderRequest? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCancelOrderRequest.serializer, json);
}

abstract class GCheckboxFilterInput
    implements Built<GCheckboxFilterInput, GCheckboxFilterInputBuilder> {
  GCheckboxFilterInput._();

  factory GCheckboxFilterInput(
          [Function(GCheckboxFilterInputBuilder b) updates]) =
      _$GCheckboxFilterInput;

  String? get filterID;
  BuiltList<String> get values;
  String? get name;
  String? get operator;
  String? get displayValue;
  static Serializer<GCheckboxFilterInput> get serializer =>
      _$gCheckboxFilterInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCheckboxFilterInput.serializer, this)
          as Map<String, dynamic>);
  static GCheckboxFilterInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCheckboxFilterInput.serializer, json);
}

abstract class GCommitMatchedResultsInput
    implements
        Built<GCommitMatchedResultsInput, GCommitMatchedResultsInputBuilder> {
  GCommitMatchedResultsInput._();

  factory GCommitMatchedResultsInput(
          [Function(GCommitMatchedResultsInputBuilder b) updates]) =
      _$GCommitMatchedResultsInput;

  String get importID;
  String get taskID;
  bool get processRelevantGroups;
  static Serializer<GCommitMatchedResultsInput> get serializer =>
      _$gCommitMatchedResultsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GCommitMatchedResultsInput.serializer, this) as Map<String, dynamic>);
  static GCommitMatchedResultsInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GCommitMatchedResultsInput.serializer, json);
}

class GCommunicationType extends EnumClass {
  const GCommunicationType._(String name) : super(name);

  static const GCommunicationType Broadcast = _$gCommunicationTypeBroadcast;

  static const GCommunicationType Unicast = _$gCommunicationTypeUnicast;

  static const GCommunicationType Multicast = _$gCommunicationTypeMulticast;

  static Serializer<GCommunicationType> get serializer =>
      _$gCommunicationTypeSerializer;
  static BuiltSet<GCommunicationType> get values => _$gCommunicationTypeValues;
  static GCommunicationType valueOf(String name) =>
      _$gCommunicationTypeValueOf(name);
}

abstract class GConditionOperatorInput
    implements Built<GConditionOperatorInput, GConditionOperatorInputBuilder> {
  GConditionOperatorInput._();

  factory GConditionOperatorInput(
          [Function(GConditionOperatorInputBuilder b) updates]) =
      _$GConditionOperatorInput;

  GNextOperator get operator;
  String? get name;
  static Serializer<GConditionOperatorInput> get serializer =>
      _$gConditionOperatorInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GConditionOperatorInput.serializer, this)
          as Map<String, dynamic>);
  static GConditionOperatorInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GConditionOperatorInput.serializer, json);
}

class GConditionType extends EnumClass {
  const GConditionType._(String name) : super(name);

  static const GConditionType FIELD = _$gConditionTypeFIELD;

  static const GConditionType SEARCH_FIELD = _$gConditionTypeSEARCH_FIELD;

  static const GConditionType RANGE = _$gConditionTypeRANGE;

  static const GConditionType DATE_RANGE = _$gConditionTypeDATE_RANGE;

  static const GConditionType CHECKBOX = _$gConditionTypeCHECKBOX;

  static const GConditionType NESTED_CHECKBOX = _$gConditionTypeNESTED_CHECKBOX;

  static Serializer<GConditionType> get serializer =>
      _$gConditionTypeSerializer;
  static BuiltSet<GConditionType> get values => _$gConditionTypeValues;
  static GConditionType valueOf(String name) => _$gConditionTypeValueOf(name);
}

class GContactType extends EnumClass {
  const GContactType._(String name) : super(name);

  static const GContactType PHONE = _$gContactTypePHONE;

  static const GContactType EMAIL = _$gContactTypeEMAIL;

  static Serializer<GContactType> get serializer => _$gContactTypeSerializer;
  static BuiltSet<GContactType> get values => _$gContactTypeValues;
  static GContactType valueOf(String name) => _$gContactTypeValueOf(name);
}

abstract class GCreateOrderRequest
    implements Built<GCreateOrderRequest, GCreateOrderRequestBuilder> {
  GCreateOrderRequest._();

  factory GCreateOrderRequest(
      [Function(GCreateOrderRequestBuilder b) updates]) = _$GCreateOrderRequest;

  String get commodityID;
  static Serializer<GCreateOrderRequest> get serializer =>
      _$gCreateOrderRequestSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCreateOrderRequest.serializer, this)
          as Map<String, dynamic>);
  static GCreateOrderRequest? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCreateOrderRequest.serializer, json);
}

abstract class GCreateSystemMessageInput
    implements
        Built<GCreateSystemMessageInput, GCreateSystemMessageInputBuilder> {
  GCreateSystemMessageInput._();

  factory GCreateSystemMessageInput(
          [Function(GCreateSystemMessageInputBuilder b) updates]) =
      _$GCreateSystemMessageInput;

  String? get title;
  String? get content;
  String? get image;
  String? get url;
  GMessageType? get messageType;
  static Serializer<GCreateSystemMessageInput> get serializer =>
      _$gCreateSystemMessageInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCreateSystemMessageInput.serializer, this)
          as Map<String, dynamic>);
  static GCreateSystemMessageInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GCreateSystemMessageInput.serializer, json);
}

abstract class GCreateTemplateInput
    implements Built<GCreateTemplateInput, GCreateTemplateInputBuilder> {
  GCreateTemplateInput._();

  factory GCreateTemplateInput(
          [Function(GCreateTemplateInputBuilder b) updates]) =
      _$GCreateTemplateInput;

  String get name;
  String get realmID;
  BuiltList<GNextSearchConditionInput> get conditions;
  static Serializer<GCreateTemplateInput> get serializer =>
      _$gCreateTemplateInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCreateTemplateInput.serializer, this)
          as Map<String, dynamic>);
  static GCreateTemplateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCreateTemplateInput.serializer, json);
}

abstract class GCreateUpdateMessageInput
    implements
        Built<GCreateUpdateMessageInput, GCreateUpdateMessageInputBuilder> {
  GCreateUpdateMessageInput._();

  factory GCreateUpdateMessageInput(
          [Function(GCreateUpdateMessageInputBuilder b) updates]) =
      _$GCreateUpdateMessageInput;

  String? get title;
  String? get content;
  String? get image;
  String? get url;
  static Serializer<GCreateUpdateMessageInput> get serializer =>
      _$gCreateUpdateMessageInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCreateUpdateMessageInput.serializer, this)
          as Map<String, dynamic>);
  static GCreateUpdateMessageInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GCreateUpdateMessageInput.serializer, json);
}

abstract class GDateFilterInput
    implements Built<GDateFilterInput, GDateFilterInputBuilder> {
  GDateFilterInput._();

  factory GDateFilterInput([Function(GDateFilterInputBuilder b) updates]) =
      _$GDateFilterInput;

  String? get filterID;
  int? get timestamp;
  String? get preset;
  String? get name;
  String? get operator;
  String? get displayValue;
  static Serializer<GDateFilterInput> get serializer =>
      _$gDateFilterInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GDateFilterInput.serializer, this)
          as Map<String, dynamic>);
  static GDateFilterInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GDateFilterInput.serializer, json);
}

class GDatePrecise extends EnumClass {
  const GDatePrecise._(String name) : super(name);

  static const GDatePrecise DATE_PRECISE_UNSPECIFIE =
      _$gDatePreciseDATE_PRECISE_UNSPECIFIE;

  static const GDatePrecise YEAR = _$gDatePreciseYEAR;

  static const GDatePrecise MONTH = _$gDatePreciseMONTH;

  static const GDatePrecise DAY = _$gDatePreciseDAY;

  static const GDatePrecise HOUR = _$gDatePreciseHOUR;

  static Serializer<GDatePrecise> get serializer => _$gDatePreciseSerializer;
  static BuiltSet<GDatePrecise> get values => _$gDatePreciseValues;
  static GDatePrecise valueOf(String name) => _$gDatePreciseValueOf(name);
}

abstract class GDateRangeFilterInput
    implements Built<GDateRangeFilterInput, GDateRangeFilterInputBuilder> {
  GDateRangeFilterInput._();

  factory GDateRangeFilterInput(
          [Function(GDateRangeFilterInputBuilder b) updates]) =
      _$GDateRangeFilterInput;

  int? get start;
  int? get end;
  String? get id;
  String? get name;
  String? get displayValue;
  static Serializer<GDateRangeFilterInput> get serializer =>
      _$gDateRangeFilterInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GDateRangeFilterInput.serializer, this)
          as Map<String, dynamic>);
  static GDateRangeFilterInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GDateRangeFilterInput.serializer, json);
}

abstract class GDateRangeSelectorFilterInput
    implements
        Built<GDateRangeSelectorFilterInput,
            GDateRangeSelectorFilterInputBuilder> {
  GDateRangeSelectorFilterInput._();

  factory GDateRangeSelectorFilterInput(
          [Function(GDateRangeSelectorFilterInputBuilder b) updates]) =
      _$GDateRangeSelectorFilterInput;

  String get filterID;
  int? get startTimestamp;
  int? get endTimestamp;
  String? get name;
  String? get displayValue;
  String? get selectedValue;
  static Serializer<GDateRangeSelectorFilterInput> get serializer =>
      _$gDateRangeSelectorFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GDateRangeSelectorFilterInput.serializer, this) as Map<String, dynamic>);
  static GDateRangeSelectorFilterInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GDateRangeSelectorFilterInput.serializer, json);
}

abstract class GDeleteFromTeamGroupInput
    implements
        Built<GDeleteFromTeamGroupInput, GDeleteFromTeamGroupInputBuilder> {
  GDeleteFromTeamGroupInput._();

  factory GDeleteFromTeamGroupInput(
          [Function(GDeleteFromTeamGroupInputBuilder b) updates]) =
      _$GDeleteFromTeamGroupInput;

  BuiltList<String> get groupCodes;
  BuiltList<GOperationEntity> get entities;
  static Serializer<GDeleteFromTeamGroupInput> get serializer =>
      _$gDeleteFromTeamGroupInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GDeleteFromTeamGroupInput.serializer, this)
          as Map<String, dynamic>);
  static GDeleteFromTeamGroupInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GDeleteFromTeamGroupInput.serializer, json);
}

abstract class GEntityFilterInput
    implements Built<GEntityFilterInput, GEntityFilterInputBuilder> {
  GEntityFilterInput._();

  factory GEntityFilterInput([Function(GEntityFilterInputBuilder b) updates]) =
      _$GEntityFilterInput;

  String? get entityID;
  GEntityType? get entityType;
  String? get name;
  String? get displayValue;
  static Serializer<GEntityFilterInput> get serializer =>
      _$gEntityFilterInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GEntityFilterInput.serializer, this)
          as Map<String, dynamic>);
  static GEntityFilterInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GEntityFilterInput.serializer, json);
}

abstract class GEntityInput
    implements Built<GEntityInput, GEntityInputBuilder> {
  GEntityInput._();

  factory GEntityInput([Function(GEntityInputBuilder b) updates]) =
      _$GEntityInput;

  String get entityId;
  GEntityType get entityType;
  static Serializer<GEntityInput> get serializer => _$gEntityInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GEntityInput.serializer, this)
          as Map<String, dynamic>);
  static GEntityInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GEntityInput.serializer, json);
}

abstract class GEntityItemInput
    implements Built<GEntityItemInput, GEntityItemInputBuilder> {
  GEntityItemInput._();

  factory GEntityItemInput([Function(GEntityItemInputBuilder b) updates]) =
      _$GEntityItemInput;

  String get entityId;
  GEntityType get entityType;
  static Serializer<GEntityItemInput> get serializer =>
      _$gEntityItemInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GEntityItemInput.serializer, this)
          as Map<String, dynamic>);
  static GEntityItemInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GEntityItemInput.serializer, json);
}

class GEntityType extends EnumClass {
  const GEntityType._(String name) : super(name);

  static const GEntityType ENTITY_TYPE_UNSPECIFIED =
      _$gEntityTypeENTITY_TYPE_UNSPECIFIED;

  static const GEntityType PERSON = _$gEntityTypePERSON;

  static const GEntityType ORGANIZATION = _$gEntityTypeORGANIZATION;

  static const GEntityType EVENT = _$gEntityTypeEVENT;

  static const GEntityType VERTICAL = _$gEntityTypeVERTICAL;

  static const GEntityType DEAL = _$gEntityTypeDEAL;

  static Serializer<GEntityType> get serializer => _$gEntityTypeSerializer;
  static BuiltSet<GEntityType> get values => _$gEntityTypeValues;
  static GEntityType valueOf(String name) => _$gEntityTypeValueOf(name);
}

class GFetchType extends EnumClass {
  const GFetchType._(String name) : super(name);

  static const GFetchType FETCH_TYPE_UNDEFINED =
      _$gFetchTypeFETCH_TYPE_UNDEFINED;

  static const GFetchType FETCH_TYPE_READ = _$gFetchTypeFETCH_TYPE_READ;

  static const GFetchType FETCH_TYPE_DOWNLOAD = _$gFetchTypeFETCH_TYPE_DOWNLOAD;

  static Serializer<GFetchType> get serializer => _$gFetchTypeSerializer;
  static BuiltSet<GFetchType> get values => _$gFetchTypeValues;
  static GFetchType valueOf(String name) => _$gFetchTypeValueOf(name);
}

class GFileType extends EnumClass {
  const GFileType._(String name) : super(name);

  static const GFileType Avatar = _$gFileTypeAvatar;

  static const GFileType BusinessCard = _$gFileTypeBusinessCard;

  static Serializer<GFileType> get serializer => _$gFileTypeSerializer;
  static BuiltSet<GFileType> get values => _$gFileTypeValues;
  static GFileType valueOf(String name) => _$gFileTypeValueOf(name);
}

abstract class GFilterInput
    implements Built<GFilterInput, GFilterInputBuilder> {
  GFilterInput._();

  factory GFilterInput([Function(GFilterInputBuilder b) updates]) =
      _$GFilterInput;

  String get filterID;
  GSQLOperator get operator;
  BuiltList<String> get values;
  static Serializer<GFilterInput> get serializer => _$gFilterInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GFilterInput.serializer, this)
          as Map<String, dynamic>);
  static GFilterInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GFilterInput.serializer, json);
}

abstract class GFilterInputs
    implements Built<GFilterInputs, GFilterInputsBuilder> {
  GFilterInputs._();

  factory GFilterInputs([Function(GFilterInputsBuilder b) updates]) =
      _$GFilterInputs;

  BuiltList<GSelectorFilterInput>? get selectorFilterInputs;
  BuiltList<GEntityFilterInput>? get entityFilterInputs;
  BuiltList<GDateFilterInput>? get dateFilterInputs;
  GKeywordFilterInput? get keywordFilterInput;
  BuiltList<GCheckboxFilterInput>? get checkboxFilterInputs;
  BuiltList<GMultiSelectorFilterInput>? get multiSelectorFilterInputs;
  BuiltList<GDateRangeFilterInput>? get dateRangeFilterInputs;
  BuiltList<GDateRangeSelectorFilterInput>? get dateRangeSelectorFilterInput;
  BuiltList<GSuggestionFilterInput>? get suggestionFilterInput;
  static Serializer<GFilterInputs> get serializer => _$gFilterInputsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GFilterInputs.serializer, this)
          as Map<String, dynamic>);
  static GFilterInputs? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GFilterInputs.serializer, json);
}

class GFormat extends EnumClass {
  const GFormat._(String name) : super(name);

  static const GFormat FORMAT_TEXT = _$gFormatFORMAT_TEXT;

  static const GFormat FORMAT_INT = _$gFormatFORMAT_INT;

  static const GFormat FORMAT_FLOAT = _$gFormatFORMAT_FLOAT;

  static Serializer<GFormat> get serializer => _$gFormatSerializer;
  static BuiltSet<GFormat> get values => _$gFormatValues;
  static GFormat valueOf(String name) => _$gFormatValueOf(name);
}

class GFuncType extends EnumClass {
  const GFuncType._(String name) : super(name);

  static const GFuncType FUNC_TYPE_UNDEFINED = _$gFuncTypeFUNC_TYPE_UNDEFINED;

  static const GFuncType FUNC_TYPE_TABLE = _$gFuncTypeFUNC_TYPE_TABLE;

  static const GFuncType FUNC_TYPE_CHART = _$gFuncTypeFUNC_TYPE_CHART;

  static const GFuncType FUNC_TYPE_DATA_BLOCK = _$gFuncTypeFUNC_TYPE_DATA_BLOCK;

  static const GFuncType FUNC_TYPE_KEY_VALUE_MAP =
      _$gFuncTypeFUNC_TYPE_KEY_VALUE_MAP;

  static const GFuncType FUNC_TYPE_SHEET_DATA = _$gFuncTypeFUNC_TYPE_SHEET_DATA;

  static const GFuncType FUNC_TYPE_INFO_FLOW = _$gFuncTypeFUNC_TYPE_INFO_FLOW;

  static const GFuncType FUNC_TYPE_GRAPH = _$gFuncTypeFUNC_TYPE_GRAPH;

  static const GFuncType FUNC_TYPE_PROGRESS_BAR =
      _$gFuncTypeFUNC_TYPE_PROGRESS_BAR;

  static const GFuncType FUNC_TYPE_STATEMENT_SHEET =
      _$gFuncTypeFUNC_TYPE_STATEMENT_SHEET;

  static const GFuncType FUNC_TYPE_SUB_PROFILE =
      _$gFuncTypeFUNC_TYPE_SUB_PROFILE;

  static const GFuncType FUNC_TYPE_LIST = _$gFuncTypeFUNC_TYPE_LIST;

  static Serializer<GFuncType> get serializer => _$gFuncTypeSerializer;
  static BuiltSet<GFuncType> get values => _$gFuncTypeValues;
  static GFuncType valueOf(String name) => _$gFuncTypeValueOf(name);
}

abstract class GImportEntity
    implements Built<GImportEntity, GImportEntityBuilder> {
  GImportEntity._();

  factory GImportEntity([Function(GImportEntityBuilder b) updates]) =
      _$GImportEntity;

  String get entityID;
  GEntityType get entityType;
  static Serializer<GImportEntity> get serializer => _$gImportEntitySerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GImportEntity.serializer, this)
          as Map<String, dynamic>);
  static GImportEntity? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GImportEntity.serializer, json);
}

abstract class GInvalidateMatchedResultsInput
    implements
        Built<GInvalidateMatchedResultsInput,
            GInvalidateMatchedResultsInputBuilder> {
  GInvalidateMatchedResultsInput._();

  factory GInvalidateMatchedResultsInput(
          [Function(GInvalidateMatchedResultsInputBuilder b) updates]) =
      _$GInvalidateMatchedResultsInput;

  String get importId;
  String get taskID;
  BuiltList<String> get matchName;
  static Serializer<GInvalidateMatchedResultsInput> get serializer =>
      _$gInvalidateMatchedResultsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GInvalidateMatchedResultsInput.serializer, this) as Map<String, dynamic>);
  static GInvalidateMatchedResultsInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GInvalidateMatchedResultsInput.serializer, json);
}

class GJoinStatus extends EnumClass {
  const GJoinStatus._(String name) : super(name);

  static const GJoinStatus JoinSubmit = _$gJoinStatusJoinSubmit;

  static const GJoinStatus JoinEnd = _$gJoinStatusJoinEnd;

  static Serializer<GJoinStatus> get serializer => _$gJoinStatusSerializer;
  static BuiltSet<GJoinStatus> get values => _$gJoinStatusValues;
  static GJoinStatus valueOf(String name) => _$gJoinStatusValueOf(name);
}

abstract class GKeywordFilterInput
    implements Built<GKeywordFilterInput, GKeywordFilterInputBuilder> {
  GKeywordFilterInput._();

  factory GKeywordFilterInput(
      [Function(GKeywordFilterInputBuilder b) updates]) = _$GKeywordFilterInput;

  BuiltList<String> get keywords;
  String? get name;
  String? get displayValue;
  static Serializer<GKeywordFilterInput> get serializer =>
      _$gKeywordFilterInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GKeywordFilterInput.serializer, this)
          as Map<String, dynamic>);
  static GKeywordFilterInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GKeywordFilterInput.serializer, json);
}

class GLegacyEntityType extends EnumClass {
  const GLegacyEntityType._(String name) : super(name);

  static const GLegacyEntityType PERSON = _$gLegacyEntityTypePERSON;

  static const GLegacyEntityType ORGANIZATION = _$gLegacyEntityTypeORGANIZATION;

  static const GLegacyEntityType DEAL = _$gLegacyEntityTypeDEAL;

  static const GLegacyEntityType VERTICAL = _$gLegacyEntityTypeVERTICAL;

  static Serializer<GLegacyEntityType> get serializer =>
      _$gLegacyEntityTypeSerializer;
  static BuiltSet<GLegacyEntityType> get values => _$gLegacyEntityTypeValues;
  static GLegacyEntityType valueOf(String name) =>
      _$gLegacyEntityTypeValueOf(name);
}

abstract class GMap implements Built<GMap, GMapBuilder> {
  GMap._();

  factory GMap([String? value]) =>
      _$GMap((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GMap> get serializer => _i2.DefaultScalarSerializer<GMap>(
      (Object serialized) => GMap((serialized as String?)));
}

abstract class GMatchRecordInput
    implements Built<GMatchRecordInput, GMatchRecordInputBuilder> {
  GMatchRecordInput._();

  factory GMatchRecordInput([Function(GMatchRecordInputBuilder b) updates]) =
      _$GMatchRecordInput;

  String get groupCode;
  bool get processRelevantGroups;
  GOperationEntity get entity;
  static Serializer<GMatchRecordInput> get serializer =>
      _$gMatchRecordInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GMatchRecordInput.serializer, this)
          as Map<String, dynamic>);
  static GMatchRecordInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GMatchRecordInput.serializer, json);
}

abstract class GMatchRecordsFromImportedFileInput
    implements
        Built<GMatchRecordsFromImportedFileInput,
            GMatchRecordsFromImportedFileInputBuilder> {
  GMatchRecordsFromImportedFileInput._();

  factory GMatchRecordsFromImportedFileInput(
          [Function(GMatchRecordsFromImportedFileInputBuilder b) updates]) =
      _$GMatchRecordsFromImportedFileInput;

  String get resourceKey;
  String get groupCode;
  static Serializer<GMatchRecordsFromImportedFileInput> get serializer =>
      _$gMatchRecordsFromImportedFileInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GMatchRecordsFromImportedFileInput.serializer, this)
      as Map<String, dynamic>);
  static GMatchRecordsFromImportedFileInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GMatchRecordsFromImportedFileInput.serializer, json);
}

abstract class GMaybeFloat32
    implements Built<GMaybeFloat32, GMaybeFloat32Builder> {
  GMaybeFloat32._();

  factory GMaybeFloat32([String? value]) =>
      _$GMaybeFloat32((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GMaybeFloat32> get serializer =>
      _i2.DefaultScalarSerializer<GMaybeFloat32>(
          (Object serialized) => GMaybeFloat32((serialized as String?)));
}

abstract class GMaybeFloat64
    implements Built<GMaybeFloat64, GMaybeFloat64Builder> {
  GMaybeFloat64._();

  factory GMaybeFloat64([String? value]) =>
      _$GMaybeFloat64((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GMaybeFloat64> get serializer =>
      _i2.DefaultScalarSerializer<GMaybeFloat64>(
          (Object serialized) => GMaybeFloat64((serialized as String?)));
}

abstract class GMessage implements Built<GMessage, GMessageBuilder> {
  GMessage._();

  factory GMessage([Function(GMessageBuilder b) updates]) = _$GMessage;

  String? get messageId;
  GMessageType? get messageType;
  GCommunicationType? get comType;
  static Serializer<GMessage> get serializer => _$gMessageSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GMessage.serializer, this)
          as Map<String, dynamic>);
  static GMessage? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GMessage.serializer, json);
}

class GMessageType extends EnumClass {
  const GMessageType._(String name) : super(name);

  static const GMessageType Timely = _$gMessageTypeTimely;

  static const GMessageType Simple = _$gMessageTypeSimple;

  static const GMessageType Update = _$gMessageTypeUpdate;

  static const GMessageType Optimization = _$gMessageTypeOptimization;

  static const GMessageType Revision = _$gMessageTypeRevision;

  static const GMessageType Deleted = _$gMessageTypeDeleted;

  static Serializer<GMessageType> get serializer => _$gMessageTypeSerializer;
  static BuiltSet<GMessageType> get values => _$gMessageTypeValues;
  static GMessageType valueOf(String name) => _$gMessageTypeValueOf(name);
}

abstract class GMultiSelectorFilterInput
    implements
        Built<GMultiSelectorFilterInput, GMultiSelectorFilterInputBuilder> {
  GMultiSelectorFilterInput._();

  factory GMultiSelectorFilterInput(
          [Function(GMultiSelectorFilterInputBuilder b) updates]) =
      _$GMultiSelectorFilterInput;

  String? get filterID;
  BuiltList<String> get filterValues;
  String? get operator;
  String? get name;
  String? get displayValue;
  static Serializer<GMultiSelectorFilterInput> get serializer =>
      _$gMultiSelectorFilterInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GMultiSelectorFilterInput.serializer, this)
          as Map<String, dynamic>);
  static GMultiSelectorFilterInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GMultiSelectorFilterInput.serializer, json);
}

class GNextOperator extends EnumClass {
  const GNextOperator._(String name) : super(name);

  static const GNextOperator INCLUDES_ANY = _$gNextOperatorINCLUDES_ANY;

  static const GNextOperator INCLUDES_ALL = _$gNextOperatorINCLUDES_ALL;

  static const GNextOperator BEFORE = _$gNextOperatorBEFORE;

  static const GNextOperator AFTER = _$gNextOperatorAFTER;

  static const GNextOperator BETWEEN = _$gNextOperatorBETWEEN;

  static const GNextOperator BETWEEN_WITH_CLOSED_INTERVAL =
      _$gNextOperatorBETWEEN_WITH_CLOSED_INTERVAL;

  static Serializer<GNextOperator> get serializer => _$gNextOperatorSerializer;
  static BuiltSet<GNextOperator> get values => _$gNextOperatorValues;
  static GNextOperator valueOf(String name) => _$gNextOperatorValueOf(name);
}

class GNextPlatform extends EnumClass {
  const GNextPlatform._(String name) : super(name);

  static const GNextPlatform PLATFORM_UNKNOWN = _$gNextPlatformPLATFORM_UNKNOWN;

  static const GNextPlatform PLATFORM_WEB = _$gNextPlatformPLATFORM_WEB;

  static const GNextPlatform PLATFORM_MOBILE = _$gNextPlatformPLATFORM_MOBILE;

  static Serializer<GNextPlatform> get serializer => _$gNextPlatformSerializer;
  static BuiltSet<GNextPlatform> get values => _$gNextPlatformValues;
  static GNextPlatform valueOf(String name) => _$gNextPlatformValueOf(name);
}

abstract class GNextSearchConditionInput
    implements
        Built<GNextSearchConditionInput, GNextSearchConditionInputBuilder> {
  GNextSearchConditionInput._();

  factory GNextSearchConditionInput(
          [Function(GNextSearchConditionInputBuilder b) updates]) =
      _$GNextSearchConditionInput;

  String get id;
  GConditionOperatorInput get operator;
  BuiltList<GSearchConditionOptionInput> get options;
  String get name;
  GConditionType get type;
  static Serializer<GNextSearchConditionInput> get serializer =>
      _$gNextSearchConditionInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GNextSearchConditionInput.serializer, this)
          as Map<String, dynamic>);
  static GNextSearchConditionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GNextSearchConditionInput.serializer, json);
}

abstract class GOperationEntity
    implements Built<GOperationEntity, GOperationEntityBuilder> {
  GOperationEntity._();

  factory GOperationEntity([Function(GOperationEntityBuilder b) updates]) =
      _$GOperationEntity;

  String get entityID;
  GEntityType get entityType;
  static Serializer<GOperationEntity> get serializer =>
      _$gOperationEntitySerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GOperationEntity.serializer, this)
          as Map<String, dynamic>);
  static GOperationEntity? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GOperationEntity.serializer, json);
}

abstract class GOrderColumn
    implements Built<GOrderColumn, GOrderColumnBuilder> {
  GOrderColumn._();

  factory GOrderColumn([Function(GOrderColumnBuilder b) updates]) =
      _$GOrderColumn;

  String get columnId;
  bool? get isDesc;
  static Serializer<GOrderColumn> get serializer => _$gOrderColumnSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GOrderColumn.serializer, this)
          as Map<String, dynamic>);
  static GOrderColumn? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GOrderColumn.serializer, json);
}

class GOrderStats extends EnumClass {
  const GOrderStats._(String name) : super(name);

  static const GOrderStats SUCCESS = _$gOrderStatsSUCCESS;

  static const GOrderStats REFUND = _$gOrderStatsREFUND;

  static const GOrderStats NOTPAY = _$gOrderStatsNOTPAY;

  static const GOrderStats CLOSED = _$gOrderStatsCLOSED;

  static const GOrderStats REVOKED = _$gOrderStatsREVOKED;

  static const GOrderStats USERPAYING = _$gOrderStatsUSERPAYING;

  static const GOrderStats PAYERROR = _$gOrderStatsPAYERROR;

  static const GOrderStats ACCEPT = _$gOrderStatsACCEPT;

  static Serializer<GOrderStats> get serializer => _$gOrderStatsSerializer;
  static BuiltSet<GOrderStats> get values => _$gOrderStatsValues;
  static GOrderStats valueOf(String name) => _$gOrderStatsValueOf(name);
}

class GOSType extends EnumClass {
  const GOSType._(String name) : super(name);

  static const GOSType IOS = _$gOSTypeIOS;

  static const GOSType Android = _$gOSTypeAndroid;

  static Serializer<GOSType> get serializer => _$gOSTypeSerializer;
  static BuiltSet<GOSType> get values => _$gOSTypeValues;
  static GOSType valueOf(String name) => _$gOSTypeValueOf(name);
}

abstract class GPayOrderRequest
    implements Built<GPayOrderRequest, GPayOrderRequestBuilder> {
  GPayOrderRequest._();

  factory GPayOrderRequest([Function(GPayOrderRequestBuilder b) updates]) =
      _$GPayOrderRequest;

  String get orderID;
  GTypeOrder get typeOrder;
  static Serializer<GPayOrderRequest> get serializer =>
      _$gPayOrderRequestSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPayOrderRequest.serializer, this)
          as Map<String, dynamic>);
  static GPayOrderRequest? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPayOrderRequest.serializer, json);
}

class GPlatform extends EnumClass {
  const GPlatform._(String name) : super(name);

  static const GPlatform PLATFORM_UNKNOWN = _$gPlatformPLATFORM_UNKNOWN;

  static const GPlatform PLATFORM_WEB = _$gPlatformPLATFORM_WEB;

  static const GPlatform PLATFORM_MOBILE = _$gPlatformPLATFORM_MOBILE;

  static Serializer<GPlatform> get serializer => _$gPlatformSerializer;
  static BuiltSet<GPlatform> get values => _$gPlatformValues;
  static GPlatform valueOf(String name) => _$gPlatformValueOf(name);
}

class GProgressStatus extends EnumClass {
  const GProgressStatus._(String name) : super(name);

  static const GProgressStatus PROGRESS_STATUS_ACTIVE =
      _$gProgressStatusPROGRESS_STATUS_ACTIVE;

  static const GProgressStatus PROGRESS_STATUS_CURRENT =
      _$gProgressStatusPROGRESS_STATUS_CURRENT;

  static const GProgressStatus PROGRESS_STATUS_INACTIVE =
      _$gProgressStatusPROGRESS_STATUS_INACTIVE;

  static const GProgressStatus PROGRESS_STATUS_FAIL =
      _$gProgressStatusPROGRESS_STATUS_FAIL;

  static Serializer<GProgressStatus> get serializer =>
      _$gProgressStatusSerializer;
  static BuiltSet<GProgressStatus> get values => _$gProgressStatusValues;
  static GProgressStatus valueOf(String name) => _$gProgressStatusValueOf(name);
}

class GQuarterSequence extends EnumClass {
  const GQuarterSequence._(String name) : super(name);

  static const GQuarterSequence ANNUAL = _$gQuarterSequenceANNUAL;

  static const GQuarterSequence ONE = _$gQuarterSequenceONE;

  static const GQuarterSequence TWO = _$gQuarterSequenceTWO;

  static const GQuarterSequence THREE = _$gQuarterSequenceTHREE;

  static const GQuarterSequence FOUR = _$gQuarterSequenceFOUR;

  static Serializer<GQuarterSequence> get serializer =>
      _$gQuarterSequenceSerializer;
  static BuiltSet<GQuarterSequence> get values => _$gQuarterSequenceValues;
  static GQuarterSequence valueOf(String name) =>
      _$gQuarterSequenceValueOf(name);
}

class GQueryType extends EnumClass {
  const GQueryType._(String name) : super(name);

  static const GQueryType UNION = _$gQueryTypeUNION;

  static const GQueryType INTERSECTION = _$gQueryTypeINTERSECTION;

  static Serializer<GQueryType> get serializer => _$gQueryTypeSerializer;
  static BuiltSet<GQueryType> get values => _$gQueryTypeValues;
  static GQueryType valueOf(String name) => _$gQueryTypeValueOf(name);
}

abstract class GRenameTemplateInput
    implements Built<GRenameTemplateInput, GRenameTemplateInputBuilder> {
  GRenameTemplateInput._();

  factory GRenameTemplateInput(
          [Function(GRenameTemplateInputBuilder b) updates]) =
      _$GRenameTemplateInput;

  String get templateId;
  String? get name;
  static Serializer<GRenameTemplateInput> get serializer =>
      _$gRenameTemplateInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GRenameTemplateInput.serializer, this)
          as Map<String, dynamic>);
  static GRenameTemplateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GRenameTemplateInput.serializer, json);
}

abstract class GRequestID implements Built<GRequestID, GRequestIDBuilder> {
  GRequestID._();

  factory GRequestID([Function(GRequestIDBuilder b) updates]) = _$GRequestID;

  String get id;
  static Serializer<GRequestID> get serializer => _$gRequestIDSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GRequestID.serializer, this)
          as Map<String, dynamic>);
  static GRequestID? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GRequestID.serializer, json);
}

abstract class GRiskFilter implements Built<GRiskFilter, GRiskFilterBuilder> {
  GRiskFilter._();

  factory GRiskFilter([Function(GRiskFilterBuilder b) updates]) = _$GRiskFilter;

  GEntityInput get entityRequest;
  String? get startTime;
  String? get endTime;
  BuiltList<String>? get tagIDs;
  static Serializer<GRiskFilter> get serializer => _$gRiskFilterSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GRiskFilter.serializer, this)
          as Map<String, dynamic>);
  static GRiskFilter? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GRiskFilter.serializer, json);
}

class GRiskType extends EnumClass {
  const GRiskType._(String name) : super(name);

  static const GRiskType NONE = _$gRiskTypeNONE;

  static const GRiskType EVENT = _$gRiskTypeEVENT;

  static const GRiskType SENTIMENT = _$gRiskTypeSENTIMENT;

  static Serializer<GRiskType> get serializer => _$gRiskTypeSerializer;
  static BuiltSet<GRiskType> get values => _$gRiskTypeValues;
  static GRiskType valueOf(String name) => _$gRiskTypeValueOf(name);
}

class GRole extends EnumClass {
  const GRole._(String name) : super(name);

  static const GRole INDIVIDUAL_FREE = _$gRoleINDIVIDUAL_FREE;

  static const GRole INDIVIDUAL_PREMIUM = _$gRoleINDIVIDUAL_PREMIUM;

  static const GRole BASIC = _$gRoleBASIC;

  static const GRole EXPIRED = _$gRoleEXPIRED;

  static const GRole TRIAL = _$gRoleTRIAL;

  static const GRole ACTIVE = _$gRoleACTIVE;

  static Serializer<GRole> get serializer => _$gRoleSerializer;
  static BuiltSet<GRole> get values => _$gRoleValues;
  static GRole valueOf(String name) => _$gRoleValueOf(name);
}

abstract class GSaveTemplateInput
    implements Built<GSaveTemplateInput, GSaveTemplateInputBuilder> {
  GSaveTemplateInput._();

  factory GSaveTemplateInput([Function(GSaveTemplateInputBuilder b) updates]) =
      _$GSaveTemplateInput;

  String get templateId;
  BuiltList<GNextSearchConditionInput>? get conditions;
  static Serializer<GSaveTemplateInput> get serializer =>
      _$gSaveTemplateInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GSaveTemplateInput.serializer, this)
          as Map<String, dynamic>);
  static GSaveTemplateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GSaveTemplateInput.serializer, json);
}

abstract class GSearchConditionOptionInput
    implements
        Built<GSearchConditionOptionInput, GSearchConditionOptionInputBuilder> {
  GSearchConditionOptionInput._();

  factory GSearchConditionOptionInput(
          [Function(GSearchConditionOptionInputBuilder b) updates]) =
      _$GSearchConditionOptionInput;

  String get name;
  BuiltList<String> get values;
  GNextOperator get operator;
  String get id;
  static Serializer<GSearchConditionOptionInput> get serializer =>
      _$gSearchConditionOptionInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GSearchConditionOptionInput.serializer, this) as Map<String, dynamic>);
  static GSearchConditionOptionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GSearchConditionOptionInput.serializer, json);
}

class GSearchTemplatesSortBy extends EnumClass {
  const GSearchTemplatesSortBy._(String name) : super(name);

  static const GSearchTemplatesSortBy LAST_VIEWED_AT =
      _$gSearchTemplatesSortByLAST_VIEWED_AT;

  static const GSearchTemplatesSortBy LAST_NOTIFIED_AT =
      _$gSearchTemplatesSortByLAST_NOTIFIED_AT;

  static Serializer<GSearchTemplatesSortBy> get serializer =>
      _$gSearchTemplatesSortBySerializer;
  static BuiltSet<GSearchTemplatesSortBy> get values =>
      _$gSearchTemplatesSortByValues;
  static GSearchTemplatesSortBy valueOf(String name) =>
      _$gSearchTemplatesSortByValueOf(name);
}

abstract class GSelectorFilterInput
    implements Built<GSelectorFilterInput, GSelectorFilterInputBuilder> {
  GSelectorFilterInput._();

  factory GSelectorFilterInput(
          [Function(GSelectorFilterInputBuilder b) updates]) =
      _$GSelectorFilterInput;

  String? get filterID;
  String get filterValue;
  String? get operator;
  String? get name;
  String? get displayValue;
  static Serializer<GSelectorFilterInput> get serializer =>
      _$gSelectorFilterInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GSelectorFilterInput.serializer, this)
          as Map<String, dynamic>);
  static GSelectorFilterInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GSelectorFilterInput.serializer, json);
}

class GSQLOperator extends EnumClass {
  const GSQLOperator._(String name) : super(name);

  static const GSQLOperator ANY = _$gSQLOperatorANY;

  static const GSQLOperator BETWEEN = _$gSQLOperatorBETWEEN;

  static const GSQLOperator EQUAL = _$gSQLOperatorEQUAL;

  static const GSQLOperator UN_EQUAL = _$gSQLOperatorUN_EQUAL;

  static const GSQLOperator MORE_THAN = _$gSQLOperatorMORE_THAN;

  static const GSQLOperator LESS_THAN = _$gSQLOperatorLESS_THAN;

  static const GSQLOperator IN = _$gSQLOperatorIN;

  static Serializer<GSQLOperator> get serializer => _$gSQLOperatorSerializer;
  static BuiltSet<GSQLOperator> get values => _$gSQLOperatorValues;
  static GSQLOperator valueOf(String name) => _$gSQLOperatorValueOf(name);
}

class GStatus extends EnumClass {
  const GStatus._(String name) : super(name);

  static const GStatus SUCCESS = _$gStatusSUCCESS;

  static const GStatus FAIL = _$gStatusFAIL;

  static const GStatus RUNNING = _$gStatusRUNNING;

  static const GStatus TIMEOUT = _$gStatusTIMEOUT;

  static Serializer<GStatus> get serializer => _$gStatusSerializer;
  static BuiltSet<GStatus> get values => _$gStatusValues;
  static GStatus valueOf(String name) => _$gStatusValueOf(name);
}

abstract class GSubscribeEntityInput
    implements Built<GSubscribeEntityInput, GSubscribeEntityInputBuilder> {
  GSubscribeEntityInput._();

  factory GSubscribeEntityInput(
          [Function(GSubscribeEntityInputBuilder b) updates]) =
      _$GSubscribeEntityInput;

  String get entityId;
  GEntityType get entityType;
  static Serializer<GSubscribeEntityInput> get serializer =>
      _$gSubscribeEntityInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GSubscribeEntityInput.serializer, this)
          as Map<String, dynamic>);
  static GSubscribeEntityInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GSubscribeEntityInput.serializer, json);
}

abstract class GSuggestionFilterInput
    implements Built<GSuggestionFilterInput, GSuggestionFilterInputBuilder> {
  GSuggestionFilterInput._();

  factory GSuggestionFilterInput(
          [Function(GSuggestionFilterInputBuilder b) updates]) =
      _$GSuggestionFilterInput;

  String get filterID;
  BuiltList<String>? get values;
  String? get name;
  String? get displayValue;
  static Serializer<GSuggestionFilterInput> get serializer =>
      _$gSuggestionFilterInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GSuggestionFilterInput.serializer, this)
          as Map<String, dynamic>);
  static GSuggestionFilterInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GSuggestionFilterInput.serializer, json);
}

class GSuggestType extends EnumClass {
  const GSuggestType._(String name) : super(name);

  static const GSuggestType SUGGEST_TYPE_LOCATION =
      _$gSuggestTypeSUGGEST_TYPE_LOCATION;

  static const GSuggestType SUGGEST_TYPE_VERTICAL =
      _$gSuggestTypeSUGGEST_TYPE_VERTICAL;

  static const GSuggestType SUGGEST_TYPE_COMPANY =
      _$gSuggestTypeSUGGEST_TYPE_COMPANY;

  static const GSuggestType SUGGEST_TYPE_INSTITUTIONAL_INVESTOR =
      _$gSuggestTypeSUGGEST_TYPE_INSTITUTIONAL_INVESTOR;

  static const GSuggestType SUGGEST_TYPE_PERSON =
      _$gSuggestTypeSUGGEST_TYPE_PERSON;

  static const GSuggestType SUGGEST_TYPE_FUND = _$gSuggestTypeSUGGEST_TYPE_FUND;

  static const GSuggestType SUGGEST_TYPE_FUND_FOF =
      _$gSuggestTypeSUGGEST_TYPE_FUND_FOF;

  static const GSuggestType SUGGEST_TYPE_LIMITED_PARTNER =
      _$gSuggestTypeSUGGEST_TYPE_LIMITED_PARTNER;

  static const GSuggestType SUGGEST_TYPE_ORGANIZATION =
      _$gSuggestTypeSUGGEST_TYPE_ORGANIZATION;

  static const GSuggestType SUGGEST_TYPE_OTHER_ORG_SAIC =
      _$gSuggestTypeSUGGEST_TYPE_OTHER_ORG_SAIC;

  static Serializer<GSuggestType> get serializer => _$gSuggestTypeSerializer;
  static BuiltSet<GSuggestType> get values => _$gSuggestTypeValues;
  static GSuggestType valueOf(String name) => _$gSuggestTypeValueOf(name);
}

class GTagID extends EnumClass {
  const GTagID._(String name) : super(name);

  static const GTagID ALL = _$gTagIDALL;

  static const GTagID COMPANY = _$gTagIDCOMPANY;

  static const GTagID PERSON = _$gTagIDPERSON;

  static const GTagID VERTICAL = _$gTagIDVERTICAL;

  static Serializer<GTagID> get serializer => _$gTagIDSerializer;
  static BuiltSet<GTagID> get values => _$gTagIDValues;
  static GTagID valueOf(String name) => _$gTagIDValueOf(name);
}

class GTaskStatus extends EnumClass {
  const GTaskStatus._(String name) : super(name);

  static const GTaskStatus DRAFT = _$gTaskStatusDRAFT;

  static const GTaskStatus MATCHED = _$gTaskStatusMATCHED;

  static const GTaskStatus MATCHING = _$gTaskStatusMATCHING;

  static const GTaskStatus COMPLETE = _$gTaskStatusCOMPLETE;

  static Serializer<GTaskStatus> get serializer => _$gTaskStatusSerializer;
  static BuiltSet<GTaskStatus> get values => _$gTaskStatusValues;
  static GTaskStatus valueOf(String name) => _$gTaskStatusValueOf(name);
}

class GTeamGroupId extends EnumClass {
  const GTeamGroupId._(String name) : super(name);

  static const GTeamGroupId INSTITUTIONAL_SUBJECT =
      _$gTeamGroupIdINSTITUTIONAL_SUBJECT;

  static const GTeamGroupId FOF = _$gTeamGroupIdFOF;

  static const GTeamGroupId FUND = _$gTeamGroupIdFUND;

  static const GTeamGroupId INVESTED_FUND = _$gTeamGroupIdINVESTED_FUND;

  static const GTeamGroupId INVESTED_COMPANY = _$gTeamGroupIdINVESTED_COMPANY;

  static const GTeamGroupId INVESTED_FUND_INVESTMENTS =
      _$gTeamGroupIdINVESTED_FUND_INVESTMENTS;

  static const GTeamGroupId LP = _$gTeamGroupIdLP;

  static const GTeamGroupId CO_INS_INVESTOR = _$gTeamGroupIdCO_INS_INVESTOR;

  static const GTeamGroupId VERTICAL_PREFERENCE =
      _$gTeamGroupIdVERTICAL_PREFERENCE;

  static Serializer<GTeamGroupId> get serializer => _$gTeamGroupIdSerializer;
  static BuiltSet<GTeamGroupId> get values => _$gTeamGroupIdValues;
  static GTeamGroupId valueOf(String name) => _$gTeamGroupIdValueOf(name);
}

abstract class GTemplateSearchConditionInput
    implements
        Built<GTemplateSearchConditionInput,
            GTemplateSearchConditionInputBuilder> {
  GTemplateSearchConditionInput._();

  factory GTemplateSearchConditionInput(
          [Function(GTemplateSearchConditionInputBuilder b) updates]) =
      _$GTemplateSearchConditionInput;

  BuiltList<String> get keywords;
  BuiltList<String> get locationID;
  BuiltList<String>? get latestDealTypes;
  bool? get topPlayerInvested;
  String? get foundedYear;
  static Serializer<GTemplateSearchConditionInput> get serializer =>
      _$gTemplateSearchConditionInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GTemplateSearchConditionInput.serializer, this) as Map<String, dynamic>);
  static GTemplateSearchConditionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GTemplateSearchConditionInput.serializer, json);
}

class GTimelineType extends EnumClass {
  const GTimelineType._(String name) : super(name);

  static const GTimelineType TIMELINE_TYPE_OTHER =
      _$gTimelineTypeTIMELINE_TYPE_OTHER;

  static const GTimelineType TIMELINE_TYPE_NEWS =
      _$gTimelineTypeTIMELINE_TYPE_NEWS;

  static Serializer<GTimelineType> get serializer => _$gTimelineTypeSerializer;
  static BuiltSet<GTimelineType> get values => _$gTimelineTypeValues;
  static GTimelineType valueOf(String name) => _$gTimelineTypeValueOf(name);
}

abstract class GTimestamp implements Built<GTimestamp, GTimestampBuilder> {
  GTimestamp._();

  factory GTimestamp([String? value]) =>
      _$GTimestamp((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GTimestamp> get serializer =>
      _i2.DefaultScalarSerializer<GTimestamp>(
          (Object serialized) => GTimestamp((serialized as String?)));
}

abstract class GTrackerTagWithAddToTrackingFlag
    implements
        Built<GTrackerTagWithAddToTrackingFlag,
            GTrackerTagWithAddToTrackingFlagBuilder> {
  GTrackerTagWithAddToTrackingFlag._();

  factory GTrackerTagWithAddToTrackingFlag(
          [Function(GTrackerTagWithAddToTrackingFlagBuilder b) updates]) =
      _$GTrackerTagWithAddToTrackingFlag;

  String get tagName;
  bool get isAdding;
  static Serializer<GTrackerTagWithAddToTrackingFlag> get serializer =>
      _$gTrackerTagWithAddToTrackingFlagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GTrackerTagWithAddToTrackingFlag.serializer, this)
      as Map<String, dynamic>);
  static GTrackerTagWithAddToTrackingFlag? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GTrackerTagWithAddToTrackingFlag.serializer, json);
}

class GTrackerTheme extends EnumClass {
  const GTrackerTheme._(String name) : super(name);

  static const GTrackerTheme TRACKER_THEME_UNSPECIFIED =
      _$gTrackerThemeTRACKER_THEME_UNSPECIFIED;

  static const GTrackerTheme TRACKER_THEME_INSTITUTION =
      _$gTrackerThemeTRACKER_THEME_INSTITUTION;

  static const GTrackerTheme TRACKER_THEME_ENTERPRISE =
      _$gTrackerThemeTRACKER_THEME_ENTERPRISE;

  static const GTrackerTheme TRACKER_THEME_VERTICAL =
      _$gTrackerThemeTRACKER_THEME_VERTICAL;

  static Serializer<GTrackerTheme> get serializer => _$gTrackerThemeSerializer;
  static BuiltSet<GTrackerTheme> get values => _$gTrackerThemeValues;
  static GTrackerTheme valueOf(String name) => _$gTrackerThemeValueOf(name);
}

class GTypeOrder extends EnumClass {
  const GTypeOrder._(String name) : super(name);

  static const GTypeOrder AliPayMobile = _$gTypeOrderAliPayMobile;

  static const GTypeOrder WechatPayMobile = _$gTypeOrderWechatPayMobile;

  static const GTypeOrder ApplePay = _$gTypeOrderApplePay;

  static const GTypeOrder AliPayWeb = _$gTypeOrderAliPayWeb;

  static const GTypeOrder WechatPayWeb = _$gTypeOrderWechatPayWeb;

  static const GTypeOrder None = _$gTypeOrderNone;

  static Serializer<GTypeOrder> get serializer => _$gTypeOrderSerializer;
  static BuiltSet<GTypeOrder> get values => _$gTypeOrderValues;
  static GTypeOrder valueOf(String name) => _$gTypeOrderValueOf(name);
}

abstract class GUpdateCommodityRequest
    implements Built<GUpdateCommodityRequest, GUpdateCommodityRequestBuilder> {
  GUpdateCommodityRequest._();

  factory GUpdateCommodityRequest(
          [Function(GUpdateCommodityRequestBuilder b) updates]) =
      _$GUpdateCommodityRequest;

  String get id;
  String get name;
  GMaybeFloat32 get amount;
  int get day;
  String get serviceID;
  static Serializer<GUpdateCommodityRequest> get serializer =>
      _$gUpdateCommodityRequestSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUpdateCommodityRequest.serializer, this)
          as Map<String, dynamic>);
  static GUpdateCommodityRequest? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdateCommodityRequest.serializer, json);
}

abstract class GUpdateUserInfoInput
    implements Built<GUpdateUserInfoInput, GUpdateUserInfoInputBuilder> {
  GUpdateUserInfoInput._();

  factory GUpdateUserInfoInput(
          [Function(GUpdateUserInfoInputBuilder b) updates]) =
      _$GUpdateUserInfoInput;

  String? get userName;
  String? get description;
  String? get avatarURL;
  static Serializer<GUpdateUserInfoInput> get serializer =>
      _$gUpdateUserInfoInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUpdateUserInfoInput.serializer, this)
          as Map<String, dynamic>);
  static GUpdateUserInfoInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdateUserInfoInput.serializer, json);
}

abstract class GUpdateUserProfileInput
    implements Built<GUpdateUserProfileInput, GUpdateUserProfileInputBuilder> {
  GUpdateUserProfileInput._();

  factory GUpdateUserProfileInput(
          [Function(GUpdateUserProfileInputBuilder b) updates]) =
      _$GUpdateUserProfileInput;

  BuiltList<GUserProfileFieldInput>? get fields;
  static Serializer<GUpdateUserProfileInput> get serializer =>
      _$gUpdateUserProfileInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUpdateUserProfileInput.serializer, this)
          as Map<String, dynamic>);
  static GUpdateUserProfileInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdateUserProfileInput.serializer, json);
}

abstract class GUpload implements Built<GUpload, GUploadBuilder> {
  GUpload._();

  factory GUpload([String? value]) =>
      _$GUpload((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GUpload> get serializer =>
      _i2.DefaultScalarSerializer<GUpload>(
          (Object serialized) => GUpload((serialized as String?)));
}

abstract class GUserProfileFieldInput
    implements Built<GUserProfileFieldInput, GUserProfileFieldInputBuilder> {
  GUserProfileFieldInput._();

  factory GUserProfileFieldInput(
          [Function(GUserProfileFieldInputBuilder b) updates]) =
      _$GUserProfileFieldInput;

  String get name;
  BuiltList<GUserProfileFieldOptionInput>? get selectedOptions;
  static Serializer<GUserProfileFieldInput> get serializer =>
      _$gUserProfileFieldInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUserProfileFieldInput.serializer, this)
          as Map<String, dynamic>);
  static GUserProfileFieldInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUserProfileFieldInput.serializer, json);
}

abstract class GUserProfileFieldOptionInput
    implements
        Built<GUserProfileFieldOptionInput,
            GUserProfileFieldOptionInputBuilder> {
  GUserProfileFieldOptionInput._();

  factory GUserProfileFieldOptionInput(
          [Function(GUserProfileFieldOptionInputBuilder b) updates]) =
      _$GUserProfileFieldOptionInput;

  String get name;
  String get value;
  static Serializer<GUserProfileFieldOptionInput> get serializer =>
      _$gUserProfileFieldOptionInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GUserProfileFieldOptionInput.serializer, this) as Map<String, dynamic>);
  static GUserProfileFieldOptionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GUserProfileFieldOptionInput.serializer, json);
}

abstract class GVBSearchConditionInput
    implements Built<GVBSearchConditionInput, GVBSearchConditionInputBuilder> {
  GVBSearchConditionInput._();

  factory GVBSearchConditionInput(
          [Function(GVBSearchConditionInputBuilder b) updates]) =
      _$GVBSearchConditionInput;

  BuiltList<String> get keywords;
  String? get locationID;
  BuiltList<String>? get latestDealTypes;
  bool? get topPlayerInvested;
  String? get foundedYear;
  static Serializer<GVBSearchConditionInput> get serializer =>
      _$gVBSearchConditionInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GVBSearchConditionInput.serializer, this)
          as Map<String, dynamic>);
  static GVBSearchConditionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GVBSearchConditionInput.serializer, json);
}

class GVBSearchType extends EnumClass {
  const GVBSearchType._(String name) : super(name);

  static const GVBSearchType COMPANY = _$gVBSearchTypeCOMPANY;

  static const GVBSearchType DEAL = _$gVBSearchTypeDEAL;

  static const GVBSearchType INS_INVESTOR = _$gVBSearchTypeINS_INVESTOR;

  static Serializer<GVBSearchType> get serializer => _$gVBSearchTypeSerializer;
  static BuiltSet<GVBSearchType> get values => _$gVBSearchTypeValues;
  static GVBSearchType valueOf(String name) => _$gVBSearchTypeValueOf(name);
}

abstract class GVerifyCodeInput
    implements Built<GVerifyCodeInput, GVerifyCodeInputBuilder> {
  GVerifyCodeInput._();

  factory GVerifyCodeInput([Function(GVerifyCodeInputBuilder b) updates]) =
      _$GVerifyCodeInput;

  GContactType get contactType;
  String get verificationCode;
  String get contactInfo;
  String get tokenString;
  static Serializer<GVerifyCodeInput> get serializer =>
      _$gVerifyCodeInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GVerifyCodeInput.serializer, this)
          as Map<String, dynamic>);
  static GVerifyCodeInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GVerifyCodeInput.serializer, json);
}
