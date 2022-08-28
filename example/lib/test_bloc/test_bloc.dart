import 'package:annotations/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/failure_model.dart';

part 'test_bloc.g.dart';

@BlocAnnotation(
  baseEventType: TestEvent,
  baseStateType: TestState,
  failureModel: FailureModel,
  blocUseCases: [
    BlocUseCase(
      name: 'ChangeTheme',
      output: {'result': int},
      input: {'themeId': int},
      extraStates: ['NoThemeFound'],
    ),
    BlocUseCase(
      name: 'Restart',
      input: {'time': DateTime},
      output: {'isSuccess': bool},
    ),
  ],
)
class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc(TestState initialState) : super(initialState) {}
}

abstract class TestEvent {}

abstract class TestState {}
