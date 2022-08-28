import 'package:annotations/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'test_bloc.g.dart';

@BlocAnnotation(
  baseEventType: TestEvent,
  baseStateType: TestState,
  blocUseCases: [
    BlocUseCase(
      name: 'ChangeTheme',
      output: {'result': int},
      input: {'id': int},
      extraStates: ['NoTheme'],
    ),
    BlocUseCase(
      name: 'Restart',
      input: {'time': int},
      output: {'isSuccess': bool},
    ),
  ],
)
class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc(TestState initialState) : super(initialState) {}
}

abstract class TestEvent {}

abstract class TestState {}
