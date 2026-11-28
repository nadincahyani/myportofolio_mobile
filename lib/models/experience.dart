import 'package:json_annotation/json_annotation.dart';

part 'experience.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Experience {
  @JsonKey(includeToJson: false)
  final String? id;
  final String role;
  final String organization;
  final String description;
  final String category;
  final String? dateDisplay;
  final String? documentationUrl;
  final bool isOngoing;

  const Experience({
    this.id,
    required this.role,
    required this.organization,
    required this.description,
    this.category = 'organization',
    this.dateDisplay,
    this.documentationUrl,
    this.isOngoing = true,
  });

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
