import 'package:dio/dio.dart';

class WeatherRemoteDataSource {
  Future<Map<String, dynamic>?> getWeatherData({
    required String city,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'http://api.weatherapi.com/v1/forecast.json?key=4d8622f0488a4d36828100805232103&q=$city&days=5&aqi=yes&alerts=no');
      if (response.statusCode == 200) {
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
