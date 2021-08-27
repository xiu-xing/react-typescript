import 'package:json_annotation/json_annotation.dart';

part 'wechat_payload.g.dart';

@JsonSerializable()
class WeChatPayloadModel {
  WeChatPayloadModel(
    this.appId,
    this.noncestr,
    this.package,
    this.partnerId,
    this.prepayId,
    this.sign,
    this.timestamp,
  );

  @JsonKey(name: 'appid', defaultValue: "")
  String appId;
  @JsonKey(name: 'partnerid', defaultValue: "")
  String partnerId;
  @JsonKey(name: 'prepayid', defaultValue: "")
  String prepayId;
  @JsonKey(defaultValue: "")
  String package;
  @JsonKey(defaultValue: "")
  String noncestr;
  @JsonKey(defaultValue: "")
  String timestamp;
  @JsonKey(name: 'paySign', defaultValue: "")
  String sign;

  factory WeChatPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$WeChatPayloadModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeChatPayloadModelToJson(this);
}
