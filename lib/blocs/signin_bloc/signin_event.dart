abstract class SigninEvent {}

class SigninAuthEvent extends SigninEvent {
  final String email;
  final String password;
  SigninAuthEvent({required this.email, required this.password});
}

class LogoutAuthEvent extends SigninEvent{}
