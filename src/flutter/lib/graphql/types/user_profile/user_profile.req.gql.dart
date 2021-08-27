// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;
import 'package:rime_app/graphql/types/user_profile/user_profile.ast.gql.dart'
    as _i4;
import 'package:rime_app/graphql/types/user_profile/user_profile.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/types/user_profile/user_profile.var.gql.dart'
    as _i3;

part 'user_profile.req.gql.g.dart';

abstract class GUserProfileFieldsReq
    implements
        Built<GUserProfileFieldsReq, GUserProfileFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GUserProfileFieldsData,
            _i3.GUserProfileFieldsVars> {
  GUserProfileFieldsReq._();

  factory GUserProfileFieldsReq(
          [Function(GUserProfileFieldsReqBuilder b) updates]) =
      _$GUserProfileFieldsReq;

  static void _initializeBuilder(GUserProfileFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'UserProfileFields';
  _i3.GUserProfileFieldsVars get vars;
  _i5.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GUserProfileFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GUserProfileFieldsData.fromJson(json);
  static Serializer<GUserProfileFieldsReq> get serializer =>
      _$gUserProfileFieldsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GUserProfileFieldsReq.serializer, this)
          as Map<String, dynamic>);
  static GUserProfileFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GUserProfileFieldsReq.serializer, json);
}
