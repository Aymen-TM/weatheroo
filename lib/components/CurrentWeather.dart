import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weatheroo/components/CityName.dart';
import 'package:weatheroo/components/CustomStack.dart';
import 'package:weatheroo/components/SearchInpute.dart';

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
        height: MediaQuery.of(context).size.height - 200,
        glowColor: const Color(0xff00A1FF),
        spreadRadius: 8,
        color: const Color(0xff00A1FF),
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        child: Column(
          children: <Widget>[
            Container(
                child: showSearchBar
                    ? SearchInpute(
                        focusNode: focusNode,
                        showSearchBar: _ShowSearchBar,
                      )
                    : CityName(
                        city: 'DZ',
                        showSearchBar: _ShowSearchBar,
                        inputFocus: _inputFocus)),
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
            CustomStack(
              city: "DZ",
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
