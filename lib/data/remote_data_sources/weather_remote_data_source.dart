import 'package:dio/dio.dart';
import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:retrofit/retrofit.dart';
part 'weather_remote_data_source.g.dart';

@RestApi(baseUrl: "http://api.weatherapi.com/v1/")
abstract class WeatherRemoteRetrofitDataSource {
  factory WeatherRemoteRetrofitDataSource(Dio dio, {String baseUrl}) =
      _WeatherRemoteRetrofitDataSource;

  @GET(
      "forecast.json?key=4d8622f0488a4d36828100805232301&q={city}&days=5&aqi=yes&alerts=no")
  Future<List<WeatherModel>> getWeatherData(@Path("city") String city);
}

class WeatherRemoteDataSource {
  Future<Map<String, dynamic>?> getWeatherData({
    required String city,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'http://api.weatherapi.com/v1/forecast.json?key=4d8622f0488a4d36828100805232301&q=$city&days=5&aqi=yes&alerts=no');
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
