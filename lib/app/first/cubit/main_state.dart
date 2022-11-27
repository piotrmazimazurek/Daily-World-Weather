part of 'main_cubit.dart';

class MainState {
  const MainState({
    this.model,
    this.status = Status.initial,
    this.errorMessage,
  });
  final WeatherModel? model;
  final Status status;
  final String? errorMessage;
}
