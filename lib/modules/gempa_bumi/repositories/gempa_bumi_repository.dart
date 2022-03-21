import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/gempa_bumi/models/gempa_bumi_model.dart';
import 'package:kaltim_report/modules/gempa_bumi/providers/gempa_bumi_provider_interface.dart';
import 'package:kaltim_report/modules/gempa_bumi/repositories/gempa_bumi_repository_interface.dart';

@Injectable(as: GempaBumiRepositoryInterface)
class GempaBumiRepository implements GempaBumiRepositoryInterface {
  final GempaBumiProviderInterface gempaBumiProvider;

  GempaBumiRepository(this.gempaBumiProvider);
  @override
  Future<List<GempaBumiModel>> getAllEarthQuake() {
    return gempaBumiProvider.getAllEarthQuake();
  }

  @override
  Future<GempaBumiModel> getCurrentEarthQuake() {
    return gempaBumiProvider.getCurrentEarthQuake();
  }

  @override
  Future<List<GempaBumiModel>> getLastDayEarthQuake() {
    return gempaBumiProvider.getLastDayEarthQuake();
  }
}
