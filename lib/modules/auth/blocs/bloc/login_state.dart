part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  final Object error;
  final StackTrace? stackTrace;
  const LoginFailed({required this.error, this.stackTrace});

  @override
  List<Object?> get props => [error, stackTrace];
}

class LoginFailedExpected extends LoginState {
  final String error;
  final StackTrace? stackTrace;
  const LoginFailedExpected({required this.error, this.stackTrace});

  @override
  List<Object?> get props => [error, stackTrace];
}

/// State when user registered in FirebaseAuth
/// but not registered yet in our server
class LoginNeedRegistrationGoogle extends LoginState {
  final String email;
  final String username;
  final String? name;

  const LoginNeedRegistrationGoogle(
      {required this.email, required this.username, this.name});

  @override
  List<Object?> get props => [email, username, name];
}

class LoginNeedRegistrationApple extends LoginState {
  final String email;
  final String username;
  final String? name;

  const LoginNeedRegistrationApple(
      {required this.email, required this.username, this.name});

  @override
  List<Object?> get props => [email, username, name];
}

class LoginAborted extends LoginState {}

class LoginInvalidEmail extends LoginState {}

class LoginUserNotFound extends LoginState {}

class LoginUserDisabled extends LoginState {}

/// Error comes from BE
class LoginIdTokenInvalid extends LoginState {}

/// Error comes from BE
class LoginEmailNotRegistered extends LoginState {}

class LoginWrongPassword extends LoginState {
  final String email;

  const LoginWrongPassword({required this.email});

  @override
  List<Object> get props => [email];
}
