import 'package:weatheroo/Models/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherData {
  Future<Weather> getWeather(lat, lon,
      {apikey = "54da34c13744fd34dac4883079a84b0e"}) async {
    String currentWeatherUrl =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey&units=metric";
    var response = await http.get(Uri.parse(currentWeatherUrl));
    var body = json.decode(response.body);
    return Weather.fromJSON(body);
  }
}
