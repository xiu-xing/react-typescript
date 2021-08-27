// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i2;

part 'entity_fragment.data.gql.g.dart';

abstract class GEntityFields {
  String get G__typename;
  String? get entityId;
  _i1.GEntityType get entityType;
  String get entityName;
  String? get portraitURL;
  Map<String, dynamic> toJson();
}

abstract class GEntityFieldsData
    implements
        Built<GEntityFieldsData, GEntityFieldsDataBuilder>,
        GEntityFields {
  GEntityFieldsData._();

  factory GEntityFieldsData([Function(GEntityFieldsDataBuilder b) updates]) =
      _$GEntityFieldsData;

  static void _initializeBuilder(GEntityFieldsDataBuilder b) =>
      b..G__typename = 'Entity';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get entityId;
  _i1.GEntityType get entityType;
  String get entityName;
  String? get portraitURL;
  static Serializer<GEntityFieldsData> get serializer =>
      _$gEntityFieldsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GEntityFieldsData.serializer, this)
          as Map<String, dynamic>);
  static GEntityFieldsData? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GEntityFieldsData.serializer, json);
}
