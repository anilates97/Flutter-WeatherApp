import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weatherapp_with_riverpod/model/weather_model.dart';

import 'package:flutter_weatherapp_with_riverpod/services/api_services.dart';

WeatherService weatherService = WeatherService.instance;

Future<Weather> getWeather(String sehirAdi) async {
  return await weatherService.getWeather(sehirAdi);
}

Future<Weather> getWeatherState(String sehirAdi) async {
  return await weatherService.getWeatherState(sehirAdi);
}

Future<Weather> getWeatherStateGPS(double lat, double long) async {
  return await weatherService.getWeatherWithLocation(lat, long);
}

Future<Weather> getWeatherWithLocation(double lat, double lon) async {
  return await weatherService.getWeatherWithLocation(lat, lon);
}

String getPref(String sehirAdi) {
  return sehirAdi;
}

final getWeatherProvider = FutureProvider.family<Weather, String>(
    (ref, sehirAdi) => getWeather(sehirAdi));

final getColorProvider = FutureProvider.family<Weather, String>(
    (ref, havaAciklama) => getWeatherState(havaAciklama));

final getColorGPSProvider = FutureProvider.family<Weather, List<double>>(
    (ref, location) => getWeatherStateGPS(location[0], location[1]));

final getWeatherWithGPSProvider = FutureProvider.family<Weather, List<double>>(
    (ref, location) => getWeatherWithLocation(location[0], location[1]));

final sharedProvider = Provider.family<String,String>((ref,sehir) => getPref(sehir));
