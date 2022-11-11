// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dotestowania/app/core/enums.dart';
import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:dotestowania/repositories/weather_repository.dart';

part 'first_state.dart';

class FirstCubit extends Cubit<FirstState> {
  FirstCubit(this._weatherRepository) : super(const FirstState());

  final WeatherRepository _weatherRepository;

  Future<void> getWeatherModel({
    required String city,
  }) async {
    emit(const FirstState(status: Status.loading));
    try {
      final weatherModel = await _weatherRepository.getWeatherModel(city: city);
      emit(
        FirstState(
          model: weatherModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        FirstState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
