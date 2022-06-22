part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthUninitalized extends AuthState {}

class AuthLoading extends AuthState {}

class AuthUnauthenticated extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthAuthenticatedAsAdmin extends AuthState {}

class AuthFailure extends AuthState {
  final Object e;
  final StackTrace s;

  AuthFailure(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class AuthExpired extends AuthState {}
