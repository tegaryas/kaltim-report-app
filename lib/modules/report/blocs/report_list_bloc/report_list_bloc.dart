import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/report/models/report_list_filter_model.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'report_list_event.dart';
part 'report_list_state.dart';

@injectable
class ReportListBloc extends Bloc<ReportListEvent, ReportListState> {
  final ReportRepositoryInterface reportRepository;
  final FirebaseCrashlytics firebaseCrashlytics;
  ReportListBloc(this.reportRepository, this.firebaseCrashlytics)
      : super(ReportListInitial()) {
    late PagingController<String, ReportModel> pagingController =
        PagingController(firstPageKey: "");

    ReportListFilterModel filter = const ReportListFilterModel(
      lastDocument: "",
      pageSize: 6,
    );

    const int pageSize = 6;

    void _fetchList(String lastDocumentKey) {
      add(ReportListFetch(lastDocumentKey));
    }

    on<ReportListFetch>((event, emit) async {
      try {
        final items = await reportRepository.getAllReportList(
          filter: filter.copyWith(
            pageSize: pageSize,
            lastDocument: event.lastDocumentKey,
          ),
        );

        final isLastPage = items.length < pageSize;

        if (isLastPage) {
          pagingController.appendLastPage(items);
        } else {
          final nextLastDocument = items.last.id;
          pagingController.appendPage(items, nextLastDocument);
        }
      } catch (e, s) {
        firebaseCrashlytics.recordError(e, s);
        pagingController.error = e;
      }
    });

    on<ReportListStarted>((event, emit) {
      try {
        if (pagingController.nextPageKey != null &&
            pagingController.nextPageKey! != "") {
          pagingController.refresh();
        }

        pagingController.removePageRequestListener(_fetchList);
        pagingController.addPageRequestListener(_fetchList);

        emit(ReportListSuccess(pagingController: pagingController));
      } catch (e, s) {
        firebaseCrashlytics.recordError(e, s);
        emit(ReportListFailed(e, s));
      }
    });
  }
}
