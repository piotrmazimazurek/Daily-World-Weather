// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names

class WeatherModel {
  const WeatherModel({
    required this.icon_url_day0,
    required this.icon_url_day1,
    required this.icon_url_day2,
    required this.icon_url_day3,
    required this.icon_url_day4,
    required this.temperature_c,
    required this.temperature_f,
    required this.city,
    required this.wind_day0,
    required this.wind_day1,
    required this.wind_day2,
    required this.wind_day3,
    required this.wind_day4,
    required this.condition_day0,
    required this.condition_day1,
    required this.condition_day2,
    required this.condition_day3,
    required this.condition_day4,
    required this.pressure_day0,
    required this.pressure_day1,
    required this.pressure_day2,
    required this.pressure_day3,
    required this.pressure_day4,
    required this.airquality_day0,
    required this.airquality_day1,
    required this.airquality_day2,
    required this.airquality_day3,
    required this.airquality_day4,
    required this.weekday0,
    required this.weekday1,
    required this.weekday2,
    required this.weekday3,
    required this.weekday4,
    required this.country,
    required this.sunriseday0,
    required this.sunsetday0,
    required this.sunrise_day1,
    required this.sunset_day1,
    required this.sunrise_day2,
    required this.sunset_day2,
    required this.sunrise_day3,
    required this.sunset_day3,
    required this.sunrise_day4,
    required this.sunset_day4,
    required this.maxtemp_c_day1,
    required this.maxtemp_f_day1,
    required this.maxtemp_c_day2,
    required this.maxtemp_f_day2,
    required this.maxtemp_c_day3,
    required this.maxtemp_f_day3,
    required this.maxtemp_c_day4,
    required this.maxtemp_f_day4,
  });

  final String icon_url_day0;
  final String icon_url_day1;
  final String icon_url_day2;
  final String icon_url_day3;
  final String icon_url_day4;
  final double temperature_c;
  final double temperature_f;
  final String city;
  final double wind_day0;
  final double wind_day1;

  final double wind_day2;
  final double wind_day3;
  final double wind_day4;
  final String condition_day0;
  final String condition_day1;
  final String condition_day2;
  final String condition_day3;
  final String condition_day4;

  final double pressure_day0;
  final double pressure_day1;
  final double pressure_day2;
  final double pressure_day3;
  final double pressure_day4;

  final dynamic airquality_day0;
  final dynamic airquality_day1;
  final dynamic airquality_day2;
  final dynamic airquality_day3;
  final dynamic airquality_day4;

  final String weekday0;
  final String weekday1;
  final String weekday2;
  final String weekday3;
  final String weekday4;

  final String country;
  final String sunriseday0;
  final String sunsetday0;
  final String sunrise_day1;
  final String sunset_day1;
  final String sunrise_day2;
  final String sunset_day2;
  final String sunrise_day3;
  final String sunset_day3;
  final String sunrise_day4;
  final String sunset_day4;

  final double maxtemp_c_day1;
  final double maxtemp_f_day1;
  final double maxtemp_c_day2;
  final double maxtemp_f_day2;
  final double maxtemp_c_day3;
  final double maxtemp_f_day3;
  final double maxtemp_c_day4;
  final double maxtemp_f_day4;

