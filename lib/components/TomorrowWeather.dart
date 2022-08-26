import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class TomorrowWeather extends StatelessWidget {
  const TomorrowWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      glowColor: const Color(0xff00A1FF),
      spreadRadius: 8,
      color: const Color(0xff00A1FF),
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      child: Column(
        children: [
          UpperBar(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/rainy_2d.png"))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tomorrow",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GlowText("22",
                              style: TextStyle(
                                  fontSize: 100, fontWeight: FontWeight.bold)),
                          Text("/" + "50",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54.withOpacity(0.3)))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("clouds",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherInfo("Wind", "test"),
                      WeatherInfo("Wind", "test"),
                      WeatherInfo("Wind", "test"),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget WeatherInfo(element, info) {
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

class UpperBar extends StatelessWidget {
  const UpperBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Color(0xff00A1FF),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.chevron_left,
              color: Colors.white,
            ),
          ),
        ),
        Row(
          children: [
            Icon(
              CupertinoIcons.calendar,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "7 days",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Icon(
          CupertinoIcons.ellipsis_vertical,
          color: Colors.white,
        ),
      ],
    );
  }
}
