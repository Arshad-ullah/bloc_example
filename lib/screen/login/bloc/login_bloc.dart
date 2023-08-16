import 'package:bloc/bloc.dart';
import 'package:counter_bloc/screen/login/login_screen.dart';
import 'package:counter_bloc/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../utils/firebase_exceptions.dart';

part 'login_event.dart';
part 'login_state.dart';

enum AuthState {
  initial,
  loading,
  loaded,
  authenticated,
  unauthenticated,
}

class LoginBloc extends Bloc<LoginEvent, AuthState> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  LoginBloc() : super(AuthState.initial) {
    on<LogingAuthEvent>(login);
    on<LogoutAuthEvent>(logOut);
  }

  void logOut(LogoutAuthEvent event, Emitter<AuthState> emitter) async {
    try {
      await auth.signOut();
      emitter(AuthState.unauthenticated);
    } catch (e) {
      emitter(AuthState.unauthenticated);
    }
  }

  void login(LogingAuthEvent event, Emitter<AuthState> emitter) async {
    emitter(AuthState.loading);
    try {
      await auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
     
      print(auth.currentUser!.uid);
      FlutterTost.showToast('Signup successfully');

      //arsaarshad khan nice jahan nice to meet you arshad kha
      Get.to(()=>const SecondPage());


       emitter(AuthState.loaded);
       
    }on FirebaseException catch(e)
    {
      emitter(AuthState.unauthenticated);
      print("eror code:"+e.code);
      // FlutterTost.showToast(ExceptionHandler.signUpException(e.code));
      FlutterTost.showToast(ExceptionHandler.signUpException(e.code));
      
    }  
    catch (e) {
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
