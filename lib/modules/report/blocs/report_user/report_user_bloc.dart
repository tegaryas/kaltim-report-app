import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';

import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'report_user_event.dart';
part 'report_user_state.dart';

@injectable
class ReportUserBloc extends Bloc<ReportUserEvent, ReportUserState> {
  StreamSubscription? _myReportSubscription;
  final ReportRepositoryInterface reportRepository;

  ReportUserBloc(
    this.reportRepository,
  ) : super(ReportUserInitial()) {
    on<FetchReportUserList>((event, emit) {
      _myReportSubscription?.cancel();
      try {
        emit(ReportUserLoading());
        _myReportSubscription =
            reportRepository.getCurrentUserReport().listen((event) {
          add(ReportUserListUpdate(event));
        });
      } catch (e) {
        emit(ReportUserFailed());
      }
    });

    on<ReportUserListUpdate>((event, emit) {
      emit(ReportUserLoaded(event.myReports));
    });
  }

  @override
  Future<void> close() {
    _myReportSubscription?.cancel();
    return super.close();
  }
}
