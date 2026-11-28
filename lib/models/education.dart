import 'package:json_annotation/json_annotation.dart';

part 'education.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Education {
  @JsonKey(includeToJson: false)
  final int? id;
  final String institution;
  final String degree;
  final String fieldOfStudy;
  final String startYear;
  final String? endYear;
  final String description;

  const Education({
    this.id,
    required this.institution,
    required this.degree,
    required this.fieldOfStudy,
    required this.startYear,
    this.endYear,
    this.description = '',
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);
}
