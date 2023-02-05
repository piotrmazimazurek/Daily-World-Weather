import 'package:dotestowania/app/home/cubit/home_cubit.dart';
import 'package:dotestowania/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:dotestowania/repositories/weather_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerFactory(() => HomeCubit(getIt()));
  getIt.registerFactory(() => WeatherRepository(getIt()));
  getIt.registerFactory(() => WeatherRemoteDataSource());
}
