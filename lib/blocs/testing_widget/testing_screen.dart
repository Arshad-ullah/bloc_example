// import 'dart:ffi';
// import 'dart:html';

import 'package:counter_bloc/blocs/testing_widget/bloc/testing_widget_bloc.dart';
import 'package:counter_bloc/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class TestingScreenWidget extends StatelessWidget {
  const TestingScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = BlocProvider.of<TestingWidgetBloc>(context);
    model.add(TestingLoadingEvent());

    return BlocConsumer<TestingWidgetBloc, TestingWidgetState>(
      listener: (context, state) {
        if (state is TestingNavigateToHomeState) {
          Get.to(() => const HomeScreen());
        }
      },
      builder: (context, state) {
        if (state is TestingLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TestingWidgetInitial) {
          return Scaffold(
            body: Center(
              child: TextButton(
                onPressed: () {
                  model.add(TestingWidgetNavigatToHomeScreen());
                },
                child: const Text("move"),
              ),
            ),
          );
        } else {
          return const Center(
            child: SizedBox(),
          );
        }
      },
    );
  }
}
