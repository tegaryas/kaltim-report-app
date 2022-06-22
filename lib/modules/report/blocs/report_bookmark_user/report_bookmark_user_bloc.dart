import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/report/models/report_list_filter_model.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'report_bookmark_user_event.dart';
part 'report_bookmark_user_state.dart';

@injectable
class ReportBookmarkUserBloc
    extends Bloc<ReportBookmarkUserEvent, ReportBookmarkUserState> {
  final ReportRepositoryInterface reportRepository;

  ReportBookmarkUserBloc(
    this.reportRepository,
  ) : super(ReportBookmarkUserInitial()) {
    late PagingController<String, ReportModel> pagingController =
        PagingController(firstPageKey: "");

    ReportListFilterModel filter = const ReportListFilterModel(
      lastDocument: "",
      pageSize: 6,
    );

    ReportStatusType? status;

    const int pageSize = 6;

    void _fetchList(String lastDocumentKey) {
      add(ReportBookmarkUserListFetch(lastDocumentKey));
    }

    on<ReportBookmarkUserListFetch>((event, emit) async {
      try {
        final items = await reportRepository.getBookmarkReport(filter.copyWith(
          pageSize: pageSize,
          lastDocument: event.lastDocumentKey,
          status: status,
        ));

        final isLastPage = items.length < pageSize;

        if (isLastPage) {
          pagingController.appendLastPage(items);
        } else {
          final nextLastDocument = items.last.id;
          pagingController.appendPage(items, nextLastDocument);
        }
      } catch (e) {
        pagingController.error = e;
      }
    });

    on<ReportBookmarkUserListStarted>((event, emit) {
      try {
        if (pagingController.nextPageKey != null &&
            pagingController.nextPageKey! != "") {
          pagingController.refresh();
        }

        status = event.status;

        pagingController.removePageRequestListener(_fetchList);
        pagingController.addPageRequestListener(_fetchList);

        emit(ReportBookmarkUserListSuccess(pagingController: pagingController));
      } catch (e, s) {
        emit(ReportBookmarkUserListFailed(e, s));
      }
    });
  }
}
