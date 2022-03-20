import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/news/models/news_model.dart';
import 'package:kaltim_report/modules/news/models/news_filter_model.dart';
import 'package:kaltim_report/modules/news/providers/news_provider_interface.dart';
import 'package:kaltim_report/modules/news/repositories/news_repository_interface.dart';

@Injectable(as: NewsRepositoryInterface)
class NewsRepository implements NewsRepositoryInterface {
  final NewsProviderInterface newsProvider;

  NewsRepository(this.newsProvider);
  @override
  Future<List<NewsModel>> getNews({required NewsFilterModel filter}) {
    return newsProvider.getNews(filter);
  }
}
