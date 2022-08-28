// GENERATED CODE - DO NOT MODIFY BY HAND

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

class NoCityFoundState extends CityState {}

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
