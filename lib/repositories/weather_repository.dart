import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:dotestowania/data/remote_data_sources/weather_remote_data_source.dart';
import 'dart:core';

class WeatherRepository {
  WeatherRepository({required this.weatherRemoteDataSource});

  final WeatherRemoteDataSource weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final json = await weatherRemoteDataSource.getWeatherData(
      city: city,
    );

    if (json == null) {
      return null;
    }

    return WeatherModel.fromJson(json);
  }
}
