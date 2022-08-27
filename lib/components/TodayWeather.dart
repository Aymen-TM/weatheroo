import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:weatheroo/pages/Detail.dart';

class TodayWeather extends StatelessWidget {
  const TodayWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Detail());
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              child: Row(
                children: [
                  Text("7 days",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
