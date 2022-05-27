import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/covid/models/models.dart';
import 'package:kaltim_report/modules/covid/providers/covid_provider_interface.dart';
import 'package:kaltim_report/modules/covid/repositories/covid_repository_interface.dart';

@Injectable(as: CovidRepositoryInterface)
class CovidRepository implements CovidRepositoryInterface {
  final CovidProviderInterface covidProvider;

  CovidRepository(this.covidProvider);

  @override
  Future<List<CovidPlaceModel>> getCitiesList() {
    return covidProvider.getProvincesList();
  }

  @override
  Future<List<CovidPlaceModel>> getProvincesList() {
    // TODO: implement getProvincesList
    throw UnimplementedError();
  }

  @override
  Future<VaccinationModel> getVaccinationData() {
    return covidProvider.getVaccinationData();
  }
}
