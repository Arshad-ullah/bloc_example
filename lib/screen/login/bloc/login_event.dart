part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LogingAuthEvent extends LoginEvent
{
   final String email;
  final String password;
  LogingAuthEvent({required this.email,required this.password});
}

class LogoutAuthEvent extends LoginEvent
{}
