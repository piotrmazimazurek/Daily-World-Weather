// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dotestowania/app/core/enums.dart';
import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:dotestowania/repositories/weather_repository.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this._weatherRepository) : super(const MainState());

  final WeatherRepository _weatherRepository;

  Future<void> getWeatherModel({
    required String city,
  }) async {
    emit(const MainState(status: Status.loading));
    try {
      final weatherModel = await _weatherRepository.getWeatherModel(city: city);
      emit(
        MainState(
          model: weatherModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        MainState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
