import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_filter_model.g.dart';

enum NewsCategory {
  business,
  technology,
  health,
  sports,
  unknwon,
}

@CopyWith(copyWithNull: true)
@JsonSerializable(includeIfNull: false)
class NewsFilterModel extends Equatable {
  final String apiKey;
  final String country;
  final int pageSize;
  final int page;
  @JsonKey(defaultValue: null)
  final NewsCategory? category;
  final String? q;

  const NewsFilterModel({
    required this.apiKey,
    required this.country,
    required this.pageSize,
    required this.page,
    this.category,
    this.q,
  });

  factory NewsFilterModel.fromJson(Map<String, dynamic> json) =>
      _$NewsFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsFilterModelToJson(this);

  @override
  List<Object?> get props => [page, pageSize, apiKey, country, category, q];
}
