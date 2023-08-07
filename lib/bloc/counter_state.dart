part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterLoading extends CounterState {}

class IncreamentState extends CounterState {
  int count = 0;
  IncreamentState({required this.count});
}

class DecreamentState extends CounterState {
  int count = 0;
  DecreamentState({required this.count});
}

class NameState extends CounterState {
  List nameList = [];
  NameState({required this.nameList});
}
