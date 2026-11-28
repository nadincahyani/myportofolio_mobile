import 'package:json_annotation/json_annotation.dart';

part 'experience.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Experience {
  @JsonKey(includeToJson: false)
  final int? id;
  final String role;
  final String organization;
  final String location;
  final String startDate;
  final String? endDate;
  final bool isCurrent;
  final String description;

  const Experience({
    this.id,
    required this.role,
    required this.organization,
    this.location = '',
    required this.startDate,
    this.endDate,
    this.isCurrent = false,
    this.description = '',
  });

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
