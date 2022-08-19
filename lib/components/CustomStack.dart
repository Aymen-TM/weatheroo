import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class CustomStack extends StatefulWidget {
  const CustomStack({Key? key, required this.city}) : super(key: key);
  final String city;
  @override
  State<CustomStack> createState() => _CustomStackState();
}

class _CustomStackState extends State<CustomStack> {
  @override
  Widget build(BuildContext context) {
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
                  widget.city,
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
