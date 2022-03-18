import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report_list_filter_model.g.dart';

@CopyWith(copyWithNull: true)
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ReportListFilterModel extends Equatable {
  final String lastDocument;
  final int pageSize;

  const ReportListFilterModel({
    required this.lastDocument,
    required this.pageSize,
  });

  factory ReportListFilterModel.fromJson(Map<String, dynamic> json) =>
      _$ReportListFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportListFilterModelToJson(this);

  @override
  List<Object?> get props => [lastDocument, pageSize];
}
