import 'package:json_annotation/json_annotation.dart';

part 'report_category_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ReportCategoryModel {
  final int id;
  final String name;
  final String? imageUrl;

  ReportCategoryModel({
    required this.id,
    required this.name,
    this.imageUrl,
  });

  factory ReportCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ReportCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportCategoryModelToJson(this);
}
