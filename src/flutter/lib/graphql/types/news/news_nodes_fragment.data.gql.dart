// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i3;
import 'package:rime_app/graphql/types/entity/entity_fragment.data.gql.dart'
    as _i1;

part 'news_nodes_fragment.data.gql.g.dart';

abstract class GNewsFields {
  String get G__typename;
  String? get id;
  String? get title;
  String? get abstract;
  String? get link;
  String? get publishTime;
  String? get source;
  String? get content;
  String? get pictureURL;
  BuiltList<GNewsFields_relatedEntity> get relatedEntity;
  Map<String, dynamic> toJson();
}

abstract class GNewsFields_relatedEntity implements _i1.GEntityFields {
  String get G__typename;
  String? get entityId;
  _i2.GEntityType get entityType;
  String get entityName;
  String? get portraitURL;
  Map<String, dynamic> toJson();
}

abstract class GNewsFieldsData
    implements Built<GNewsFieldsData, GNewsFieldsDataBuilder>, GNewsFields {
  GNewsFieldsData._();

  factory GNewsFieldsData([Function(GNewsFieldsDataBuilder b) updates]) =
      _$GNewsFieldsData;

  static void _initializeBuilder(GNewsFieldsDataBuilder b) =>
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
  BuiltList<GNewsFieldsData_relatedEntity> get relatedEntity;
  static Serializer<GNewsFieldsData> get serializer =>
      _$gNewsFieldsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i3.serializers.serializeWith(GNewsFieldsData.serializer, this)
          as Map<String, dynamic>);
  static GNewsFieldsData? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(GNewsFieldsData.serializer, json);
}

abstract class GNewsFieldsData_relatedEntity
    implements
        Built<GNewsFieldsData_relatedEntity,
            GNewsFieldsData_relatedEntityBuilder>,
        GNewsFields_relatedEntity,
        _i1.GEntityFields {
  GNewsFieldsData_relatedEntity._();

  factory GNewsFieldsData_relatedEntity(
          [Function(GNewsFieldsData_relatedEntityBuilder b) updates]) =
      _$GNewsFieldsData_relatedEntity;

  static void _initializeBuilder(GNewsFieldsData_relatedEntityBuilder b) =>
      b..G__typename = 'Entity';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get entityId;
  _i2.GEntityType get entityType;
  String get entityName;
  String? get portraitURL;
  static Serializer<GNewsFieldsData_relatedEntity> get serializer =>
      _$gNewsFieldsDataRelatedEntitySerializer;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
      GNewsFieldsData_relatedEntity.serializer, this) as Map<String, dynamic>);
  static GNewsFieldsData_relatedEntity? fromJson(Map<String, dynamic> json) =>
      _i3.serializers
          .deserializeWith(GNewsFieldsData_relatedEntity.serializer, json);
}
