// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names

class WeatherModel {
  const WeatherModel(
      {required this.icon_url,
      required this.temperature,
      required this.city,
      required this.condition,
      required this.airquality});

  final String icon_url;
  final double temperature;
  final String city;
  final String condition;
  final int airquality;

  WeatherModel.fromJson(Map<String, dynamic> json)
      : icon_url = "http:" + json['current']['condition']['icon'],
        temperature = json['current']['temp_c'] + 0.0,
        city = json['location']['name'],
        condition = json['current']['condition']['text'],
        airquality = json['current']['air_quality']['us-epa-index'];
}
