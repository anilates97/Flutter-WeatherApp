import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weatherapp_with_riverpod/screens/weather_screen.dart';
import 'package:flutter_weatherapp_with_riverpod/services/firebase_notification_service.dart';

import 'package:flutter_weatherapp_with_riverpod/services/notification_service.dart';
import 'package:flutter_weatherapp_with_riverpod/shared_preferences.dart';

import 'package:flutter_weatherapp_with_riverpod/widgets/my_input_field.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sizer/sizer.dart';

import 'weather_gps_screen.dart';

class HomeScreen extends ConsumerWidget {
  double lat = 0.0;
  double long = 0.0;

  List<double>? location = <double>[];
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    // void getCurrentLocation() async {
    //   var position = await Geolocator.getCurrentPosition(
    //       desiredAccuracy: LocationAccuracy.high);

    //   lat = position.latitude;
    //   long = position.longitude;
    //   location!.add(lat);
    //   location!.add(long);
    //   //print(
    //   //   "lat:" + location![0].toString() + "long:" + location![1].toString());
    // }

    //crSeateNotification();

    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Hava Durumu"),
      ),
      body: Center(
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/giphy.gif"), fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(15),
                        height: 50.h,
                        //width: 100.w,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyInput(onSaved: (value) async {
                              await MyWeatherPreferences.setCityName(value);
                            }),
                            SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.indigo),
                                onPressed: () async {
                                  var position =
                                      await Geolocator.getCurrentPosition(
                                          desiredAccuracy:
                                              LocationAccuracy.high);

                                  lat = position.latitude;
                                  long = position.longitude;
                                  location!.add(lat);
                                  location!.add(long);

                                  if (lat > 1) {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (_) => WeatherGPSScreen(
                                                  lat: lat,
                                                  long: long,
                                                )));
                                  }
                                },
                                child: Text("Konumu Bul"))
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ))),
    );
  }
}

//ListView.builder(itemCount: ,itemBuilder: itemBuilder)