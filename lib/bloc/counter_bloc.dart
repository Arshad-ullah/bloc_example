import 'dart:developer';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncreamentEvent>(increment);
}

void increment(IncreamentEvent event,Emitter<CounterState> emitter)
{

  emitter(IncreamentState(count: event.count));


}
}
