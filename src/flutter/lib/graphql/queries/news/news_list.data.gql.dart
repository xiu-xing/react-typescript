// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i4;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;
import 'package:rime_app/graphql/types/entity/entity_fragment.data.gql.dart'
    as _i3;
import 'package:rime_app/graphql/types/news/news_nodes_fragment.data.gql.dart'
    as _i2;

part 'news_list.data.gql.g.dart';

abstract class GNewsListData
    implements Built<GNewsListData, GNewsListDataBuilder> {
  GNewsListData._();

  factory GNewsListData([Function(GNewsListDataBuilder b) updates]) =
      _$GNewsListData;

  static void _initializeBuilder(GNewsListDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GNewsListData_newsList? get newsList;
  static Serializer<GNewsListData> get serializer => _$gNewsListDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GNewsListData.serializer, this)
          as Map<String, dynamic>);
  static GNewsListData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GNewsListData.serializer, json);
}

abstract class GNewsListData_newsList
    implements Built<GNewsListData_newsList, GNewsListData_newsListBuilder> {
  GNewsListData_newsList._();

  factory GNewsListData_newsList(
          [Function(GNewsListData_newsListBuilder b) updates]) =
      _$GNewsListData_newsList;

  static void _initializeBuilder(GNewsListData_newsListBuilder b) =>
      b..G__typename = 'NewsConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GNewsListData_newsList_nodes>? get nodes;
  GNewsListData_newsList_pageInfo get pageInfo;
  static Serializer<GNewsListData_newsList> get serializer =>
      _$gNewsListDataNewsListSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GNewsListData_newsList.serializer, this)
          as Map<String, dynamic>);
  static GNewsListData_newsList? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GNewsListData_newsList.serializer, json);
}

abstract class GNewsListData_newsList_nodes
    implements
        Built<GNewsListData_newsList_nodes,
            GNewsListData_newsList_nodesBuilder>,
        _i2.GNewsFields {
  GNewsListData_newsList_nodes._();

  factory GNewsListData_newsList_nodes(
          [Function(GNewsListData_newsList_nodesBuilder b) updates]) =
      _$GNewsListData_newsList_nodes;

  static void _initializeBuilder(GNewsListData_newsList_nodesBuilder b) =>
      b..G__typename = 'News';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get title;
  String? get abstract;
  String? get link;
  String? get publishTime;
  String? get source;
  String? get content;
  String? get pictureURL;
  BuiltList<GNewsListData_newsList_nodes_relatedEntity> get relatedEntity;
  static Serializer<GNewsListData_newsList_nodes> get serializer =>
      _$gNewsListDataNewsListNodesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GNewsListData_newsList_nodes.serializer, this) as Map<String, dynamic>);
  static GNewsListData_newsList_nodes? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GNewsListData_newsList_nodes.serializer, json);
}

abstract class GNewsListData_newsList_nodes_relatedEntity
    implements
        Built<GNewsListData_newsList_nodes_relatedEntity,
            GNewsListData_newsList_nodes_relatedEntityBuilder>,
        _i2.GNewsFields_relatedEntity,
        _i3.GEntityFields {
  GNewsListData_newsList_nodes_relatedEntity._();

  factory GNewsListData_newsList_nodes_relatedEntity(
      [Function(GNewsListData_newsList_nodes_relatedEntityBuilder b)
          updates]) = _$GNewsListData_newsList_nodes_relatedEntity;

  static void _initializeBuilder(
          GNewsListData_newsList_nodes_relatedEntityBuilder b) =>
      b..G__typename = 'Entity';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get entityId;
  _i4.GEntityType get entityType;
  String get entityName;
  String? get portraitURL;
  static Serializer<GNewsListData_newsList_nodes_relatedEntity>
      get serializer => _$gNewsListDataNewsListNodesRelatedEntitySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GNewsListData_newsList_nodes_relatedEntity.serializer, this)
      as Map<String, dynamic>);
  static GNewsListData_newsList_nodes_relatedEntity? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GNewsListData_newsList_nodes_relatedEntity.serializer, json);
}

abstract class GNewsListData_newsList_pageInfo
    implements
        Built<GNewsListData_newsList_pageInfo,
            GNewsListData_newsList_pageInfoBuilder> {
  GNewsListData_newsList_pageInfo._();

  factory GNewsListData_newsList_pageInfo(
          [Function(GNewsListData_newsList_pageInfoBuilder b) updates]) =
      _$GNewsListData_newsList_pageInfo;

  static void _initializeBuilder(GNewsListData_newsList_pageInfoBuilder b) =>
      b..G__typename = 'PageInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get hasPreviousPage;
  bool get hasNextPage;
  String? get startCursor;
  String? get endCursor;
  static Serializer<GNewsListData_newsList_pageInfo> get serializer =>
      _$gNewsListDataNewsListPageInfoSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GNewsListData_newsList_pageInfo.serializer, this)
      as Map<String, dynamic>);
  static GNewsListData_newsList_pageInfo? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GNewsListData_newsList_pageInfo.serializer, json);
}
