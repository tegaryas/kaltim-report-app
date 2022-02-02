part of 'update_password_bloc.dart';

abstract class UpdatePasswordEvent extends Equatable {
  const UpdatePasswordEvent();

  @override
  List<Object> get props => [];
}

class UpdatePasswordUser extends UpdatePasswordEvent {
  final String newPassword;

  const UpdatePasswordUser(this.newPassword);

  @override
  List<Object> get props => [newPassword];
}
