part of 'notification_send_bloc.dart';

abstract class NotificationSendEvent extends Equatable {
  const NotificationSendEvent();

  @override
  List<Object> get props => [];
}

class NotificationSendStarted extends NotificationSendEvent {}
