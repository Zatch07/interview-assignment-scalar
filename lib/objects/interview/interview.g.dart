// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Interview _$$_InterviewFromJson(Map<String, dynamic> json) => _$_Interview(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      participants: (json['participants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const {},
    );

Map<String, dynamic> _$$_InterviewToJson(_$_Interview instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'participants': instance.participants.toList(),
    };
