import 'package:shared_preferences/shared_preferences.dart';

class MyWeatherPreferences {
  static SharedPreferences? _preferences;

  static const String _keyCity = "sehirAd";

  static const String _temp = "temp";

  static const String _feelsLikeTemp = "feelsLikeTemp";

  static const String _weatherState = "weatherState";

  static Future init() async {
    return _preferences = await SharedPreferences.getInstance();
  }

  static Future setCityName(String sehirAdi) async {
    return _preferences!.setString(_keyCity, sehirAdi);
  }

  static String? getCityName() => _preferences!.getString(_keyCity);

  static Future setTemp(double temp) async {
    return _preferences!.setDouble(_temp, temp);
  }

  static double? getTemp() => _preferences!.getDouble(_temp);

  static Future setFeelsLikeTemp(double temp) async {
    return _preferences!.setDouble(_feelsLikeTemp, temp);
  }

  static double? getFeelsLikeTemp() => _preferences!.getDouble(_feelsLikeTemp);

  static Future setWeatherState(String weatherState) async {
    return _preferences!.setString(_weatherState, weatherState);
  }

  static String? getWeatherState() => _preferences!.getString(_weatherState);
}
