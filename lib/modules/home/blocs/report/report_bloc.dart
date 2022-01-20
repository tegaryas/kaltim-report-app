import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/home/models/report_model.dart';
import 'package:kaltim_report/modules/home/repositories/home_repository_interface.dart';

part 'report_event.dart';
part 'report_state.dart';

@injectable
class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final HomeRepositoryInterface homeRepository;
  StreamSubscription? _reportSubsription;
  ReportBloc({required this.homeRepository}) : super(ReportInitial()) {
    on<ReportEvent>((event, emit) {
      if (event is ReportFetching) {
        _reportSubsription?.cancel();
        try {
          emit(ReportLoading());
          homeRepository.getReportList().listen((event) {
            add(ReportUpdate(reports: event));
          });
        } catch (e) {
          emit(ReportFailed());
        }
      }
      if (event is ReportUpdate) {
        emit(ReportLoaded(reports: event.reports));
      }
    });
  }

  @override
  Future<void> close() {
    _reportSubsription?.cancel();
    return super.close();
  }
}
