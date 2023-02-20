// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bored.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bored _$BoredFromJson(Map<String, dynamic> json) => Bored(
      activity: json['activity'] as String? ?? '',
      type: json['type'] as String? ?? '',
      participants: json['participants'] as int? ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      accessibility: (json['accessibility'] as num?)?.toDouble() ?? 0,
      link: json['link'] as String? ?? '',
    );

Map<String, dynamic> _$BoredToJson(Bored instance) => <String, dynamic>{
      'activity': instance.activity,
      'type': instance.type,
      'participants': instance.participants,
      'price': instance.price,
      'accessibility': instance.accessibility,
      'link': instance.link,
    };
