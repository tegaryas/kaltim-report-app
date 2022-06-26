import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/auth/repositories/auth_repository_interface.dart';
import 'package:kaltim_report/modules/report/models/report_discussion_model.dart';
import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'report_discussion_event.dart';
part 'report_discussion_state.dart';

@injectable
class ReportDiscussionBloc
    extends Bloc<ReportDiscussionEvent, ReportDiscussionState> {
  final ReportRepositoryInterface reportRepository;
  final AuthRepositoryInterface authRepository;

  StreamSubscription? _discussionSubsription;
  ReportDiscussionBloc(this.reportRepository, this.authRepository)
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
      final user = authRepository.loggedUser;
      emit(ReportDiscussionListSuccess(event.data, user.uid));
    });
  }

  @override
  Future<void> close() {
    _discussionSubsription?.cancel();
    return super.close();
  }
}
