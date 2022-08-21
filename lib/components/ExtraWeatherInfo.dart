import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExtraWeatherInfo extends StatelessWidget {
  const ExtraWeatherInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          WeatherInfo(),
          WeatherInfo(),
          WeatherInfo(),
        ],
      ),
    );
  }

  Widget WeatherInfo() {
    return Column(
      children: [
        Icon(
          CupertinoIcons.wind,
          color: Colors.white,
          size: 30,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "50 km/h",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "WIND",
          style: TextStyle(
              fontSize: 16,
              color: Colors.blue.shade900,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
