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
    required this.weekday2,
    required this.weekday3,
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

  final String icon_url;
  final double temperature_c;
  final double temperature_f;
  final String city;
  final String condition;
  final double pressure;
  final int airquality;
  final String localtime;
  final String weekday2;
  final String weekday3;

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
      : icon_url = "http:" + json['current']['condition']['icon'],
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
        condition = json['current']['condition']['text'] ?? "Unknown data",
        airquality =
            json['current']['air_quality']['us-epa-index'] ?? "Unknown data",
        pressure = json['current']['pressure_mb'] ?? "Unknown data",
        localtime = json['location']['localtime'] ?? "Unknown data",
        weekday2 = json['forecast']['forecastday'][1]['date'] ?? "Unknown data",
        weekday3 = json['forecast']['forecastday'][2]['date'] ?? "Unknown data",
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
