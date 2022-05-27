import 'package:kaltim_report/modules/covid/models/models.dart';

abstract class CovidProviderInterface {
  Future<List<CovidPlaceModel>> getProvincesList();

  Future<List<CovidPlaceModel>> getCitiesList();

  Future<VaccinationModel> getVaccinationData();
}
