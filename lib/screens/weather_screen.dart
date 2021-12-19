import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weatherapp_with_riverpod/constants/constants.dart';
import 'package:flutter_weatherapp_with_riverpod/model/weather_model.dart';
import 'package:flutter_weatherapp_with_riverpod/providers/providers.dart';
import 'package:flutter_weatherapp_with_riverpod/screens/home_screen.dart';
import 'package:flutter_weatherapp_with_riverpod/widgets/build_bottom_container_item.dart';
import 'package:flutter_weatherapp_with_riverpod/widgets/build_bottom_container_item_degree_temps.dart';
import 'package:flutter_weatherapp_with_riverpod/widgets/build_bottom_container_item_hours.dart';
import 'package:flutter_weatherapp_with_riverpod/widgets/build_top_container.dart';
import 'package:flutter_weatherapp_with_riverpod/widgets/build_top_container_two.dart';
import 'package:flutter_weatherapp_with_riverpod/widgets/loading_screen.dart';
import 'package:sizer/sizer.dart';

import '../shared_preferences.dart';
import 'error_screen.dart';

class WeatherScreen extends ConsumerWidget {
  ScrollPhysics? scrollPhysics = ScrollPhysics();
  String? sehir;

  bool veriVarmi = false;
  Weather? weather;
  WeatherScreen({Key? key, this.sehir}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    MyWeatherPreferences.setCityName(sehir!);

    String getSehirPref(String sehirAdi) {
      return sehirAdi;
    }

    final colorProvider = watch(getColorProvider(sehir!));
    return colorProvider.when(
        data: (weather) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primaryColor: Colors.deepOrange),
            home: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () => Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => HomeScreen())),
                    icon: const Icon(Icons.arrow_back_ios)),
                backgroundColor: setThemeColor(weather),
                title: Text(sehir!.toUpperCase()),
              ),
              body: RefreshIndicator(
                onRefresh: () {
                  veriVarmi = true;
                  return context.refresh(getWeatherProvider(sehir!));
                },
                child: Container(
                  decoration: BoxDecoration(image: buildBackWalpaper(weather)),
                  child: ListView(
                    physics: scrollPhysics!.parent,
                    children: [
                      Consumer(
                        builder: (context, watch, index) {
                          final provider = watch(getWeatherProvider(sehir!));
                          return provider.when(
                              data: (weather) {
                                MyWeatherPreferences.setFeelsLikeTemp(
                                    weather.current.feelslikeC!);
                                veriVarmi = true;
                                String img = "http://" +
                                    weather.forecast.forecastday![0].day!
                                        .condition!.icon!
                                        .substring(
                                            2,
                                            weather.forecast.forecastday![0]
                                                .day!.condition!.icon!.length);
                                Future.delayed(const Duration(seconds: 5));
                                return Column(
                                  children: [
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.indigo.withOpacity(0.15),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: double.infinity,
                                        height: 65.h,
                                        child: Container(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(children: [
                                            Container(
                                              width: 37.w,
                                              height: 12.h,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(blurRadius: 4)
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color:
                                                      setThemeColor(weather)),
                                              child: Image(
                                                image: NetworkImage(img,
                                                    scale: 0.65),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: 75.w,
                                              height: 10.h,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 2,
                                                      color: Colors.indigo),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        blurRadius: 50,
                                                        color: Colors.black)
                                                  ],
                                                  color: Colors.white
                                                      .withOpacity(0.9),
                                                  borderRadius:
                                                      const BorderRadius
                                                              .vertical(
                                                          bottom:
                                                              Radius.circular(
                                                                  15))),
                                              child: Center(
                                                child: Text(
                                                  weather.location.name
                                                      .toUpperCase(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: setThemeColor(
                                                          weather),
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            BuildTopContainerItem(
                                              weather: weather,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            BuildTopContainerItemTwo(
                                              weather: weather,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    const Text(
                                                      "nem",
                                                      style: EntireConstants
                                                          .textStyleWhite14Bold,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: const [
                                                          BoxShadow(
                                                              blurRadius: 10)
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: EntireConstants
                                                            .colorWhite,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                            weather.current
                                                                .humidity
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: setThemeColor(
                                                                    weather))),
                                                      ),
                                                      width: 20.w,
                                                      height: 4.h,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    const Text(
                                                      "son güncelleme",
                                                      style: EntireConstants
                                                          .textStyleWhite14Bold,
                                                    ),
                                                    Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: const [
                                                            BoxShadow(
                                                                blurRadius: 10)
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.white,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                              weather.location
                                                                  .localtime!,
                                                              style: TextStyle(
                                                                  fontSize: 11,
                                                                  color: setThemeColor(
                                                                      weather))),
                                                        ),
                                                        width: 28.w,
                                                        height: 4.h),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    buildConstContainer(),
                                    SingleChildScrollView(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        margin: const EdgeInsets.all(15),
                                        padding: const EdgeInsets.all(15),
                                        //width: 300.w,
                                        height: 320.h,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            BuildBottomContainerItem(
                                                sehir: weather),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                buildThreeWidgetRow(weather),
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 17.w,
                                                          child:
                                                              BuildBottomContainerItemHours(
                                                                  weather:
                                                                      weather),
                                                        ),
                                                        Container(
                                                          width: 65.9.w,
                                                          child:
                                                              BuildBottomContainerItemDegreeTemps(
                                                                  weather:
                                                                      weather),
                                                        ),
                                                      ],
                                                    ),
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          width: 300.w,
                                                          height: 50.h,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "img/sunrise.png"),
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  scale: 40)),
                                                        ),
                                                        Positioned(
                                                          bottom: 235,
                                                          left: 147,
                                                          child: Text(
                                                            weather
                                                                .forecast
                                                                .forecastday![0]
                                                                .astro!
                                                                .sunrise
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 90,
                                                          left: 147,
                                                          child: Text(
                                                            weather
                                                                .forecast
                                                                .forecastday![0]
                                                                .astro!
                                                                .sunset
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white24,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25)),
                                                              child: Image(
                                                                width: 90.w,
                                                                image: AssetImage(
                                                                    "img/wind.gif"),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Text("rüzgar",
                                                                      style: EntireConstants
                                                                          .textStyleWhite14Bold),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                            blurRadius:
                                                                                10)
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: EntireConstants
                                                                          .colorWhite,
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child: Text(
                                                                          weather.current.windKph.toString() +
                                                                              " km",
                                                                          style:
                                                                              TextStyle(color: setThemeColor(weather))),
                                                                    ),
                                                                    width: 22.w,
                                                                    height: 5.h,
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  Text("basınç",
                                                                      style: EntireConstants
                                                                          .textStyleWhite14Bold),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                            blurRadius:
                                                                                10)
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: EntireConstants
                                                                          .colorWhite,
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child: Text(
                                                                          weather.current.pressureMb.toString() +
                                                                              " mb",
                                                                          style:
                                                                              TextStyle(color: setThemeColor(weather))),
                                                                    ),
                                                                    width: 22.w,
                                                                    height: 5.h,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      width: 90.w,
                                                      height: 52.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 25,
                                                    ),
                                                    Text("hissedilen sıcaklık",
                                                        style: EntireConstants
                                                            .textStyleWhite14Bold),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: const [
                                                          BoxShadow(
                                                              blurRadius: 10)
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: EntireConstants
                                                            .colorWhite,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                            weather.current
                                                                    .feelslikeC
                                                                    .toString() +
                                                                " °C",
                                                            style: TextStyle(
                                                                color: setThemeColor(
                                                                    weather))),
                                                      ),
                                                      width: 22.w,
                                                      height: 5.h,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                              loading: () {
                                return const LoadingScreen();
                              },
                              error: (e, s) => const ErrorScreen());
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        loading: () {
          return const LoadingScreen();
        },
        error: (e, s) => const ErrorScreen());
  }
}

