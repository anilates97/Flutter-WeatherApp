import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_riverpod/constants/constants.dart';
import 'package:flutter_weatherapp_with_riverpod/model/weather_model.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'build_top_container.dart';

class BuildBottomContainerItem extends StatelessWidget {
  List<Weather> weather = [];
  final Weather sehir;
  BuildBottomContainerItem({Key? key, required this.sehir}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildRowTitle());
  }

  Widget _buildRowTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: _buildDateTitle(),
        ),
      ],
    );
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  Widget _buildDateTitle() {
    return Row(
      children: [
        Container(
          width: 24.w,
          decoration: BoxDecoration(
              boxShadow: const [BoxShadow(blurRadius: 4)],
              color: setThemeColor(sehir),
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              convertDateTimeDisplay(
                  sehir.forecast.forecastday![0].date.toString()),
              style: const TextStyle(fontSize: 11, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          width: 24.w,
          decoration: BoxDecoration(
              boxShadow: const [BoxShadow(blurRadius: 4)],
              color: setThemeColor(sehir),
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              convertDateTimeDisplay(
                  sehir.forecast.forecastday![1].date.toString()),
              style: const TextStyle(fontSize: 11, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          width: 24.w,
          decoration: BoxDecoration(
              boxShadow: const [BoxShadow(blurRadius: 4)],
              color: setThemeColor(sehir),
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              convertDateTimeDisplay(
                  sehir.forecast.forecastday![2].date.toString()),
              style: const TextStyle(fontSize: 11, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
