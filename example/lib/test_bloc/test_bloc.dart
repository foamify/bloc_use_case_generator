import 'package:annotations/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/city_model.dart';
import '../model/global_failure_model.dart';
import '../model/restart_failure_model.dart';

part 'test_bloc.g.dart';

@BlocAnnotation(
  baseEventType: TestEvent,
  baseStateType: TestState,
  failureModel: GlobalFailureModel,
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
      failureModel: RestartFailureModel,
    ),
    BlocUseCase(
      name: 'GetCities',
      output: {'cities': List<City>},
    ),
  ],
)
class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc(TestState initialState) : super(initialState) {}
}

abstract class TestEvent {}

abstract class TestState {}
