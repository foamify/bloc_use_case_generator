import 'dart:async';
import 'package:annotations/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/city_model.dart';
import '../model/global_failure_model.dart';
import '../model/restart_failure_model.dart';
import '../service/remote_service.dart';

part 'test_bloc.g.dart';

abstract class TestEvent {}

abstract class TestState {}

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
  final RemoteService _remoteService = RemoteService();

  TestBloc() : super(InitialTestState()) {
    on<GetCitiesEvent>(_onGetCities);
  }

  FutureOr<void> _onGetCities(
    GetCitiesEvent event,
    Emitter<TestState> emit,
  ) async {
    emit(GetCitiesInProgressState());

    final cities = await _remoteService.getCities();

    if (cities != null) {
      emit(GetCitiesCompletedState(cities: cities));
    } else {
      emit(GetCitiesFailedState(
        failure: GlobalFailureModel(
          errorCode: 0,
          message: 'Error when getting cities',
        ),
      ));
    }
  }
}
