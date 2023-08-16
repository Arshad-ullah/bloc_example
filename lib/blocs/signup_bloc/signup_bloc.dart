import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_bloc/blocs/signin_bloc/signin_bloc.dart';
import 'package:counter_bloc/blocs/signin_bloc/signin_event.dart';
import 'package:counter_bloc/blocs/signup_bloc/signup_events.dart';
import 'package:counter_bloc/screen/home/home_screen.dart';
import 'package:counter_bloc/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../utils/firebase_exceptions.dart';

enum AuthState {
  initial,
  loading,
}

class SignupBloc extends Bloc<SignupEvent, AuthState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  SignupBloc() : super(AuthState.initial) {
    on<SignupAuthEvent>(createUser);

    
  }

  //createUser
  void createUser(SignupAuthEvent event, Emitter<AuthState> emitter) async {
    try {
      emitter(AuthState.loading);
      await auth.createUserWithEmailAndPassword(
          email: event.email, password: event.password);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(auth.currentUser!.uid)
          .set({
        "user name": event.name,
        "user id": auth.currentUser!.uid,
        "user email": event.email,
        "time": Timestamp.now(),
      });

      emitter(AuthState.initial);
      FlutterTost.showToast("Successfully Signup");
      Get.to(() => const HomeScreen());
    } on FirebaseException catch (e) {
      FlutterTost.showToast(ExceptionHandler.loginException(e.code));
      emitter(AuthState.initial);
    } catch (e) {
      emitter(AuthState.initial);
      FlutterTost.showToast(e.toString());
    }
  }
}
