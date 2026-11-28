import 'package:json_annotation/json_annotation.dart';

part 'education.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Education {
  @JsonKey(includeToJson: false)
  final int? id;
  final String institution;
  final String degree;
  final int startYear;
  final String? endYear;
  final bool isOngoing;

  const Education({
    this.id,
    required this.institution,
    required this.degree,
    required this.startYear,
    this.endYear,
    this.isOngoing = false,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);
}
