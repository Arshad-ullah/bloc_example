part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class IncreamentState extends CounterState
{
  int count=0;
  IncreamentState({required this.count});
}
