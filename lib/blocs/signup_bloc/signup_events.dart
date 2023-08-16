abstract class SignupEvent{}

class SignupAuthEvent extends SignupEvent{

 String name;
 String email;
 String phoneNumber;
 String password;

 SignupAuthEvent({required this.email,required this.name,required this.password,required this.phoneNumber});


}