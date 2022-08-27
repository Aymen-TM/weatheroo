import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatheroo/Models/city.dart';
import 'package:weatheroo/Models/city_position.dart';
import 'package:weatheroo/Models/weather.dart';
import 'package:weatheroo/api/WeatherData.dart';
import 'package:weatheroo/pages/Home.dart';

class HomeController extends GetxController {
  var client = WeatherData();
  var lat;
  var long;
  var cityName;
  late Position pos;

  updatData(newCityName) async {
    City cityName = City(name: newCityName);
    CityPosition cityPos = await cityName.getCityPosition();
    lat = cityPos.latitude;
    long = cityPos.longitude;
    update();
  }

  Future<Weather> info() async {
    return await client.getWeather(lat, long);
  }

  getCurrentLocation() async {
    await Geolocator.requestPermission();
    pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest,
        forceAndroidLocationManager: true);
    lat = pos.latitude;
    long = pos.longitude;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }
}
