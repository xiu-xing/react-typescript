// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'realm.var.gql.g.dart';

abstract class GAppRealmVars
    implements Built<GAppRealmVars, GAppRealmVarsBuilder> {
  GAppRealmVars._();

  factory GAppRealmVars([Function(GAppRealmVarsBuilder b) updates]) =
      _$GAppRealmVars;

  static Serializer<GAppRealmVars> get serializer => _$gAppRealmVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAppRealmVars.serializer, this)
          as Map<String, dynamic>);
  static GAppRealmVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAppRealmVars.serializer, json);
}

abstract class GAppRealmSearchResultVars
    implements
        Built<GAppRealmSearchResultVars, GAppRealmSearchResultVarsBuilder> {
  GAppRealmSearchResultVars._();

  factory GAppRealmSearchResultVars(
          [Function(GAppRealmSearchResultVarsBuilder b) updates]) =
      _$GAppRealmSearchResultVars;

  String get realmID;
  int? get first;
  String? get after;
  int? get last;
  String? get before;
  BuiltList<_i2.GNextSearchConditionInput> get conditions;
  BuiltList<_i2.GOrderColumn>? get orderColumns;
  static Serializer<GAppRealmSearchResultVars> get serializer =>
      _$gAppRealmSearchResultVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAppRealmSearchResultVars.serializer, this)
          as Map<String, dynamic>);
  static GAppRealmSearchResultVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAppRealmSearchResultVars.serializer, json);
}
