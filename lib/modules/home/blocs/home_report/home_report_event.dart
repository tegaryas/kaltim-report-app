part of 'home_report_bloc.dart';

abstract class HomeReportEvent extends Equatable {
  const HomeReportEvent();

  @override
  List<Object> get props => [];
}

class HomeReportFetch extends HomeReportEvent {}
