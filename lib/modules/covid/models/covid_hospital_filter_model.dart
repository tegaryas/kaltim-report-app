import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'covid_hospital_filter_model.g.dart';

@CopyWith(copyWithNull: true)
@JsonSerializable(includeIfNull: false)
class CovidHospitalFilterModel extends Equatable {
  final String? provinceid;
  final String? cityid;
  final int? type;

  const CovidHospitalFilterModel({this.provinceid, this.cityid, this.type = 1});

  @override
  List<Object?> get props => [provinceid, cityid, type];

  factory CovidHospitalFilterModel.fromJson(Map<String, dynamic> json) =>
      _$CovidHospitalFilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$CovidHospitalFilterModelToJson(this);
}
