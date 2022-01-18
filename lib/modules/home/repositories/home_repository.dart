import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/home/models/report_model.dart';
import 'package:kaltim_report/modules/home/providers/home_provider_interface.dart';
import 'package:kaltim_report/modules/home/repositories/home_repository_interface.dart';

@Injectable(as: HomeRepositoryInterface)
class HomeRepository implements HomeRepositoryInterface {
  final HomeProviderInterface homeProvider;
  HomeRepository({required this.homeProvider});

  @override
  Stream<List<ReportModel>> getReportList() {
    return homeProvider.getReportList();
  }
}
