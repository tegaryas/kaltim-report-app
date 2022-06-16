part of 'report_bookmark_bloc.dart';

abstract class ReportBookmarkState extends Equatable {
  const ReportBookmarkState();

  @override
  List<Object> get props => [];
}

class ReportBookmarkInitial extends ReportBookmarkState {}

class ReportBookmarkLoading extends ReportBookmarkState {}

class ReportBookmarkFailed extends ReportBookmarkState {
  final Object e;
  final StackTrace s;

  const ReportBookmarkFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class ReportBookmarkExist extends ReportBookmarkState {}

class ReportBookmarkSuccessAdded extends ReportBookmarkState {}

class ReportBookmarkNotExist extends ReportBookmarkState {}
