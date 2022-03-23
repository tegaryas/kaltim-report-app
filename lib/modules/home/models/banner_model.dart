import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BannerModel {
  final String imageUrl;
  final String? route;
  final String path;

  BannerModel({
    required this.imageUrl,
    this.route,
    required this.path,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}
