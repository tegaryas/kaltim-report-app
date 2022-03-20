import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/constant/api_key.dart';
import 'package:kaltim_report/modules/news/models/news_filter_model.dart';
import 'package:kaltim_report/modules/news/models/news_model.dart';
import 'package:kaltim_report/modules/news/repositories/news_repository_interface.dart';

part 'news_list_new_event.dart';
part 'news_list_new_state.dart';

@injectable
class NewsListNewBloc extends Bloc<NewsListNewEvent, NewsListNewState> {
  final NewsRepositoryInterface newsRepository;
  NewsListNewBloc(this.newsRepository) : super(NewsListNewInitial()) {
    late final PagingController<int, NewsModel> pagingController =
        PagingController(firstPageKey: 1);

    const int _pageSize = 10;

    NewsCategory? category;

    NewsFilterModel filter = const NewsFilterModel(
      apiKey: ApiKey.newsApiKey,
      country: 'id',
      pageSize: 10,
      page: 1,
    );

    void _fetchList(int pageOffset) {
      add(NewsListNewFetch(pageOffset));
    }

    on<NewsListNewFetch>((event, emit) async {
      try {
        final items = await newsRepository.getNews(
          filter: filter.copyWith(
            apiKey: ApiKey.newsApiKey,
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
