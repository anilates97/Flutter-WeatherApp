import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_riverpod/constants/constants.dart';
import 'package:flutter_weatherapp_with_riverpod/model/weather_model.dart';
import 'package:sizer/sizer.dart';

import 'build_bottom_container_item_hours.dart';

class BuildBottomContainerItemDegreeTemps extends StatelessWidget {
  final Weather weather;
  const BuildBottomContainerItemDegreeTemps({Key? key, required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 24,
              itemBuilder: (context, index) {
                var images = getImage(index);
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 7.h,
                    decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(blurRadius: 0)],
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              weather.forecast.forecastday![0].hour![index]
                                      .tempC!
                                      .toStringAsFixed(1) +
                                  " °C",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: setThemeBottomItemColor(weather))),
                          Image.network(
                            images[0],
                            scale: 2,
                          ),
                          Text(
                              weather.forecast.forecastday![1].hour![index]
                                      .tempC!
                                      .toStringAsFixed(1) +
                                  " °C",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: setThemeBottomItemColor(weather))),
                          Image.network(
                            images[1],
                            scale: 2,
                          ),
                          Text(
                              weather.forecast.forecastday![2].hour![index]
                                      .tempC!
                                      .toStringAsFixed(1) +
                                  " °C",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: setThemeBottomItemColor(weather))),
                          Image.network(
                            images[2],
                            scale: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  List<String> getImage(int index) {
    String img1 = "http://" +
        weather.forecast.forecastday![0].hour![index].condition!.icon!
            .substring(
                2,
                weather.forecast.forecastday![0].hour![index].condition!.icon!
                    .length);
    String img2 = "http://" +
        weather.forecast.forecastday![1].hour![index].condition!.icon!
            .substring(
                2,
                weather.forecast.forecastday![1].hour![index].condition!.icon!
                    .length);
    String img3 = "http://" +
        weather.forecast.forecastday![2].hour![index].condition!.icon!
            .substring(
                2,
                weather.forecast.forecastday![2].hour![index].condition!.icon!
                    .length);

    return [img1, img2, img3];
  }
}
