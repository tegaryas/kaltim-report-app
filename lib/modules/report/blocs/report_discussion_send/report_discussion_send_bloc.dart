import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/auth/repositories/auth_repository_interface.dart';
import 'package:kaltim_report/modules/report/models/report_discussion_model.dart';
import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'report_discussion_send_event.dart';
part 'report_discussion_send_state.dart';

@injectable
class ReportDiscussionSendBloc
    extends Bloc<ReportDiscussionSendEvent, ReportDiscussionSendState> {
  final ReportRepositoryInterface reportRepository;
  final AuthRepositoryInterface authRepositoryInterface;

  ReportDiscussionSendBloc(this.reportRepository, this.authRepositoryInterface)
      : super(ReportDiscussionSendInitial()) {
    on<ReportDiscussionSendForm>((event, emit) async {
      try {
        emit(ReportDiscussionSendLoading());
        final res = await authRepositoryInterface.getUserCurrentData();

        await reportRepository.sendReportDiscussion(
          ReportDiscussionModel(
            comment: event.form.comment,
            dateInput: event.form.dateInput,
            reportId: event.form.reportId,
            userId: res.idToken,
            userName: res.name,
          ),
        );
        emit(ReportDiscussionSendSuccess());
      } catch (e, s) {
        emit(ReportDiscussionSendFailed(e, s));
      }
    });
  }
}
