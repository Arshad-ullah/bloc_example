import 'package:counter_bloc/blocs/testing_widget/bloc/testing_widget_bloc.dart';
import 'package:counter_bloc/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class TestingScreenWidget extends StatelessWidget {
  const TestingScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model=BlocProvider.of<TestingWidgetBloc>(context);
    
    return BlocConsumer<TestingWidgetBloc, TestingWidgetState>(
      listener: (context, state) {
        if(state is TestingNavigateToHomeState)
        {
          Get.to(()=>const HomeScreen());
        }
        
      },
      builder: (context, state) {

        return Scaffold(
          body: Center(child: TextButton(
            onPressed: ()
            {
              model.add(TestingWidgetNavigatToHomeScreen());
            
        
             
            },
            child: Text("move"),
          ),),
        );
        
      },
    );
  }
}