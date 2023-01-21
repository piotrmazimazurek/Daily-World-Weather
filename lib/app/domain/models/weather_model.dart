// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names

class WeatherModel {
  const WeatherModel({
    required this.icon_url,
    required this.temperature_c,
    required this.temperature_f,
    required this.city,
    required this.condition,
    required this.pressure,
    required this.airquality,
    required this.localtime,
    required this.country,
    required this.sunriseday0,
    required this.sunsetday0,
    required this.sunrise_day1,
    required this.sunset_day1,
    required this.maxtemp_c_day1,
    required this.maxtemp_f_day1,
    required this.maxtemp_c_day2,
    required this.maxtemp_f_day2,
    required this.maxtemp_c_day3,
    required this.maxtemp_f_day3,
    required this.maxtemp_c_day4,
    required this.maxtemp_f_day4,
    required this.maxtemp_c_day5,
    required this.maxtemp_f_day5,
  });

  final String icon_url;
  final double temperature_c;
  final double temperature_f;
  final String city;
  final String condition;
  final double pressure;
  final int airquality;
  final String localtime;
  final String country;
  final String sunriseday0;
  final String sunsetday0;
  final String sunrise_day1;
  final String sunset_day1;
  final double maxtemp_c_day1;
  final double maxtemp_f_day1;
  final double maxtemp_c_day2;
  final double maxtemp_f_day2;
  final double maxtemp_c_day3;
  final double maxtemp_f_day3;
  final double maxtemp_c_day4;
  final double maxtemp_f_day4;
  final double maxtemp_f_day5;
  final double maxtemp_c_day5;

  WeatherModel.fromJson(Map<String, dynamic> json)
      : icon_url = "http:" + json['current']['condition']['icon'],
        temperature_c = json['current']['temp_c'] + 0.0,
        temperature_f = json['current']['temp_f'] + 0.0,
        maxtemp_c_day1 =
            json['forecast']['forecastday'][1]['day']['maxtemp_c'] + 0.0,
        maxtemp_f_day2 =
            json['forecast']['forecastday'][1]['day']['maxtemp_f'] + 0.0,
        city = json['location']['name'],
        maxtemp_c_day2 =
            json['forecast']['forecastday'][1]['day']['maxtemp_c'] + 0.0,
        maxtemp_f_day3 =
            json['forecast']['forecastday'][1]['day']['maxtemp_f'] + 0.0,
        maxtemp_c_day3 =
            json['forecast']['forecastday'][1]['day']['maxtemp_c'] + 0.0,
        maxtemp_f_day1 =
            json['forecast']['forecastday'][1]['day']['maxtemp_f'] + 0.0,
        maxtemp_c_day4 =
            json['forecast']['forecastday'][1]['day']['maxtemp_c'] + 0.0,
        maxtemp_f_day4 =
            json['forecast']['forecastday'][1]['day']['maxtemp_f'] + 0.0,
        maxtemp_c_day5 =
            json['forecast']['forecastday'][1]['day']['maxtemp_c'] + 0.0,
        maxtemp_f_day5 =
            json['forecast']['forecastday'][1]['day']['maxtemp_f'] + 0.0,
        condition = json['current']['condition']['text'],
        airquality = json['current']['air_quality']['us-epa-index'],
        pressure = json['current']['pressure_mb'],
        localtime = json['location']['localtime'],
        country = json['location']['country'],
        sunriseday0 = json['forecast']['forecastday'][0]['astro']['sunrise'],
        sunsetday0 = json['forecast']['forecastday'][0]['astro']['sunset'],
        sunrise_day1 = json['forecast']['forecastday'][1]['astro']['sunrise'],
        sunset_day1 = json['forecast']['forecastday'][1]['astro']['sunset'];
}
