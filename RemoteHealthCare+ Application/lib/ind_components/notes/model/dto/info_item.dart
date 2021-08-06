
import 'package:json_annotation/json_annotation.dart';

part 'info_item.g.dart';

@JsonSerializable()
class InfoItem {
  int id;
  String organization;
  String text;

  InfoItem({this.id, this.organization, this.text});

  factory InfoItem.fromJson(Map<String, dynamic> json) => _$InfoItemFromJson(json);
}