  WeatherModel.fromJson(Map<String, dynamic> json)
      : icon_url_day0 = "http:" + json['current']['condition']['icon'],
        icon_url_day1 = "http:" +
            json['forecast']['forecastday'][1]['day']['condition']['icon'],
        icon_url_day2 = "http:" +
            json['forecast']['forecastday'][2]['day']['condition']['icon'],
        icon_url_day3 = "http:" +
            json['forecast']['forecastday'][3]['day']['condition']['icon'],
        icon_url_day4 = "http:" +
            json['forecast']['forecastday'][4]['day']['condition']['icon'],
        temperature_c = json['current']['temp_c'] + 0.0,
        temperature_f = json['current']['temp_f'] + 0.0,
        maxtemp_c_day1 =
            json['forecast']['forecastday'][1]['day']['maxtemp_c'] + 0.0,
        maxtemp_f_day1 =
            json['forecast']['forecastday'][1]['day']['maxtemp_f'] + 0.0,
        city = json['location']['name'],
        wind_day0 = json['current']['wind_kph'],
        wind_day1 = json['forecast']['forecastday'][1]['day']['maxwind_kph'],
        wind_day2 = json['forecast']['forecastday'][2]['day']['maxwind_kph'],
        wind_day3 = json['forecast']['forecastday'][3]['day']['maxwind_kph'],
        wind_day4 = json['forecast']['forecastday'][4]['day']['maxwind_kph'],
        maxtemp_c_day2 =
            json['forecast']['forecastday'][2]['day']['maxtemp_c'] + 0.0,
        maxtemp_f_day2 =
            json['forecast']['forecastday'][2]['day']['maxtemp_f'] + 0.0,
        maxtemp_c_day3 =
            json['forecast']['forecastday'][3]['day']['maxtemp_c'] + 0.0,
        maxtemp_f_day3 =
            json['forecast']['forecastday'][3]['day']['maxtemp_f'] + 0.0,
        maxtemp_c_day4 =
            json['forecast']['forecastday'][4]['day']['maxtemp_c'] + 0.0,
        maxtemp_f_day4 =
            json['forecast']['forecastday'][4]['day']['maxtemp_f'] + 0.0,
        condition_day0 = json['current']['condition']['text'],
        condition_day1 =
            json['forecast']['forecastday'][1]['day']['condition']['text'],
        condition_day2 =
            json['forecast']['forecastday'][2]['day']['condition']['text'],
        condition_day3 =
            json['forecast']['forecastday'][3]['day']['condition']['text'],
        condition_day4 =
            json['forecast']['forecastday'][4]['day']['condition']['text'],
        airquality_day0 = json['current']['air_quality']['us-epa-index'],
        airquality_day1 = json['forecast']['forecastday'][1]['day']
                ['air_quality']['us-epa-index'] ??
            "",
        airquality_day2 = json['forecast']['forecastday'][2]['day']
                ['air_quality']['us-epa-index'] ??
            "",
        airquality_day3 = json['forecast']['forecastday'][3]['day']
                ['air_quality']['us-epa-index'] ??
            "",
        airquality_day4 = json['forecast']['forecastday'][4]['day']
                ['air_quality']['us-epa-index'] ??
            "",
        pressure_day0 = json['current']['pressure_mb'],
        pressure_day1 =
            json['forecast']['forecastday'][1]['hour'][13]['pressure_mb'],
        pressure_day2 =
            json['forecast']['forecastday'][2]['hour'][13]['pressure_mb'],
        pressure_day3 =
            json['forecast']['forecastday'][3]['hour'][13]['pressure_mb'],
        pressure_day4 =
            json['forecast']['forecastday'][4]['hour'][13]['pressure_mb'],
        weekday0 = json['location']['localtime'],
        weekday1 = json['forecast']['forecastday'][1]['date'],
        weekday2 = json['forecast']['forecastday'][2]['date'],
        weekday3 = json['forecast']['forecastday'][3]['date'],
        weekday4 = json['forecast']['forecastday'][4]['date'],
        country = json['location']['country'],
        sunriseday0 = json['forecast']['forecastday'][0]['astro']['sunrise'],
        sunsetday0 = json['forecast']['forecastday'][0]['astro']['sunset'],
        sunrise_day1 = json['forecast']['forecastday'][1]['astro']['sunrise'],
        sunset_day1 = json['forecast']['forecastday'][1]['astro']['sunset'],
        sunrise_day2 = json['forecast']['forecastday'][2]['astro']['sunrise'],
        sunset_day2 = json['forecast']['forecastday'][2]['astro']['sunset'],
        sunrise_day3 = json['forecast']['forecastday'][3]['astro']['sunrise'],
        sunset_day3 = json['forecast']['forecastday'][3]['astro']['sunset'],
        sunrise_day4 = json['forecast']['forecastday'][4]['astro']['sunrise'],
        sunset_day4 = json['forecast']['forecastday'][4]['astro']['sunset'];
}
