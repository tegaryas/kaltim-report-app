part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginStart extends LoginEvent {
  final String email;
  final String password;
  const LoginStart({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginStartWithGoogle extends LoginEvent {}
