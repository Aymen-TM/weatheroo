import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:weatheroo/Models/city_position.dart';

class City {
  final String apiKey = "54da34c13744fd34dac4883079a84b0e";
  String? name;

  City({
    required this.name,
  });

  String? getName() => name;

  setName(String? name) {
    name = name;
  }

  Future<CityPosition> getCityPosition() async {
    final currentWeatherUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=$name&appid=$apiKey";
    var res;
    var response = await http.get(Uri.parse(currentWeatherUrl));
    if (response.statusCode == 200) {
      res = json.decode(response.body);
    }
    CityPosition position = CityPosition(
        longitude: res["coord"]["lon"], latitude: res["coord"]["lat"]);
    return position;
  }
}
