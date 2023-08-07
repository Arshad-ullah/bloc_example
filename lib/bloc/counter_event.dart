part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncreamentEvent extends CounterEvent {
  int count = 0;
  IncreamentEvent({required this.count});
}

class DecreamentEvent extends CounterEvent {
  int count = 0;
  DecreamentEvent({required this.count});
}

class NameEvent extends CounterEvent {
  String name;

  NameEvent({required this.name});
}

class NameDeleteEvent extends CounterEvent {
  String name;

  NameDeleteEvent({required this.name});
}
