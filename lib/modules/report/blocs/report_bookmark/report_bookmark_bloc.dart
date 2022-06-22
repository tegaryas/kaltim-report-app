import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'report_bookmark_event.dart';
part 'report_bookmark_state.dart';

@injectable
class ReportBookmarkBloc
    extends Bloc<ReportBookmarkEvent, ReportBookmarkState> {
  final ReportRepositoryInterface reportRepository;

  ReportBookmarkBloc(this.reportRepository) : super(ReportBookmarkInitial()) {
    on<ReportBookmarkAdd>((event, emit) async {
      await reportRepository.addBookmarkReport(event.report);
    });

    on<ReportBookmarkRemove>((event, emit) async {
      await reportRepository.removeBookmarkReport(event.report);
    });

    on<ReportBookmarkIsAdded>((event, emit) async {
      try {
        emit(ReportBookmarkLoading());
        final res = await reportRepository.isAlreadyBookmark(event.id);
        if (res == true) {
          emit(ReportBookmarkExist());
        } else {
          emit(ReportBookmarkNotExist());
        }
      } catch (e, s) {
        emit(ReportBookmarkFailed(e, s));
      }
    });
  }
}
