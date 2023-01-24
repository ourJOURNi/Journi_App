import 'package:json_annotation/json_annotation.dart';

part 'program.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Program {
  const Program({
    required this.title,
    required this.date,
    required this.summary,
    required this.details,
  });
  final String title;
  final String date;
  final String summary;
  final String details;

  static const empty = Program(
    title: '',
    date: '',
    summary: '',
    details: ''
  );

  factory Program.fromJson(Map<String, dynamic> json) => _$ProgramFromJson(json);
}