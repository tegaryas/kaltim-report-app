import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  NewsModel({
    required this.title,
    this.url,
    this.urlToImage,
    required this.publishedAt,
  });

  final String title;

  final String? url;
  final String? urlToImage;
  final DateTime publishedAt;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
