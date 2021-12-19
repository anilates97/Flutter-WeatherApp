import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_riverpod/constants/constants.dart';
import 'package:flutter_weatherapp_with_riverpod/model/weather_model.dart';
import 'package:sizer/sizer.dart';

class BuildBottomContainerItemHours extends StatelessWidget {
  final Weather weather;
  final List<String> hours = [
    '00.00',
    '01.00',
    '02.00',
    '03.00',
    '04.00',
    '05.00',
    '06.00',
    '07.00',
    '08.00',
    '09.00',
    '10.00',
    '11.00',
    '12.00',
    '13.00',
    '14.00',
    '15.00',
    '16.00',
    '17.00',
    '18.00',
    '19.00',
    '20.00',
    '21.00',
    '22.00',
    '23.00'
  ];
  BuildBottomContainerItemHours({Key? key, required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: hours.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 7.h,
                    width: 500,
                    decoration: BoxDecoration(
                        boxShadow: const [BoxShadow(blurRadius: 2)],
                        color: setThemeBottomItemColor(weather),
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          hours[index],
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}

Color setThemeBottomItemColor(Weather weather) {
  switch (weather.forecast.forecastday![0].day!.condition!.text) {
    case 'Güneşli':
      return Colors.orange;
    case 'Parçalı Bulutlu':
    case 'Bölgesel düzensiz yağmur yağışlı':
      return Colors.blue;
    default:
      //Yağmurlu havalar ve bulutlu havalar için
      return Colors.indigo;
  }
}
