part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationStartSuccess extends NotificationState {}

class NotificationStartFailure extends NotificationState {
  final Object e;
  final StackTrace s;

  const NotificationStartFailure(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class NotificationPostSuccess extends NotificationState {}

class NotificationPostFailure extends NotificationState {
  final Object e;
  final StackTrace s;

  const NotificationPostFailure(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class NotificationOpenUrl extends NotificationState {
  final String url;

  const NotificationOpenUrl(this.url);

  @override
  List<Object> get props => [url];
}

class NotificationOpenScreen extends NotificationState {
  final NotificationNavigationModel data;

  const NotificationOpenScreen(this.data);

  @override
  List<Object> get props => [data];
}

class NotificationFailure extends NotificationState {
  final Object e;
  final StackTrace s;

  const NotificationFailure(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}
