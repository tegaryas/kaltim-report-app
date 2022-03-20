part of 'news_list_new_bloc.dart';

abstract class NewsListNewEvent extends Equatable {
  const NewsListNewEvent();

  @override
  List<Object?> get props => [];
}

class NewsListNewFetch extends NewsListNewEvent {
  final int pageKey;

  const NewsListNewFetch(this.pageKey);

  @override
  List<Object> get props => [pageKey];
}

class NewsListNewStarted extends NewsListNewEvent {
  final NewsFilterModel? filter;
  final NewsCategory? category;

  const NewsListNewStarted({this.filter, this.category});

  @override
  List<Object?> get props => [filter, category];
}
