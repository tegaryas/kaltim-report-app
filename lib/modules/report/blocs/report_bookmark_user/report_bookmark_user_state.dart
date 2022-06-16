part of 'report_bookmark_user_bloc.dart';

abstract class ReportBookmarkUserState extends Equatable {
  const ReportBookmarkUserState();

  @override
  List<Object> get props => [];
}

class ReportBookmarkUserInitial extends ReportBookmarkUserState {}

class ReportBookmarkUserListLoading extends ReportBookmarkUserState {}

class ReportBookmarkUserListSuccess extends ReportBookmarkUserState {
  final PagingController<String, ReportModel> pagingController;

  const ReportBookmarkUserListSuccess({required this.pagingController});

  @override
  List<Object> get props => [pagingController];
}

class ReportBookmarkUserListFailed extends ReportBookmarkUserState {
  final Object e;
  final StackTrace s;

  const ReportBookmarkUserListFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}
