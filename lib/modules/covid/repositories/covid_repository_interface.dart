import 'package:kaltim_report/modules/covid/models/models.dart';

abstract class CovidRepositoryInterface {
  Future<List<CovidPlaceModel>> getProvincesList();

  Future<List<CovidPlaceModel>> getCitiesList();

  Future<VaccinationModel> getVaccinationData();
}
