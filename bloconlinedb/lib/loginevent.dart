import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable
{

}
class LoginButtonPressedEvent extends LoginEvent
{
  final String email;
  final String password;

  LoginButtonPressedEvent({required this.email,required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email,password];

}