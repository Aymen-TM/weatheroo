import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatheroo/components/CurrentWeather.dart';
import 'package:weatheroo/components/TimeWeather.dart';
import 'package:weatheroo/components/TodayWeather.dart';
import 'package:weatheroo/controller/HomeController.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030317),
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return FutureBuilder(
                future: controller.info(),
                builder:
                    ((BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          CurrentWeather(data: snapshot.data),
                          TodayWeather(),
                          TimeWeather()
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [CircularProgressIndicator()]),
                    );
                  }
                }));
          }),
    );
    ;
  }
}
