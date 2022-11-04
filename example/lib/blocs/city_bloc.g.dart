// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_bloc.dart';

// **************************************************************************
// BlocGenerator
// **************************************************************************

class InitialCityState extends CityState {}

class DeleteCityEvent extends CityEvent {
  final int cityId;
  final bool? isCapitol;
  final City? siblingCity;
  DeleteCityEvent(
      {required this.cityId,
      required this.isCapitol,
      required this.siblingCity});
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