void changeAppBarColor(Weather weather) {
  buildColor(weather);
  Scaffold(
    appBar: AppBar(
      backgroundColor: buildColor(weather),
      title: Text(weather.location.name),
    ),
  );
}

Color buildColor(Weather weather) {
  switch (weather.forecast.forecastday![0].day!.condition!.text) {
    case 'Güneşli':
      return Colors.deepOrange;
    case 'Parçalı Bulutlu':
      return Colors.blue;
    default:
      //Yağmurlu havalar ve bulutlu havalar için
      return Colors.indigo;
  }
}

DecorationImage buildBackWalpaper(Weather weather) {
  switch (weather.forecast.forecastday![0].day!.condition!.text) {
    case 'Güneşli':
      return const DecorationImage(
          image: AssetImage("img/sun.gif"), fit: BoxFit.cover);
    case 'Parçalı Bulutlu':
    case 'Bulutlu':
    case 'Çok bulutlu':
      return const DecorationImage(
          image: AssetImage("img/parcaBulut.gif"), fit: BoxFit.cover);
    case 'Sisli':
      return const DecorationImage(
          image: AssetImage("img/sis.gif"), fit: BoxFit.cover);
    default:
      return const DecorationImage(
          image: AssetImage("img/rainy.gif"), fit: BoxFit.cover);
  }
}

Widget buildConstContainer() {
  return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: EntireConstants.colorWhite,
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("3 Günlük Hava Tahmini"),
      ));
}

Widget buildThreeWidgetRow(Weather weather) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
            color: Colors.white,
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "saat",
              style: TextStyle(color: Color(0xFF120C36)),
            ),
          )),
      Container(
          decoration: BoxDecoration(
            color: setThemeColor(weather),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "sıcaklık",
              style: TextStyle(color: Colors.white),
            ),
          )),
      Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(15)),
              color: Colors.white),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "hava",
              style: TextStyle(color: Color(0xFF120C36)),
            ),
          )),
    ],
  );
}
