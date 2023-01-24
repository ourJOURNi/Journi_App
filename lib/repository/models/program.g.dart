// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Program _$ProgramFromJson(Map<String, dynamic> json) => Program(
      title: json['title'] as String,
      date: json['date'] as String,
      summary: json['summary'] as String,
      details: json['details'] as String,
    );

Map<String, dynamic> _$ProgramToJson(Program instance) => <String, dynamic>{
      'title': instance.title,
      'date': instance.date,
      'summary': instance.summary,
      'details': instance.details,
    };
