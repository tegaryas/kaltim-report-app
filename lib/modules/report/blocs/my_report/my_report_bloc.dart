import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/home/models/report_model.dart';
import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'my_report_event.dart';
part 'my_report_state.dart';

@injectable
class MyReportBloc extends Bloc<MyReportEvent, MyReportState> {
  final ReportRepositoryInterface reportRepository;
  MyReportBloc(this.reportRepository) : super(MyReportInitial()) {
    on<MyReportEvent>((event, emit) {
      if (event is FetchMyReportList) {
        try {
          emit(MyReportLoading());
          reportRepository.getCurrentUserReport().listen((event) {
            add(MyReportListUpdate(event));
          });
        } catch (e) {
          emit(MyReportFailed());
        }
      }
      if (event is MyReportListUpdate) {
        emit(MyReportLoaded(event.myReports));
      }
    });
  }
}
