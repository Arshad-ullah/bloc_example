import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_bloc/blocs/signin_bloc/signin_state.dart';
import 'package:meta/meta.dart';

part 'testing_widget_event.dart';
part 'testing_widget_state.dart';

class TestingWidgetBloc extends Bloc<TestingWidgetEvent, TestingWidgetState> {
  TestingWidgetBloc() : super(TestingWidgetInitial()) {
    on<TestingWidgetNavigatToHomeScreen>(toSecondScreen);
  }

  FutureOr<void> toSecondScreen(TestingWidgetNavigatToHomeScreen event, Emitter<TestingWidgetState> emit) {
   print("bloc function are called");
    emit(TestingNavigateToHomeState());
  }
}
