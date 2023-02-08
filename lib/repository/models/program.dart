import 'package:json_annotation/json_annotation.dart';

part 'program.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Program {
  const Program({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.summary,
    required this.details,
    required this.photo,
  });
  final String id;
  final String title;
  final String category;
  final String date;
  final String summary;
  final String details;
  final String photo;

  static const empty = Program(
    id: '',
    title: '',
    category: '',
    date: '',
    summary: '',
    details: '',
    photo: ''
  );

  factory Program.fromJson(Map<String, dynamic> json) => _$ProgramFromJson(json);
}