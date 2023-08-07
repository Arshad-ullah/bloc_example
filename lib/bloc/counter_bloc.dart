import 'dart:developer';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  TextEditingController nameController=TextEditingController();
  List nameList=[];
  CounterBloc() : super(CounterInitial()) {
    on<IncreamentEvent>(increment);
    on<DecreamentEvent>(decrement);
    on<NameEvent>(addName);
    on<NameDeleteEvent>(deleteName);
  }

  void increment(IncreamentEvent event, Emitter<CounterState> emitter) {
    emitter(IncreamentState(count: event.count));
  }

  void decrement(DecreamentEvent event, Emitter<CounterState> emitter) {
    if (event.count >= 0) {
      emitter(DecreamentState(count: event.count));
    }
  }

  void addName(NameEvent event , Emitter<CounterState> emitter)
  {
    nameList.add(event.name.toString());
    emitter(NameState(nameList: nameList));
    nameController.clear();

  }
   void deleteName(NameDeleteEvent event , Emitter<CounterState> emitter)
  {
    nameList.remove(event.name.toString());
    emitter(NameState(nameList: nameList));
    

  }


}
