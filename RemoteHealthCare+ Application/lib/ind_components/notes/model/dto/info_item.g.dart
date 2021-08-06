// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoItem _$InfoItemFromJson(Map<String, dynamic> json) {
  return InfoItem(
    id: json['id'] as int,
    organization: json['organization'] as String,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$InfoItemToJson(InfoItem instance) => <String, dynamic>{
      'id': instance.id,
      'organization': instance.organization,
      'text': instance.text,
    };
