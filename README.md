# Bloc Generator

Helper code generator library for `flutter_bloc`. Generates States and Event for bloc with given annotation Information.

Library uses `build_runner` for generate classes.

## Example

Create a file named with of your bloc. In this case `city_bloc.dart`.

```
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
      input: {
        'cityId': int,
        'isCapitol': Nullable<bool>,
        'siblingCity': Nullable<City>,
      },
      output: {'city': City},
      extraStates: [
        UseCaseState(
          name: 'DeleteCityForbidden',
        ),
        UseCaseState(
          name: 'DeleteCityWithId',
          arguments: {'cityId': int},
        )
      ],
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

```

Run `flutter pub run build_runner build` command from terminal inside project directory.

Generator creates city_bloc.g.dart file filled with defined states and events.

```
part of 'city_bloc.dart';

// **************************************************************************
// BlocGenerator
// **************************************************************************

class InitialCityState extends CityState {}

class DeleteCityEvent extends CityEvent {
  final int cityId;
  DeleteCityEvent({required this.cityId});
}

class DeleteCityInProgressState extends CityState {}

class DeleteCityForbiddenState extends CityState {
  DeleteCityForbiddenState();
}

class DeleteCityWithIdState extends CityState {
  final int cityId;
  DeleteCityWithIdState({required this.cityId});
}

class DeleteCityCompletedState extends CityState {
  final City city;
  DeleteCityCompletedState({required this.city});
}

class DeleteCityFailedState extends CityState {
  final GlobalFailureModel failure;
  DeleteCityFailedState({required this.failure});
}

class GetCitiesEvent extends CityEvent {}

class GetCitiesInProgressState extends CityState {}

class GetCitiesCompletedState extends CityState {
  final List<City> cities;
  GetCitiesCompletedState({required this.cities});
}

class GetCitiesFailedState extends CityState {
  final GlobalFailureModel failure;
  GetCitiesFailedState({required this.failure});
}


```

## Annotations

Generator needs `BlocAnnotation` declaration top of the bloc.

- `baseEventType` : Base Event class type for event classes.
- `baseStateType` : Base State class type for state classes.
- `failureModel` : Global failure model type. If its null failure states wont have any fields. Otherwise will have this failure model.
- `BlocUseCase.name` : Name of your event.
- `BlocUseCase.input` : Define event inputs with map.Format: `{"nameOfField":typeOfField}`.
- `BlocUseCase.output` : Define CompletedState fields with map.Format: `{"nameOfField":typeOfField}`.
- `BlocUseCase.extraStates` : if you want more state define them inside list of string .
