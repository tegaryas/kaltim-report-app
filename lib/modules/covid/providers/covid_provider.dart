import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/constant/constant.dart';
import 'package:kaltim_report/modules/covid/models/models.dart';

import 'package:kaltim_report/modules/covid/providers/covid_provider_interface.dart';

@Injectable(as: CovidProviderInterface)
class CovidProvider implements CovidProviderInterface {
  final Dio dio;

  CovidProvider(this.dio);

  @override
  Future<List<CovidPlaceModel>> getCitiesList() async {
    final res = await dio.get(ApiPath.getRSprovince);

    return (res.data["provinces"] as List<dynamic>)
        .map((e) => CovidPlaceModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<CovidPlaceModel>> getProvincesList() async {
    final res = await dio.get(ApiPath.getRScities);

    return (res.data["cities"] as List<dynamic>)
        .map((e) => CovidPlaceModel.fromJson(e))
        .toList();
  }

  @override
  Future<VaccinationModel> getVaccinationData() async {
    final res = await dio.get(ApiPath.vaksin);

    return VaccinationModel.fromJson(res.data as Map<String, dynamic>);
  }
}
