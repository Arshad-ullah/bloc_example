import 'package:counter_bloc/blocs/signin_bloc/signin_event.dart';
import 'package:counter_bloc/blocs/signin_bloc/signin_state.dart';
import 'package:counter_bloc/screen/home/home_screen.dart';
import 'package:counter_bloc/utils/firebase_exceptions.dart';
import 'package:counter_bloc/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

enum AuthState {
  initial,
  loading,
}

class SinginBloc extends Bloc<SigninEvent, AuthState> {
  final auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SinginBloc() : super(AuthState.initial) {
    print("constrcutor is called");
    on<SigninAuthEvent>(userLogin);
  }

  void userLogin(SigninAuthEvent event, Emitter<AuthState> emitter) async {
    try {
      emitter(AuthState.loading);
      await auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      print(auth.currentUser!.uid);
      FlutterTost.showToast('login successfully');
      emitter(AuthState.initial);
      Get.to(() => const HomeScreen());
      emailController.clear();
      passwordController.clear();

      // emitter(AuthState.authenticated);
    } on FirebaseException catch (e) {
      print("eror code:" + e.code);
      // FlutterTost.showToast(ExceptionHandler.signUpException(e.code));
      FlutterTost.showToast(ExceptionHandler.loginException(e.code));
      emitter(AuthState.initial);
    } catch (e) {
      emitter(AuthState.initial);
      FlutterTost.showToast(e.toString());
      print("error");
      // emitter(AuthState.unauthenticated);
    }
  }
}
