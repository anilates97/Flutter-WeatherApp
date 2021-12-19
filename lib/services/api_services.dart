import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_weatherapp_with_riverpod/constants/constants.dart';
import 'package:flutter_weatherapp_with_riverpod/model/weather_model.dart';

class WeatherService {
  WeatherService._();
  static final instance = WeatherService._();

  Future<Weather> getWeather(String sehirAdi) async {
    final url = EntireConstants.BASE_URL + sehirAdi + "&lang=tr";
    print("metot çalıştı");
    Dio dio = Dio();
    //Eski telefonlar için
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final response = await dio.get(url);

    //print(response);
    if (response.statusCode == 200) {
      print("ifin içindeyim");

      final responseJSONWeather = Weather.fromJson(response.data);

      print(responseJSONWeather.current.cloud);
      return responseJSONWeather;
    } else {
      throw Exception("404 NOT FOUND");
    }
  }

  Future<Weather> getWeatherState(String sehirAdi) async {
    final url = EntireConstants.BASE_URL + sehirAdi + "&lang=tr";
    print("metot çalıştı");

    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    print(url);
    final response = await dio.get(url);

    //print(response);
    if (response.statusCode == 200) {
      print("ifin içindeyim");

      final responseJSONWeather = Weather.fromJson(response.data);

      print(responseJSONWeather.current.cloud);
      return responseJSONWeather;
    } else {
      throw Exception("404 NOT FOUND");
    }
  }

  Future<Weather> getWeatherWithLocation(double lat, double lon) async {
    final url = EntireConstants.BASE_URL + "$lat,$lon" + "&lang=tr";
    print("gps url: " + url);
    final response = await Dio().get(url);

    //print(response);
    if (response.statusCode == 200) {
      print("ifin içindeyim");

      final responseJSONWeather = Weather.fromJson(response.data);

      print(responseJSONWeather.current.cloud);
      return responseJSONWeather;
    } else {
      throw Exception("404 NOT FOUND");
    }
  }
}
