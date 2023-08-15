import 'package:counter_bloc/blocs/signup_bloc/signup_event.dart';
import 'package:counter_bloc/blocs/signup_bloc/signup_state.dart';
import 'package:counter_bloc/utils/firebase_exceptions.dart';
import 'package:counter_bloc/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum AuthState { initial, loading, authenticated, unauthenticated }

class SingupBloc extends Bloc<SignupEvent, AuthState> {
  final auth = FirebaseAuth.instance;
  SingupBloc() : super(AuthState.initial) {
    on<SignupAuthEvent>(userLogin);
  }

  void userLogin(SignupAuthEvent event, Emitter<AuthState> emitter) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
     
      print(auth.currentUser!.uid);

      emitter(AuthState.authenticated);
    }
    
    catch (e) {
      print("error");
      emitter(AuthState.unauthenticated);
    }
  }
}
