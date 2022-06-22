part of 'notification_send_bloc.dart';

abstract class NotificationSendState extends Equatable {
  const NotificationSendState();

  @override
  List<Object> get props => [];
}

class NotificationSendInitial extends NotificationSendState {}

class NotificationSendLoading extends NotificationSendState {}

class NotificationSendFailed extends NotificationSendState {
  final Object e;
  final StackTrace s;

  const NotificationSendFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class NotificationSendSuccess extends NotificationSendState {}
