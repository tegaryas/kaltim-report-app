part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class NotificationStarted extends NotificationEvent {}

class NotificationOpened extends NotificationEvent {
  final NotificationPayloadModel model;

  const NotificationOpened(this.model);

  @override
  List<Object> get props => [model];
}
