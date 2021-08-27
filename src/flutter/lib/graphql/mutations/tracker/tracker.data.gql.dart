// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'tracker.data.gql.g.dart';

abstract class GTrackEntityData
    implements Built<GTrackEntityData, GTrackEntityDataBuilder> {
  GTrackEntityData._();

  factory GTrackEntityData([Function(GTrackEntityDataBuilder b) updates]) =
      _$GTrackEntityData;

  static void _initializeBuilder(GTrackEntityDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get appTrackEntity;
  static Serializer<GTrackEntityData> get serializer =>
      _$gTrackEntityDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GTrackEntityData.serializer, this)
          as Map<String, dynamic>);
  static GTrackEntityData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GTrackEntityData.serializer, json);
}

abstract class GUnTrackEntityByEntityIDData
    implements
        Built<GUnTrackEntityByEntityIDData,
            GUnTrackEntityByEntityIDDataBuilder> {
  GUnTrackEntityByEntityIDData._();

  factory GUnTrackEntityByEntityIDData(
          [Function(GUnTrackEntityByEntityIDDataBuilder b) updates]) =
      _$GUnTrackEntityByEntityIDData;

  static void _initializeBuilder(GUnTrackEntityByEntityIDDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get appUnTrackEntityByEntityID;
  static Serializer<GUnTrackEntityByEntityIDData> get serializer =>
      _$gUnTrackEntityByEntityIDDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GUnTrackEntityByEntityIDData.serializer, this) as Map<String, dynamic>);
  static GUnTrackEntityByEntityIDData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GUnTrackEntityByEntityIDData.serializer, json);
}
