part of 'first_cubit.dart';

@immutable
class FirstState {
  const FirstState({
    this.model,
    this.status = Status.initial,
    this.errorMessage,
  });
  final WeatherModel? model;
  final Status status;
  final String? errorMessage;
}
