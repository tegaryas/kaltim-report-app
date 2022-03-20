part of 'news_list_new_bloc.dart';

abstract class NewsListNewState extends Equatable {
  const NewsListNewState();

  @override
  List<Object> get props => [];
}

class NewsListNewInitial extends NewsListNewState {}

class NewsListNewLoading extends NewsListNewState {}

class NewsListNewSuccess extends NewsListNewState {
  final PagingController<int, NewsModel> pagingController;

  const NewsListNewSuccess({required this.pagingController});

  @override
  List<Object> get props => [pagingController];
}

class NewsListNewFailed extends NewsListNewState {
  final Object e;
  final StackTrace s;

  const NewsListNewFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}
