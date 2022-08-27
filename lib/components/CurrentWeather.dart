import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatheroo/Models/weather.dart';
import 'package:weatheroo/controller/HomeController.dart';
import 'package:weatheroo/pages/Home.dart';

class CurrentWeather extends StatefulWidget {
  final Weather data;
  const CurrentWeather({Key? key, required this.data}) : super(key: key);

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  bool showSearchBar = false;
  var focusNode = FocusNode();

  void _ShowSearchBar() {
    setState(() {
      showSearchBar = !showSearchBar;
    });
  }

  void _inputFocus() {
    focusNode.requestFocus();
  }

  getDateFormat(seconds) {
    final DateTime currentDate =
        DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
    final DateFormat date = DateFormat('EEEE d MMMM');
    final String formatted = date.format(currentDate);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GetBuilder<HomeController>(builder: (controller) {
        return GlowContainer(
          height: MediaQuery.of(context).size.height - 250,
          glowColor: const Color(0xff00A1FF),
          spreadRadius: 8,
          color: const Color(0xff00A1FF),
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60)),
          child: Column(
            children: <Widget>[
              Container(
                  child: showSearchBar
                      ? SearchInput()
                      : CityName(widget.data.name)),
              Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  "Updated",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, letterSpacing: 4),
                ),
              ),
              CustomStack(widget.data.weatherDescription, widget.data.temp,
                  widget.data.dt),
              Divider(
                thickness: 1,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WeatherInfo("Wind", widget.data.windSpeed + " m/s",
                        CupertinoIcons.wind),
                    WeatherInfo("Pressure", widget.data.pressure + " hPa",
                        CupertinoIcons.thermometer),
                    WeatherInfo("Humidity", widget.data.humidity + " %",
                        CupertinoIcons.drop),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget CityName(cityname) {
    return GestureDetector(
        onTap: () => {_ShowSearchBar(), _inputFocus()},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.map_fill,
              color: Colors.white,
            ),
            Text(
              " " + cityname,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }

  Widget SearchInput() {
    return GetBuilder<HomeController>(builder: (controller) {
      return TextField(
        style: const TextStyle(color: Colors.white),
        autofocus: true,
        focusNode: focusNode,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          fillColor: const Color(0xff030317),
          filled: true,
          hintText: 'Enter a City Name',
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          _ShowSearchBar();
          controller.updatData(value);
        },
      );
    });
  }

  Widget CustomStack(city, temp, date) {
    return Container(
      height: 220,
      child: Stack(
        children: <Widget>[
          Image(
            image: AssetImage(widget.data.getWeatherImage("Clouds")),
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Column(children: [
                GlowText(
                  temp,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 40, height: 0.1),
                ),
                Text(
                  city,
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  getDateFormat(date),
                  style: TextStyle(fontSize: 18),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }

  Widget WeatherInfo(element, info, img) {
    return Column(
      children: [
        Icon(
          img,
          color: Colors.white,
          size: 30,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          info,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          element,
          style: TextStyle(
              fontSize: 16,
              color: Colors.blue.shade900,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
