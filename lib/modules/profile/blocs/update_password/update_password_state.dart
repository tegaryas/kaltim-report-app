part of 'update_password_bloc.dart';

abstract class UpdatePasswordState extends Equatable {
  const UpdatePasswordState();

  @override
  List<Object> get props => [];
}

class UpdatePasswordInitial extends UpdatePasswordState {}

class UpdatePasswordLoading extends UpdatePasswordState {}

class UpdatePasswordFailed extends UpdatePasswordState {
  final String e;

  const UpdatePasswordFailed({required this.e});

  @override
  List<Object> get props => [e];
}

class UpdatePasswordSuccess extends UpdatePasswordState {}
