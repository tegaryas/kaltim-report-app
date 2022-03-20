import 'package:kaltim_report/modules/news/models/news_filter_model.dart';
import 'package:kaltim_report/modules/news/models/news_model.dart';

abstract class NewsRepositoryInterface {
  Future<List<NewsModel>> getNews({required NewsFilterModel filter});
}
