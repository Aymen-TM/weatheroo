import 'package:flutter/material.dart';
import 'package:weatheroo/components/CurrentWeather.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030317),
      body: Column(
        children: <Widget>[CurrentWeather()],
      ),
    );
  }
}
