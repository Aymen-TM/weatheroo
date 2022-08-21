import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weatheroo/components/ExtraWeatherInfo.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GlowContainer(
        height: MediaQuery.of(context).size.height - 250,
        glowColor: const Color(0xff00A1FF),
        spreadRadius: 8,
        color: const Color(0xff00A1FF),
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        child: Column(
          children: <Widget>[
            Container(child: showSearchBar ? SearchInput() : CityName("test")),
            Container(
              margin: EdgeInsets.only(top: 25),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                "Updated",
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 4),
              ),
            ),
            CustomStack("DZ"),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            ExtraWeatherInfo()
          ],
        ),
      ),
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
        var temp;
        if (temp == null) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: const Color(0xff030317),
                  title: Text('City not found'),
                  content: Text('Pleas check the city name'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _ShowSearchBar();
                        },
                        child: Text("Ok"))
                  ],
                );
              });
        }
      },
    );
  }

  Widget CustomStack(city) {
    return Container(
      height: 220,
      child: Stack(
        children: <Widget>[
          Image(
            image: AssetImage("assets/sunny.png"),
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Column(children: [
                GlowText(
                  '27',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 40, height: 0.1),
                ),
                Text(
                  city,
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  "July 26 2022",
                  style: TextStyle(fontSize: 18),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
