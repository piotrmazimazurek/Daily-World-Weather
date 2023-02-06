// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dotestowania/app/core/enums.dart';
import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:dotestowania/repositories/weather_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._weatherRepository) : super(const HomeState());

  final WeatherRepository _weatherRepository;

  Future<void> getWeatherModel({
    required String city,
  }) async {
    emit(const HomeState(status: Status.loading));
    try {
      final weatherModel = await _weatherRepository.getWeatherModel(city: city);
      emit(
        HomeState(
          model: weatherModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        const HomeState(
          status: Status.error,
          errorMessage: " 💬 Whoopsy ... there's no such location ! ",
        ),
      );
    }
  }
}
