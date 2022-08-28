// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_bloc.dart';

// **************************************************************************
// BlocGenerator
// **************************************************************************

class ChangeThemeEvent extends TestEvent {
  final int themeId;
  ChangeThemeEvent({required this.themeId});
}

class ChangeThemeInProgressState extends TestState {}

class NoThemeFoundState extends TestState {}

class ChangeThemeCompletedState extends TestState {
  final int result;
  ChangeThemeCompletedState({required this.result});
}

class ChangeThemeFailedState extends TestState {
  final GlobalFailureModel failure;
  ChangeThemeFailedState({required this.failure});
}

class RestartEvent extends TestEvent {
  final DateTime time;
  RestartEvent({required this.time});
}

class RestartInProgressState extends TestState {}

class RestartCompletedState extends TestState {
  final bool isSuccess;
  RestartCompletedState({required this.isSuccess});
}

class RestartFailedState extends TestState {
  final RestartFailureModel failure;
  RestartFailedState({required this.failure});
}

class GetCitiesEvent extends TestEvent {}

class GetCitiesInProgressState extends TestState {}

class GetCitiesCompletedState extends TestState {
  final List<City> cities;
  GetCitiesCompletedState({required this.cities});
}

class GetCitiesFailedState extends TestState {
  final GlobalFailureModel failure;
  GetCitiesFailedState({required this.failure});
}
