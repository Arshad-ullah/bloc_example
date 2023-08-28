import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'testing_widget_event.dart';
part 'testing_widget_state.dart';

class TestingWidgetBloc extends Bloc<TestingWidgetEvent, TestingWidgetState> {
  TestingWidgetBloc() : super(TestingWidgetInitial()) {
    on<TestingWidgetNavigatToHomeScreen>(toSecondScreen);
    on<TestingLoadingEvent>(myLoading);

     print("dlklkalkdlkkd");

  
    
  }

  FutureOr<void> toSecondScreen(TestingWidgetNavigatToHomeScreen event, Emitter<TestingWidgetState> emit) {
   print("bloc function are called");
    emit(TestingNavigateToHomeState());
  }



   myLoading(TestingLoadingEvent event, Emitter<TestingWidgetState> emit) async{

    print("Testing screen");
  emit(TestingLoadingState());

    await Future.delayed(const Duration(seconds: 5));
    emit(TestingWidgetInitial());

  }
}
