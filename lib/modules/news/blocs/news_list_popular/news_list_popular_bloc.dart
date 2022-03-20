import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'news_list_popular_event.dart';
part 'news_list_popular_state.dart';

class NewsListPopularBloc extends Bloc<NewsListPopularEvent, NewsListPopularState> {
  NewsListPopularBloc() : super(NewsListPopularInitial()) {
    on<NewsListPopularEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
