import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_riverpod/constants/constants.dart';
import 'package:flutter_weatherapp_with_riverpod/model/weather_model.dart';
import 'package:sizer/sizer.dart';

import '../shared_preferences.dart';
import 'build_top_container.dart';

class BuildTopContainerItemTwo extends StatelessWidget {
  final Weather weather;
  const BuildTopContainerItemTwo({Key? key, required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyWeatherPreferences.setWeatherState(
        weather.forecast.forecastday![0].day!.condition!.text!);

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [BoxShadow(blurRadius: 4)],
                  borderRadius: BorderRadius.circular(10),
                  color: setThemeColor(weather),
                ),
                child: Center(
                  child: Text(
                    weather.forecast.forecastday![0].day!.condition!.text
                        .toString(),
                    textAlign: TextAlign.center,
                    style: EntireConstants.textStyleWhite,
                  ),
                ),
                width: 50.w,
                height: 9.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
