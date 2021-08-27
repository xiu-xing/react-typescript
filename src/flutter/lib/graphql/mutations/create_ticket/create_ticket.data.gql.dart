// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'create_ticket.data.gql.g.dart';

abstract class GCreateTicketData
    implements Built<GCreateTicketData, GCreateTicketDataBuilder> {
  GCreateTicketData._();

  factory GCreateTicketData([Function(GCreateTicketDataBuilder b) updates]) =
      _$GCreateTicketData;

  static void _initializeBuilder(GCreateTicketDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get createTicket;
  static Serializer<GCreateTicketData> get serializer =>
      _$gCreateTicketDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCreateTicketData.serializer, this)
          as Map<String, dynamic>);
  static GCreateTicketData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCreateTicketData.serializer, json);
}
