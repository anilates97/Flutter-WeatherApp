import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_riverpod/constants/constants.dart';
import 'package:flutter_weatherapp_with_riverpod/model/weather_model.dart';
import 'package:sizer/sizer.dart';

import '../shared_preferences.dart';

class BuildTopContainerItem extends StatelessWidget {
  final Weather weather;

  double temp = 0;
  BuildTopContainerItem({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyWeatherPreferences.setTemp(weather.current.tempC!);
    temp = MyWeatherPreferences.getTemp() ?? 0;
    //print("sıcaklık:: $temp");
    //print("width :" + MediaQuery.of(context).size.width.toString());
    //print("height :" + MediaQuery.of(context).size.height.toString());
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text("sıcaklık",
                      style: EntireConstants.textStyleWhite14Bold),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: const [BoxShadow(blurRadius: 4)],
                        color: setThemeColor(weather),
                        borderRadius: BorderRadius.circular(10)),
                    /* width: MediaQuery.of(context).size.width - 290,
                    height: MediaQuery.of(context).size.height * 0.3, */
                    width: 30.w,
                    height: 9.5.h,
                    child: Center(
                      child: Text(weather.current.tempC.toString() + " °C",
                          style: EntireConstants.textStyleWhite),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text("maksimum",
                      style: EntireConstants.textStyleWhite14Bold),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: const [BoxShadow(blurRadius: 4)],
                        color: setThemeColor(weather),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                          weather.forecast.forecastday![0].day!.maxtempC
                                  .toString() +
                              " °C",
                          style: EntireConstants.textStyleWhite),
                    ),
                    width: 25.w,
                    height: 8.h,
                    /* width: MediaQuery.of(context).size.width - 310,
                    height: MediaQuery.of(context).size.height - 729, */
                  )
                ],
              ),
              Column(
                children: [
                  const Text("minimum",
                      style: EntireConstants.textStyleWhite14Bold),
                  const SizedBox(
                    height: 5,
                  ),
                  FittedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: const [BoxShadow(blurRadius: 4)],
                        borderRadius: BorderRadius.circular(10),
                        color: setThemeColor(weather),
                      ),
                      child: Center(
                        child: Text(
                            weather.forecast.forecastday![0].day!.mintempC
                                    .toString() +
                                " °C",
                            style: EntireConstants.textStyleWhite),
                      ),
                      width: 22.w,
                      height: 6.h,
                      /* width: MediaQuery.of(context).size.width - 332,
                      height: MediaQuery.of(context).size.height - 740, */
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Color setThemeColor(Weather weather) {
  var sehirDurum = weather.forecast.forecastday![0].day!.condition!.text;
  switch (sehirDurum) {
    case 'Güneşli':
      return Colors.deepOrange;
    case 'Parçalı Bulutlu':
      return Colors.blue;
    default:
      //Yağmurlu havalar ve bulutlu havalar için
      return Colors.indigo;
  }
}
