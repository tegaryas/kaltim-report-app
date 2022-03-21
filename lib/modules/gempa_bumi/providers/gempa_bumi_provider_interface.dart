import 'package:kaltim_report/modules/gempa_bumi/models/gempa_bumi_model.dart';

abstract class GempaBumiProviderInterface {
  Future<GempaBumiModel> getCurrentEarthQuake();

  Future<List<GempaBumiModel>> getLastDayEarthQuake();

  Future<List<GempaBumiModel>> getAllEarthQuake();
}
