abstract class SignupEvent {}

class SignupAuthEvent extends SignupEvent {
  final String email;
  final String password;
  SignupAuthEvent({required this.email, required this.password});
}
