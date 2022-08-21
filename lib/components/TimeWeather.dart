import 'package:flutter/material.dart';

class TimeWeather extends StatelessWidget {
  const TimeWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Weather(), Weather(), Weather(), Weather()],
    );
  }
}

class Weather extends StatelessWidget {
  const Weather({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.white, width: 1.0, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(children: [
        Text(
          '20',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          child: Image(
            image: AssetImage("assets/rainy_2d.png"),
            height: 50,
            width: 50,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "11",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        )
      ]),
    );
  }
}
