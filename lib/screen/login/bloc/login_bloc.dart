import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

enum AuthState { initial, authenticated, unauthenticated }

class LoginBloc extends Bloc<LoginEvent, AuthState> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  LoginBloc() : super(AuthState.initial)
  {
    on<LogingAuthEvent>(login);
    on<LogoutAuthEvent>(logOut);

  }

  void logOut(LogoutAuthEvent event, Emitter<AuthState> emitter)async
  {
    try
    {
      await auth.signOut();
      emitter(AuthState.unauthenticated);

    }
    catch(e)
    {
           emitter(AuthState.unauthenticated);

    
    }
  }

  void login(LogingAuthEvent event, Emitter<AuthState> emitter)async
  {
    try {
        await auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        print("some error");
        print(auth.currentUser!.uid);
        emitter(AuthState.authenticated);
      } catch (e) {
        emitter(AuthState.unauthenticated);
      }
  }

  // @override
  // Stream<AuthState> mapEventToState(LogingAuthEvent event) async* {
  //   if (event is LogingAuthEvent) {
  //     try {
  //       await auth.createUserWithEmailAndPassword(
  //         email: event.email,
  //         password: event.password,
  //       );
  //       print("user created");
  //       print(auth.currentUser!.uid);
  //       yield AuthState.authenticated;
  //     } catch (e) {
  //       print("some erorr$e");
  //       yield AuthState.unauthenticated;
  //     }
  //   }

    // do letter
    // else
    // {

    // }
 // }

}
