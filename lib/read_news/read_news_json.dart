import 'package:json_annotation/json_annotation.dart';

part 'read_news_json.g.dart';

@JsonSerializable()
class ReadNewsEntity {
  /// The generated code assumes these values exist in JSON.
  int? id;
  int? userId;
  String? title;
  String? body;

  ReadNewsEntity({this.userId, this.id, this.title, this.body});

  ReadNewsEntity copyWith({int? userId, int? id, String? title, String? body}) {
    return ReadNewsEntity()
      ..userId = userId ?? this.userId
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..body = body ?? this.body;
  }

  factory ReadNewsEntity.fromJson(Map<String, dynamic> json) =>
      _$ReadNewsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReadNewsEntityToJson(this);
}
