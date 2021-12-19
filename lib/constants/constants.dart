import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class EntireConstants {
  EntireConstants._();

//https://api.weatherapi.com/v1/forecast.json?key=d104fb63375240cdb81193359210409&days=7&q=izmir

  static const String API_KEY = "d104fb63375240cdb81193359210409";
  static const String BASE_URL =
      "https://api.weatherapi.com/v1/forecast.json?key=d104fb63375240cdb81193359210409&days=7&q=";

  static const textStyleWhite = TextStyle(color: Colors.white);
  static const textStyleWhite12Bold =
      TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold);

  static const textStyleWhite15Bold = TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

      static const textStyleWhite14Bold = TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static const textStyleWhite28Bold = TextStyle(
      color: Colors.white,
      fontSize: 28,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static const textColorIndogo = TextStyle(color: Colors.indigo);
  static const textColorIndigo14 =
      TextStyle(color: Colors.indigo, fontSize: 14);
  static const containerColorIndogo = Colors.indigo;
  static const errorStyleTextColor = TextStyle(
      color: Colors.red, fontSize: 14, shadows: [Shadow(blurRadius: 1)]);
  static const Color colorWhite = Colors.white;
  static const textColorBlue = TextStyle(
    color: Colors.blue,
  );
}
