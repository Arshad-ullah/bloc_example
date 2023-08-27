part of 'testing_widget_bloc.dart';

@immutable
sealed class TestingWidgetState {}

final class TestingWidgetInitial extends TestingWidgetState {}

class TestingNavigateToHomeState extends TestingWidgetState{}
