// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Participant _$$_ParticipantFromJson(Map<String, dynamic> json) =>
    _$_Participant(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      resumeLink: json['resumeLink'] as String?,
      interviews: (json['interviews'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const {},
    );

Map<String, dynamic> _$$_ParticipantToJson(_$_Participant instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'email': instance.email,
      'resumeLink': instance.resumeLink,
      'interviews': instance.interviews.toList(),
    };
