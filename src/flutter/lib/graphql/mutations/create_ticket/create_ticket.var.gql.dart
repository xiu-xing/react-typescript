// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'create_ticket.var.gql.g.dart';

abstract class GCreateTicketVars
    implements Built<GCreateTicketVars, GCreateTicketVarsBuilder> {
  GCreateTicketVars._();

  factory GCreateTicketVars([Function(GCreateTicketVarsBuilder b) updates]) =
      _$GCreateTicketVars;

  String? get payload;
  String get type;
  static Serializer<GCreateTicketVars> get serializer =>
      _$gCreateTicketVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCreateTicketVars.serializer, this)
          as Map<String, dynamic>);
  static GCreateTicketVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCreateTicketVars.serializer, json);
}
