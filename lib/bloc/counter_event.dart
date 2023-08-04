part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncreamentEvent extends CounterEvent
{
  int count=0;
  IncreamentEvent({required this.count});
}
