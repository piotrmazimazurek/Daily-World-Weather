import 'package:dotestowania/app/home/cubit/home_cubit.dart';
import 'package:dotestowania/repositories/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late HomeCubit sut;
  late MockWeatherRepository repository;

  setUp(() {
    repository = MockWeatherRepository();
    sut = HomeCubit(weatherRepository: repository);
  });
}
