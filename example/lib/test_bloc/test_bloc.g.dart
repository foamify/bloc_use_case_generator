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

class ChangeThemeFailedState extends TestState {}

class RestartEvent extends TestEvent {
  final DateTime time;
  RestartEvent({required this.time});
}

class RestartInProgressState extends TestState {}

class RestartCompletedState extends TestState {
  final bool isSuccess;
  RestartCompletedState({required this.isSuccess});
}

class RestartFailedState extends TestState {}
