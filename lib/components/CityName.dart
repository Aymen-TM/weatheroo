import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityName extends StatefulWidget {
  const CityName(
      {Key? key,
      required this.city,
      required this.showSearchBar,
      required this.inputFocus})
      : super(key: key);
  final String city;
  final VoidCallback showSearchBar;
  final VoidCallback inputFocus;

  @override
  _CityNameState createState() => _CityNameState();
}

class _CityNameState extends State<CityName> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {widget.showSearchBar(), widget.inputFocus()},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.map_fill,
              color: Colors.white,
            ),
            Text(
              " " + widget.city,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
