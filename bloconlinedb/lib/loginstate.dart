import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable
{
  @override

  List<Object?> get props => [];
}
class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState
{
  String message;
  LoginSuccess({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class LoginFailure extends LoginState
{
  String error;
  LoginFailure({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}