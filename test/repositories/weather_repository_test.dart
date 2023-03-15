import 'package:dotestowania/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:dotestowania/repositories/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherDataSource extends Mock implements WeatherRemoteDataSource {}

void main() {
  WeatherRepository sut;
  MockWeatherDataSource dataSource;

  setUp(() {
    dataSource = MockWeatherDataSource();
    sut = WeatherRepository(weatherRemoteDataSource: dataSource);
  });
}
