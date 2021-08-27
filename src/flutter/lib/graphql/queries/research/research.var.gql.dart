// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'research.var.gql.g.dart';

abstract class GArticleDetailVars
    implements Built<GArticleDetailVars, GArticleDetailVarsBuilder> {
  GArticleDetailVars._();

  factory GArticleDetailVars([Function(GArticleDetailVarsBuilder b) updates]) =
      _$GArticleDetailVars;

  String get id;
  String get articleModuleID;
  static Serializer<GArticleDetailVars> get serializer =>
      _$gArticleDetailVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GArticleDetailVars.serializer, this)
          as Map<String, dynamic>);
  static GArticleDetailVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GArticleDetailVars.serializer, json);
}

abstract class GArticleUriVars
    implements Built<GArticleUriVars, GArticleUriVarsBuilder> {
  GArticleUriVars._();

  factory GArticleUriVars([Function(GArticleUriVarsBuilder b) updates]) =
      _$GArticleUriVars;

  String get id;
  _i2.GArticleType get articleType;
  String get articleModuleID;
  _i2.GFetchType get fetchType;
  static Serializer<GArticleUriVars> get serializer =>
      _$gArticleUriVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GArticleUriVars.serializer, this)
          as Map<String, dynamic>);
  static GArticleUriVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GArticleUriVars.serializer, json);
}

abstract class GArticleListVars
    implements Built<GArticleListVars, GArticleListVarsBuilder> {
  GArticleListVars._();

  factory GArticleListVars([Function(GArticleListVarsBuilder b) updates]) =
      _$GArticleListVars;

  String get articleListID;
  int? get first;
  String? get after;
  int? get last;
  String? get before;
  _i2.GFilterInputs? get filters;
  String get articleModuleID;
  static Serializer<GArticleListVars> get serializer =>
      _$gArticleListVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GArticleListVars.serializer, this)
          as Map<String, dynamic>);
  static GArticleListVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GArticleListVars.serializer, json);
}

abstract class GArticleTabsVars
    implements Built<GArticleTabsVars, GArticleTabsVarsBuilder> {
  GArticleTabsVars._();

  factory GArticleTabsVars([Function(GArticleTabsVarsBuilder b) updates]) =
      _$GArticleTabsVars;

  String get articleModuleID;
  static Serializer<GArticleTabsVars> get serializer =>
      _$gArticleTabsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GArticleTabsVars.serializer, this)
          as Map<String, dynamic>);
  static GArticleTabsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GArticleTabsVars.serializer, json);
}
