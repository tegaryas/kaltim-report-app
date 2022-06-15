import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/report/models/report_list_filter_model.dart';
import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'report_export_event.dart';
part 'report_export_state.dart';

@injectable
class ReportExportBloc extends Bloc<ReportExportEvent, ReportExportState> {
  final ReportRepositoryInterface reportRepository;
  final FirebaseCrashlytics firebaseCrashlytics;
  ReportExportBloc(this.reportRepository, this.firebaseCrashlytics)
      : super(ReportExportInitial()) {
    on<ReportExportStart>((event, emit) async {
      // TODO: implement event handler
      try {
        emit(ReportExportLoading());
        final res = await reportRepository;
        emit(ReportExportSuccess());
      } catch (e, s) {
        firebaseCrashlytics.recordError(e, s);
        emit(ReportExportFailed(e, s));
      }
    });
  }
}
