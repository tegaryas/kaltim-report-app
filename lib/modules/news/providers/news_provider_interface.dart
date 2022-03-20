import 'package:kaltim_report/modules/news/models/news_filter_model.dart';
import 'package:kaltim_report/modules/news/models/news_model.dart';

abstract class NewsProviderInterface {
  Future<List<NewsModel>> getNews(NewsFilterModel filter);
}
