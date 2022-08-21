import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatheroo/components/TomorrowWeather.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030317),
      body: Column(
        children: [
          TomorrowWeather(),
          SizedBox(
            height: 10,
          ),
          SevenDays()
        ],
      ),
    );
  }
}

Widget SevenDays() {
  return Expanded(
      child: ListView.builder(
    itemCount: 7,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Mon",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            Container(
              child: Row(
                children: [
                  Image(
                    image: AssetImage("assets/rainy_2d.png"),
                    width: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Rainy",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            Container(
              child: Row(children: [
                Text("+" + "20" + "\u2109",
                    style: TextStyle(fontSize: 20, color: Colors.grey)),
                SizedBox(
                  width: 10,
                ),
                Text("+" + "15" + "\u2109",
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
              ]),
            )
          ],
        ),
      );
    },
  ));
}
