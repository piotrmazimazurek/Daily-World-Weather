import 'package:dotestowania/app/core/enums.dart';
import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:dotestowania/app/home/cubit/home_cubit.dart';
import 'package:dotestowania/repositories/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../helpers/sample_weather_model.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late HomeCubit sut;
  late MockWeatherRepository repository;

  setUp(() {
    repository = MockWeatherRepository();
    sut = HomeCubit(weatherRepository: repository);
  });

  group('getWeatherModel', () {
    WeatherModel weatherModel = getSampleWeatherModel();

    setUp(() => {
          when(() => repository.getWeatherModel(city: 'city'))
              .thenAnswer((_) async => Future.value(getSampleWeatherModel()))
        });

    blocTest<HomeCubit, HomeState>(
      'emits Status.loading and then Status.success with model',
      build: () => sut,
      act: (cubit) => cubit.getWeatherModel(city: 'city'),
      expect: () => [
        const HomeState(
          status: Status.loading,
        ),
        HomeState(
          status: Status.success,
          model: weatherModel,
        ),
      ],
    );
  });
}
