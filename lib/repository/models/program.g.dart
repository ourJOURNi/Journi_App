// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Program _$ProgramFromJson(Map<String, dynamic> json) => Program(
      title: json['title'] as String,
      category: json['category'] as String,
      date: json['date'] as String,
      summary: json['summary'] as String,
      details: json['details'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$ProgramToJson(Program instance) => <String, dynamic>{
      'title': instance.title,
      'category': instance.category,
      'date': instance.date,
      'summary': instance.summary,
      'details': instance.details,
      'photo': instance.photo,
    };
