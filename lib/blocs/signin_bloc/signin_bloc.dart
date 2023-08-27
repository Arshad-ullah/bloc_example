import 'dart:async';

import 'package:counter_bloc/blocs/signin_bloc/signin_event.dart';
import 'package:counter_bloc/blocs/signin_bloc/signin_state.dart';
import 'package:counter_bloc/blocs/signup_bloc/signup_state.dart';
import 'package:counter_bloc/screen/home/home_screen.dart';
import 'package:counter_bloc/screen/singin/signin_screen.dart';
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

class SinginBloc extends Bloc<SigninEvent, SigninState> {
  final auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SinginBloc() : super(InitialState()) {
    print("constrcutor is called");
    // on<LoadingEvent>(loading);
    on<SigninAuthEvent>(userLogin);
    on<LogoutAuthEvent>(logOut);
    

    // emit(LoadingState());
  }

//log out

  void logOut(LogoutAuthEvent event, Emitter<SigninState> emitter) async {
    try {
      emitter(LoadingState());
      await auth.signOut();
      FlutterTost.showToast("User logout");
      emitter(InitialState());
      Get.offAll(() => const SigninScreen());
    } catch (e) {
      FlutterTost.showToast(e.toString());
      emitter(InitialState());
    }
  }

  void userLogin(SigninAuthEvent event, Emitter<SigninState> emitter) async {
    try {
      emitter(LoadingState());
      await auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      print(auth.currentUser!.uid);
      FlutterTost.showToast('login successfully');
      emitter(NavigateToHomeState());
      // emitter(InitialState());
      Get.to(() => const HomeScreen());
      emailController.clear();
      passwordController.clear();

      // emitter(AuthState.authenticated);
    } on FirebaseException catch (e) {
      print("eror code:" + e.code);
      // FlutterTost.showToast(ExceptionHandler.signUpException(e.code));
      FlutterTost.showToast(ExceptionHandler.loginException(e.code));
      emitter(InitialState());
    } catch (e) {
      emitter(InitialState());
      FlutterTost.showToast(e.toString());
      print("error");
      // emitter(AuthState.unauthenticated);
    }
  }

  // void loading(
  //     LoadingEvent event, Emitter<SigninState> emit) async {
  //       print("object called");
  //   emit(LoadingState());
  //   await Future.delayed(Duration(seconds: 10),()
  //   {
  //     print("object called");

  //   });
  //   emit(InitialState());
  // }

}
