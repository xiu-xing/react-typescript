import 'package:json_annotation/json_annotation.dart';

part 'channel_statistics.g.dart';

@JsonSerializable()
class ChannelStatisticsModel {
  ChannelStatisticsModel(this.title, this.value);

  String title;
  String value;

  factory ChannelStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$ChannelStatisticsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChannelStatisticsModelToJson(this);
}
