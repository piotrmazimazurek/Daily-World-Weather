import 'package:dio/dio.dart';

class WeatherRepository {
  Future<Map<String, dynamic>?> getWeatherModel({
    required String city,
  }) async {
    final response = await Dio().get<Map<String, dynamic>>('');
    return response.data;
  }
}
