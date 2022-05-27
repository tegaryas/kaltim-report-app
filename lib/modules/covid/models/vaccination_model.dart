import 'package:json_annotation/json_annotation.dart';

part 'vaccination_model.g.dart';

@JsonSerializable()
class VaccinationModel {
  VaccinationModel({
    required this.totalsasaran,
    required this.sasaranvaksinsdmk,
    required this.sasaranvaksinlansia,
    required this.sasaranvaksinpetugaspublik,
    required this.vaksinasi1,
    required this.vaksinasi2,
    required this.lastUpdate,
  });

  int totalsasaran;
  int sasaranvaksinsdmk;
  int sasaranvaksinlansia;
  int sasaranvaksinpetugaspublik;
  int vaksinasi1;
  int vaksinasi2;
  DateTime lastUpdate;

  factory VaccinationModel.fromJson(Map<String, dynamic> json) =>
      _$VaccinationModelFromJson(json);

  Map<String, dynamic> toJson() => _$VaccinationModelToJson(this);
}
