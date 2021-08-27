// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wechat_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeChatPayloadModel _$WeChatPayloadModelFromJson(Map<String, dynamic> json) {
  return WeChatPayloadModel(
    json['appid'] as String? ?? '',
    json['noncestr'] as String? ?? '',
    json['package'] as String? ?? '',
    json['partnerid'] as String? ?? '',
    json['prepayid'] as String? ?? '',
    json['paySign'] as String? ?? '',
    json['timestamp'] as String? ?? '',
  );
}

Map<String, dynamic> _$WeChatPayloadModelToJson(WeChatPayloadModel instance) =>
    <String, dynamic>{
      'appid': instance.appId,
      'partnerid': instance.partnerId,
      'prepayid': instance.prepayId,
      'package': instance.package,
      'noncestr': instance.noncestr,
      'timestamp': instance.timestamp,
      'paySign': instance.sign,
    };
