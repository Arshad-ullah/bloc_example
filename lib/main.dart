import 'dart:async';

// import 'package:counter_bloc/bloc/counter_bloc.dart';
// import 'package:counter_bloc/screen/login/bloc/login_bloc.dart';
import 'package:counter_bloc/blocs/post/bloc/post_bloc.dart';
import 'package:counter_bloc/blocs/post/post_screen.dart';
import 'package:counter_bloc/blocs/signin_bloc/signin_bloc.dart';
import 'package:counter_bloc/blocs/testing_widget/bloc/testing_widget_bloc.dart';
import 'package:counter_bloc/screen/login/bloc/login_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'blocs/signup_bloc/signup_bloc.dart';


void main()async{
   WidgetsFlutterBinding.ensureInitialized();

   if(kIsWeb)
   {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDGvbuFXuCtLlNKmSxwPWtd_nU4ichch9I",
    authDomain: "testdatabase-295f5.firebaseapp.com",
    projectId: "testdatabase-295f5",
    storageBucket: "testdatabase-295f5.appspot.com",
    messagingSenderId: "860192473893",
    appId: "1:860192473893:web:98d0ec8c0c629cad1750cc",
    measurementId: "G-RCN5T33SNG"
      )
    );
   }
  else 
  {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => SinginBloc()),
        BlocProvider(create: (_) => SignupBloc()),
        BlocProvider(create:(_)=> TestingWidgetBloc()),
        BlocProvider(create: (_)=>PostBloc())

      
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PostScreen(),
      ),
    );
  }
}


class TimerCount extends StatefulWidget {
  const TimerCount({super.key});

  @override
  State<TimerCount> createState() => _TimerCountState();
}

class _TimerCountState extends State<TimerCount> {
  int seconds = 0;
  Timer? timer;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        seconds++;
      });
    });
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds ~/ 60) % 60;
    int remainingSeconds = seconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Timer Example'),
      ),
      body: Center(
        child: Text(
          formatTime(seconds),
          style: const TextStyle(fontSize: 36),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startTimer();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
