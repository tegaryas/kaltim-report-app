import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/constant/api_path.dart';
import 'package:kaltim_report/modules/gempa_bumi/models/gempa_bumi_model.dart';
import 'package:kaltim_report/modules/gempa_bumi/providers/gempa_bumi_provider_interface.dart';

import '../models/gempa_bumi_model.dart';

@Injectable(as: GempaBumiProviderInterface)
class GempaBumiProvider implements GempaBumiProviderInterface {
  final Dio dio;

  GempaBumiProvider(this.dio);
  @override
  Future<List<GempaBumiModel>> getAllEarthQuake() async {
    final res = await dio.get(ApiPath.daftarGempaBumi);

    return (res.data["Infogempa"]["gempa"] as List<dynamic>)
        .map((e) => GempaBumiModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<GempaBumiModel> getCurrentEarthQuake() async {
    final res = await dio.get(ApiPath.gempaBumiTerbaru);

    return GempaBumiModel.fromJson(
        res.data["Infogempa"]["gempa"] as Map<String, dynamic>);
  }

  @override
  Future<List<GempaBumiModel>> getLastDayEarthQuake() async {
    final res = await dio.get(ApiPath.gempaBumiTerkini);

    return (res.data["Infogempa"]["gempa"] as List<dynamic>)
        .map((e) => GempaBumiModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
