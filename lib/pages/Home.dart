import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatheroo/Models/city.dart';
import 'package:weatheroo/Models/city_position.dart';
import 'package:weatheroo/Models/weather.dart';
import 'package:weatheroo/components/CurrentWeather.dart';
import 'package:weatheroo/components/TimeWeather.dart';
import 'package:weatheroo/components/TodayWeather.dart';
import 'package:weatheroo/api/WeatherData.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var client = WeatherData();
  late Future<Weather> data;
  late var lat;
  late var long;
  var cityName;
  late CityPosition cityPos;
  late Position pos;

  _updatData(newCityName) async {
    City cityName = City(name: newCityName);
    CityPosition cityPos = await cityName.getCityPosition();
    lat = cityPos.latitude;
    long = cityPos.longitude;
    setState(() {
      info(lat, long);
    });
  }

  Future<Weather> info(lat, long) async {
    return await client.getWeather(lat, long);
  }

  getCurrentLocation() async {
    await Geolocator.requestPermission();
    pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest,
        forceAndroidLocationManager: true);
    setState(() {
      lat = pos.latitude;
      long = pos.longitude;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030317),
      body: FutureBuilder(
          future: info(lat, long),
          builder: ((BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  CurrentWeather(data: snapshot.data, updatData: _updatData),
                  TodayWeather(),
                  TimeWeather()
                ],
              );
            } else {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [CircularProgressIndicator()]),
              );
            }
          })),
    );
  }
}
