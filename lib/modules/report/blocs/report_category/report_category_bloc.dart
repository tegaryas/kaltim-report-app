import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/report/models/report_category_model.dart';
import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'report_category_event.dart';
part 'report_category_state.dart';

@injectable
class ReportCategoryBloc
    extends Bloc<ReportCategoryEvent, ReportCategoryState> {
  final ReportRepositoryInterface reportRepository;
  final FirebaseCrashlytics firebaseCrashlytics;
  ReportCategoryBloc(this.reportRepository, this.firebaseCrashlytics)
      : super(ReportCategoryInitial()) {
    on<ReportCategoryFetch>((event, emit) async {
      try {
        emit(ReportCategoryLoading());
        final res = await reportRepository.getReportCategories();
        emit(ReportCategorySuccess(data: res));
      } catch (e, s) {
        firebaseCrashlytics.recordError(e, s);
        emit(ReportCategoryFailed(e, s));
      }
    });
  }
}
