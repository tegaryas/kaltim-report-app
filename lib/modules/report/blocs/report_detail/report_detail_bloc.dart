import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'report_detail_event.dart';
part 'report_detail_state.dart';

@injectable
class ReportDetailBloc extends Bloc<ReportDetailEvent, ReportDetailState> {
  final ReportRepositoryInterface reportRepository;

  ReportDetailBloc(
    this.reportRepository,
  ) : super(ReportDetailInitial()) {
    on<ReportDetailFetch>((event, emit) async {
      try {
        emit(ReportDetailLoading());
        final res = await reportRepository.getReportById(event.id);
        emit(ReportDetailSucces(data: res));
      } catch (e, s) {
        emit(ReportDetailFailed(e, s));
      }
    });
  }
}
