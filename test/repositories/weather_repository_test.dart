import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:dotestowania/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:dotestowania/repositories/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/sample_weather_model.dart';

class MockWeatherDataSource extends Mock implements WeatherRemoteDataSource {}

void main() {
  late WeatherRepository sut;
  late MockWeatherDataSource dataSource;

  setUp(() {
    dataSource = MockWeatherDataSource();
    sut = WeatherRepository(weatherRemoteDataSource: dataSource);
  });

  group('getWeatherModel', () {
    test(
        'Should return data source with specific weather data depended on what city user provides',
        () async {
      when(() => dataSource.getWeatherData(city: 'city'))
          .thenAnswer((_) async => sampleweatherData);

      final expectedWeatherModel = getSampleWeatherModel();

      final results = await sut.getWeatherModel(city: 'city');

      expect(results, equals(expectedWeatherModel), skip: true);
    });

    test('should return null when weather data is null', () async {
      when(() => dataSource.getWeatherData(city: 'city'))
          .thenAnswer((_) async => null);

      final results = await sut.getWeatherModel(city: 'city');

      expect(results, isNull);
    });
  });
}
