part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordFailed extends ResetPasswordState {
  final String errorMessage;

  const ResetPasswordFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class ResetPasswordSucess extends ResetPasswordState {
  final String email;

  const ResetPasswordSucess({required this.email});

  @override
  List<Object> get props => [email];
}
