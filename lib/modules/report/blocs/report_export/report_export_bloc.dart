import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/report/models/report_export_form_model.dart';

import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'report_export_event.dart';
part 'report_export_state.dart';

@injectable
class ReportExportBloc extends Bloc<ReportExportEvent, ReportExportState> {
  final ReportRepositoryInterface reportRepository;

  ReportExportBloc(
    this.reportRepository,
  ) : super(ReportExportInitial()) {
    on<ReportExportStart>((event, emit) async {
      try {
        emit(ReportExportLoading());
        final now = DateTime.now();
        final nowDate = DateTime(now.year, now.month, now.day);
        late final DateTime startDate;
        late final DateTime endDate;
        switch (event.period) {
          case ReportExportPeriod.last_2Week:
            endDate = nowDate;
            startDate = endDate.subtract(const Duration(days: 14));
            break;
          case ReportExportPeriod.lastMonth:
            endDate = nowDate;
            startDate = DateTime(endDate.year, endDate.month - 1, endDate.day);
            break;
          default:
            startDate = event.startDate!;
            endDate = event.endDate!;
        }
        await reportRepository.exportReport(
          ReportExportFormModel(
            email: event.email,
            startDate: startDate,
            endDate: endDate,
            format: event.exportFormat,
          ),
        );

        emit(ReportExportSuccess());
      } catch (e, s) {
        emit(ReportExportFailed(e, s));
      }
    });
  }
}
