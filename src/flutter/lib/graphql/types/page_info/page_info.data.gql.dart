// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'page_info.data.gql.g.dart';

abstract class GPageInfoFields {
  String get G__typename;
  bool get hasPreviousPage;
  bool get hasNextPage;
  String? get startCursor;
  String? get endCursor;
  Map<String, dynamic> toJson();
}

abstract class GPageInfoFieldsData
    implements
        Built<GPageInfoFieldsData, GPageInfoFieldsDataBuilder>,
        GPageInfoFields {
  GPageInfoFieldsData._();

  factory GPageInfoFieldsData(
      [Function(GPageInfoFieldsDataBuilder b) updates]) = _$GPageInfoFieldsData;

  static void _initializeBuilder(GPageInfoFieldsDataBuilder b) =>
      b..G__typename = 'PageInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get hasPreviousPage;
  bool get hasNextPage;
  String? get startCursor;
  String? get endCursor;
  static Serializer<GPageInfoFieldsData> get serializer =>
      _$gPageInfoFieldsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPageInfoFieldsData.serializer, this)
          as Map<String, dynamic>);
  static GPageInfoFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPageInfoFieldsData.serializer, json);
}
