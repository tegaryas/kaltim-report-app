import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/report/models/report_discussion_model.dart';
import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'report_discussion_event.dart';
part 'report_discussion_state.dart';

@injectable
class ReportDiscussionBloc
    extends Bloc<ReportDiscussionEvent, ReportDiscussionState> {
  final ReportRepositoryInterface reportRepository;

  StreamSubscription? _discussionSubsription;
  ReportDiscussionBloc(this.reportRepository)
      : super(ReportDiscussionInitial()) {
    on<ReportDiscussionListFetch>((event, emit) {
      _discussionSubsription?.cancel();
      try {
        emit(ReportDiscussionListLoading());
        _discussionSubsription =
            reportRepository.getReportDiscussions(event.id).listen((event) {
          add(ReportDiscussionListUpdate(event));
        });
      } catch (e, s) {
        emit(ReportDiscussionListFailed(e, s));
      }
    });

    on<ReportDiscussionListUpdate>((event, emit) {
      emit(ReportDiscussionListSuccess(event.data));
    });
  }

  @override
  Future<void> close() {
    _discussionSubsription?.cancel();
    return super.close();
  }
}
