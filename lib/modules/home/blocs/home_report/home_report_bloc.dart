import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'home_report_event.dart';
part 'home_report_state.dart';

@injectable
class HomeReportBloc extends Bloc<HomeReportEvent, HomeReportState> {
  final ReportRepositoryInterface reportRepository;
  final FirebaseCrashlytics firebaseCrashlytics;
  HomeReportBloc(this.reportRepository, this.firebaseCrashlytics)
      : super(HomeReportInitial()) {
    on<HomeReportFetch>((event, emit) async {
      try {
        emit(HomeReportLoading());
        final res = await reportRepository.getCurrentUserReportHome();
        emit(HomeReportSuccess(data: res));
      } catch (e, s) {
        firebaseCrashlytics.recordError(e, s);
        emit(HomeReportFailed(e, s));
      }
    });
  }
}
