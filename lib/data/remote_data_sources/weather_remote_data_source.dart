import 'package:dio/dio.dart';

class WeatherRemoteDataSource {
  Future<Map<String, dynamic>?> getWeatherData({
    required String city,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'http://api.weatherapi.com/v1/forecast.json?key=5d3b36a454774f5483d124903231001&q=$city&days=7&aqi=yes&alerts=no');
      if (response.statusCode == 200) {
        print(response.data);
        (response.data.toString());
        return response.data;
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } on DioError catch (error) {
      throw Exception(
          error.response?.data['error']['message'] ?? 'Unknown error');
    }
  }
}
