import 'package:kaltim_report/modules/gempa_bumi/models/gempa_bumi_model.dart';

abstract class GempaBumiRepositoryInterface {
  Future<GempaBumiModel> getCurrentEarthQuake();

  Future<List<GempaBumiModel>> getLastDayEarthQuake();

  Future<List<GempaBumiModel>> getAllEarthQuake();
}
