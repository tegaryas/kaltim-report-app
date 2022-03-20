import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';

import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'my_report_event.dart';
part 'my_report_state.dart';

@injectable
class MyReportBloc extends Bloc<MyReportEvent, MyReportState> {
  StreamSubscription? _myReportSubscription;
  final ReportRepositoryInterface reportRepository;
  final FirebaseCrashlytics firebaseCrashlytics;
  MyReportBloc(this.reportRepository, this.firebaseCrashlytics)
      : super(MyReportInitial()) {
    on<FetchMyReportList>((event, emit) {
      _myReportSubscription?.cancel();
      try {
        emit(MyReportLoading());
        _myReportSubscription =
            reportRepository.getCurrentUserReport().listen((event) {
          add(MyReportListUpdate(event));
        });
      } catch (e, s) {
        firebaseCrashlytics.recordError(e, s);
        emit(MyReportFailed());
      }
    });

    on<MyReportListUpdate>((event, emit) {
      emit(MyReportLoaded(event.myReports));
    });
  }

  @override
  Future<void> close() {
    _myReportSubscription?.cancel();
    return super.close();
  }
}
