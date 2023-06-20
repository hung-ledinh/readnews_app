import 'package:json_annotation/json_annotation.dart';

part 'read_news_json.g.dart';

@JsonSerializable()
class ReadNewsEntity {
  /// The generated code assumes these values exist in JSON.
  final int id;
  final int userId;
  final String title;
  final String body;

  ReadNewsEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory ReadNewsEntity.fromJson(Map<String, dynamic> json) =>
      _$ReadNewsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReadNewsEntityToJson(this);
}
