// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names

class WeatherModel {
  const WeatherModel({
    required this.icon_url_day0,
    required this.icon_url_day1,
    required this.icon_url_day2,
    required this.temperature_c,
    required this.temperature_f,
    required this.city,
    required this.condition_day0,
    required this.condition_day1,
    required this.condition_day2,
    required this.pressure,
    required this.airquality,
    required this.weekday0,
    required this.weekday1,
    required this.weekday2,
    required this.country,
    required this.sunriseday0,
    required this.sunsetday0,
    required this.sunrise_day1,
    required this.sunset_day1,
    required this.sunrise_day2,
    required this.sunset_day2,
    required this.maxtemp_c_day1,
    required this.maxtemp_f_day1,
    required this.maxtemp_c_day2,
    required this.maxtemp_f_day2,
  });

  final String icon_url_day0;
  final String icon_url_day1;
  final String icon_url_day2;
  final double temperature_c;
  final double temperature_f;
  final String city;
  final String condition_day0;
  final String condition_day1;
  final String condition_day2;
  final double pressure;
  final int airquality;
  final String weekday0;
  final String weekday1;
  final String weekday2;

  final String country;
  final String sunriseday0;
  final String sunsetday0;
  final String sunrise_day1;
  final String sunset_day1;
  final String sunrise_day2;
  final String sunset_day2;

  final double maxtemp_c_day1;
  final double maxtemp_f_day1;
  final double maxtemp_c_day2;
  final double maxtemp_f_day2;

  WeatherModel.fromJson(Map<String, dynamic> json)
      : icon_url_day0 = "http:" + json['current']['condition']['icon'],
        icon_url_day1 = "http:" +
            json['forecast']['forecastday'][1]['day']['condition']['icon'],
        icon_url_day2 = "http:" +
            json['forecast']['forecastday'][2]['day']['condition']['icon'],
        temperature_c = json['current']['temp_c'] + 0.0 ?? "Unknown data",
        temperature_f = json['current']['temp_f'] + 0.0 ?? "Unknown data",
        maxtemp_c_day1 =
            json['forecast']['forecastday'][1]['day']['maxtemp_c'] + 0.0 ??
                "Unknown data",
        maxtemp_f_day1 =
            json['forecast']['forecastday'][1]['day']['maxtemp_f'] + 0.0 ??
                "Unknown data",
        city = json['location']['name'],
        maxtemp_c_day2 =
            json['forecast']['forecastday'][2]['day']['maxtemp_c'] + 0.0 ??
                "Unknown data",
        maxtemp_f_day2 =
            json['forecast']['forecastday'][2]['day']['maxtemp_f'] + 0.0 ??
                "Unknown data",
        condition_day0 = json['current']['condition']['text'] ?? "Unknown data",
        condition_day1 = json['forecast']['forecastday'][1]['day']['condition']
                ['text'] ??
            "Unknown data",
        condition_day2 = json['forecast']['forecastday'][2]['day']['condition']
                ['text'] ??
            "Unknown data",
        airquality =
            json['current']['air_quality']['us-epa-index'] ?? "Unknown data",
        pressure = json['current']['pressure_mb'] ?? "Unknown data",
        weekday0 = json['location']['localtime'] ?? "Unknown data",
        weekday1 = json['forecast']['forecastday'][1]['date'] ?? "Unknown data",
        weekday2 = json['forecast']['forecastday'][2]['date'] ?? "Unknown data",
        country = json['location']['country'] ?? "Unknown data",
        sunriseday0 = json['forecast']['forecastday'][0]['astro']['sunrise'] ??
            "Unknown data",
        sunsetday0 = json['forecast']['forecastday'][0]['astro']['sunset'] ??
            "Unknown data",
        sunrise_day1 = json['forecast']['forecastday'][1]['astro']['sunrise'] ??
            "Unknown data",
        sunset_day1 = json['forecast']['forecastday'][1]['astro']['sunset'] ??
            "Unknown data",
        sunrise_day2 = json['forecast']['forecastday'][2]['astro']['sunrise'] ??
            "Unknown data",
        sunset_day2 = json['forecast']['forecastday'][2]['astro']['sunset'] ??
            "Unknown data";
}
