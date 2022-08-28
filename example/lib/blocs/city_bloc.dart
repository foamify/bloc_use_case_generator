import 'dart:async';

import 'package:annotations/annotations.dart';
import 'package:bloc/bloc.dart';


import '../model/city_model.dart';
import '../model/global_failure_model.dart';
import '../service/remote_service.dart';

part 'city_bloc.g.dart';

abstract class CityEvent {}

abstract class CityState {}

@BlocAnnotation(
  baseEventType: CityEvent,
  baseStateType: CityState,
  failureModel: GlobalFailureModel,
  blocUseCases: [
    BlocUseCase(
      name: 'DeleteCity',
      input: {'cityId': int},
      output: {'city': City},
      extraStates: ['NoCityFound'],
    ),
    BlocUseCase(
      name: 'GetCities',
      output: {'cities': List<City>},
    ),
  ],
)
class CityBloc extends Bloc<CityEvent, CityState> {
  final RemoteService _remoteService = RemoteService();
  CityBloc() : super(InitialCityState()) {
    on<CityEvent>((event, emit) {
      on<GetCitiesEvent>(_onGetCities);
    });
  }

  FutureOr<void> _onGetCities(
    GetCitiesEvent event,
    Emitter<CityState> emit,
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
