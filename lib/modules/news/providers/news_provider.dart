import 'package:injectable/injectable.dart';
import 'package:kaltim_report/constant/api_path.dart';
import 'package:kaltim_report/modules/news/models/news_model.dart';
import 'package:kaltim_report/modules/news/models/news_filter_model.dart';
import 'package:kaltim_report/modules/news/providers/news_provider_interface.dart';
import 'package:dio/dio.dart';

@Injectable(as: NewsProviderInterface)
class NewsProvider implements NewsProviderInterface {
  final Dio _dio;

  NewsProvider(this._dio);

  @override
  Future<List<NewsModel>> getNews(NewsFilterModel filter) async {
    final res =
        await _dio.get(ApiPath.newsApiPath, queryParameters: filter.toJson());

    return (res.data['articles'] as List<dynamic>)
        .map((e) => NewsModel.fromJson(e))
        .toList();
  }
}
