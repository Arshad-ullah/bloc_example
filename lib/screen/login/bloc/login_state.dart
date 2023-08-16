part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {
  
}

class LoginAuthState extends LoginState
{
  String email;
  LoginAuthState({required this.email});
}



