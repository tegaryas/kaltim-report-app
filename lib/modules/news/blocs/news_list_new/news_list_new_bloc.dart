import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/news/models/news_filter_model.dart';
import 'package:kaltim_report/modules/news/models/news_model.dart';
import 'package:kaltim_report/modules/news/repositories/news_repository_interface.dart';
import 'package:kaltim_report/services/remote_config_service/remote_config_service_interface.dart';

part 'news_list_new_event.dart';
part 'news_list_new_state.dart';

@injectable
class NewsListNewBloc extends Bloc<NewsListNewEvent, NewsListNewState> {
  final NewsRepositoryInterface newsRepository;
  final RemoteConfigServiceInterface remoteConfigService;
  NewsListNewBloc(this.newsRepository, this.remoteConfigService)
      : super(NewsListNewInitial()) {
    late final PagingController<int, NewsModel> pagingController =
        PagingController(firstPageKey: 0);

    const int _pageSize = 40;

    NewsCategory? category;

    NewsFilterModel filter = const NewsFilterModel(
      apiKey: "",
      country: 'id',
      pageSize: 40,
      page: 0,
    );

    void _fetchList(int pageOffset) {
      add(NewsListNewFetch(pageOffset));
    }

    on<NewsListNewFetch>((event, emit) async {
      try {
        final newsApiKey = await remoteConfigService.getString('news_api_key');

        final items = await newsRepository.getNews(
          filter: filter.copyWith(
            apiKey: newsApiKey,
            country: 'id',
            pageSize: _pageSize,
            page: event.pageKey,
            category: category,
          ),
        );

        final isLastPage = items.length < _pageSize;

        if (isLastPage) {
          pagingController.appendLastPage(items);
        } else {
          final nextPageKey = 1 + event.pageKey;
          pagingController.appendPage(items, nextPageKey);
        }
      } catch (e) {
        pagingController.error = e;
      }
    });

    on<NewsListNewStarted>((event, emit) {
      try {
        if (pagingController.nextPageKey != null &&
            pagingController.nextPageKey! != 0) {
          pagingController.refresh();
        }

        category = event.category;

        pagingController.removePageRequestListener(_fetchList);
        pagingController.addPageRequestListener(_fetchList);

        emit(NewsListNewSuccess(pagingController: pagingController));
      } catch (e, s) {
        emit(NewsListNewFailed(e, s));
      }
    });
  }
}
