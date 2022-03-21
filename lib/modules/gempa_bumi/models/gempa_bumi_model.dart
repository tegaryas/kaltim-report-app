import 'package:json_annotation/json_annotation.dart';

part 'gempa_bumi_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class GempaBumiModel {
  GempaBumiModel({
    required this.tanggal,
    required this.jam,
    required this.dateTime,
    required this.coordinates,
    required this.lintang,
    required this.bujur,
    required this.magnitude,
    required this.kedalaman,
    required this.wilayah,
    this.potensi,
    required this.dirasakan,
  });

  String tanggal;
  String jam;
  DateTime dateTime;
  String coordinates;
  String lintang;
  String bujur;
  String magnitude;
  String kedalaman;
  String wilayah;
  String? potensi;
  String dirasakan;

  factory GempaBumiModel.fromJson(Map<String, dynamic> json) =>
      _$GempaBumiModelFromJson(json);

  Map<String, dynamic> toJson() => _$GempaBumiModelToJson(this);
}
