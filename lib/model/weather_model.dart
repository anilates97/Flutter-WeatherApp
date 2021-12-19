// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
    Weather({
        required this.location,
        required this.current,
        required this.forecast,
    });

    Location location;
    Current current;
    Forecast forecast;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
        forecast: Forecast.fromJson(json["forecast"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
        "forecast": forecast.toJson(),
    };
}

class Current {
    Current({
        this.lastUpdatedEpoch,
        this.lastUpdated,
        this.tempC,
        this.tempF,
        this.isDay,
        this.condition,
        this.windMph,
        this.windKph,
        this.windDegree,
        this.windDir,
        this.pressureMb,
        this.pressureIn,
        this.precipMm,
        this.precipIn,
        this.humidity,
        this.cloud,
        this.feelslikeC,
        this.feelslikeF,
        this.visKm,
        this.visMiles,
        this.uv,
        this.gustMph,
        this.gustKph,
    });

    int? lastUpdatedEpoch;
    String? lastUpdated;
    double? tempC;
    double? tempF;
    int? isDay;
    Condition? condition;
    double? windMph;
    double? windKph;
    int? windDegree;
    String? windDir;
    double? pressureMb;
    double? pressureIn;
    double? precipMm;
    double? precipIn;
    int? humidity;
    int? cloud;
    double? feelslikeC;
    double? feelslikeF;
    double? visKm;
    double? visMiles;
    double? uv;
    double? gustMph;
    double? gustKph;

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"] ?? null,
        lastUpdated: json["last_updated"] ?? null,
        tempC: json["temp_c"] ?? null,
        tempF: json["temp_f"] ?? null,
        isDay: json["is_day"] ?? null,
        condition: Condition.fromJson(json["condition"]) ,
        windMph: json["wind_mph"].toDouble() ?? null,
        windKph: json["wind_kph"] ?? null,
        windDegree: json["wind_degree"] ?? null,
        windDir: json["wind_dir"] ?? null,
        pressureMb: json["pressure_mb"] ?? null,
        pressureIn: json["pressure_in"].toDouble() ?? null,
        precipMm: json["precip_mm"] ?? null,
        precipIn: json["precip_in"] ?? null,
        humidity: json["humidity"] ?? null,
        cloud: json["cloud"] ?? null,
        feelslikeC: json["feelslike_c"].toDouble() ?? null,
        feelslikeF: json["feelslike_f"].toDouble() ?? null,
        visKm: json["vis_km"] ?? null,
        visMiles: json["vis_miles"] ?? null,
        uv: json["uv"] ?? null,
        gustMph: json["gust_mph"] ?? null,
        gustKph: json["gust_kph"].toDouble() ?? null,
    );

    Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch == null ? null : lastUpdatedEpoch,
        "last_updated": lastUpdated == null ? null : lastUpdated,
        "temp_c": tempC == null ? null : tempC,
        "temp_f": tempF == null ? null : tempF,
        "is_day": isDay == null ? null : isDay,
        "condition": condition == null ? null : condition!.toJson(),
        "wind_mph": windMph == null ? null : windMph,
        "wind_kph": windKph == null ? null : windKph,
        "wind_degree": windDegree == null ? null : windDegree,
        "wind_dir": windDir == null ? null : windDir,
        "pressure_mb": pressureMb == null ? null : pressureMb,
        "pressure_in": pressureIn == null ? null : pressureIn,
        "precip_mm": precipMm == null ? null : precipMm,
        "precip_in": precipIn == null ? null : precipIn,
        "humidity": humidity == null ? null : humidity,
        "cloud": cloud == null ? null : cloud,
        "feelslike_c": feelslikeC == null ? null : feelslikeC,
        "feelslike_f": feelslikeF == null ? null : feelslikeF,
        "vis_km": visKm == null ? null : visKm,
        "vis_miles": visMiles == null ? null : visMiles,
        "uv": uv == null ? null : uv,
        "gust_mph": gustMph == null ? null : gustMph,
        "gust_kph": gustKph == null ? null : gustKph,
    };
}

class Condition {
    Condition({
        this.text,
        this.icon,
        this.code,
    });

    String? text;
    String? icon;
    int? code;

    factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"] ?? null,
        icon: json["icon"] ?? null,
        code: json["code"] ?? null,
    );

    Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "icon": icon == null ? null : icon,
        "code": code == null ? null : code,
    };
}

class Forecast {
    Forecast({
        this.forecastday,
    });

    List<Forecastday>? forecastday;

    factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: json["forecastday"] == null ? null : List<Forecastday>.from(json["forecastday"].map((x) => Forecastday.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "forecastday": forecastday == null ? null : List<dynamic>.from(forecastday!.map((x) => x.toJson())),
    };
}

class Forecastday {
    Forecastday({
        this.date,
        this.dateEpoch,
        this.day,
        this.astro,
        this.hour,
    });

    DateTime? date;
    int? dateEpoch;
    Day? day;
    Astro? astro;
    List<Hour>? hour;

    factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"] == null ? null : json["date_epoch"],
        day: json["day"] == null ? null : Day.fromJson(json["day"]),
        astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
        hour: json["hour"] == null ? null : List<Hour>.from(json["hour"].map((x) => Hour.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "date": date == null ? null : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "date_epoch": dateEpoch == null ? null : dateEpoch,
        "day": day == null ? null : day!.toJson(),
        "astro": astro == null ? null : astro!.toJson(),
        "hour": hour == null ? null : List<dynamic>.from(hour!.map((x) => x.toJson())),
    };
}

class Astro {
    Astro({
        this.sunrise,
        this.sunset,
        this.moonrise,
        this.moonset,
        this.moonPhase,
        this.moonIllumination,
    });

    String? sunrise;
    String? sunset;
    String? moonrise;
    String? moonset;
    String? moonPhase;
    String? moonIllumination;

    factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
        moonrise: json["moonrise"] == null ? null : json["moonrise"],
        moonset: json["moonset"] == null ? null : json["moonset"],
        moonPhase: json["moon_phase"] == null ? null : json["moon_phase"],
        moonIllumination: json["moon_illumination"] == null ? null : json["moon_illumination"],
    );

    Map<String, dynamic> toJson() => {
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
        "moonrise": moonrise == null ? null : moonrise,
        "moonset": moonset == null ? null : moonset,
        "moon_phase": moonPhase == null ? null : moonPhase,
        "moon_illumination": moonIllumination == null ? null : moonIllumination,
    };
}

class Day {
    Day({
        this.maxtempC,
        this.maxtempF,
        this.mintempC,
        this.mintempF,
        this.avgtempC,
        this.avgtempF,
        this.maxwindMph,
        this.maxwindKph,
        this.totalprecipMm,
        this.totalprecipIn,
        this.avgvisKm,
        this.avgvisMiles,
        this.avghumidity,
        this.dailyWillItRain,
        this.dailyChanceOfRain,
        this.dailyWillItSnow,
        this.dailyChanceOfSnow,
        this.condition,
        this.uv,
    });

    double? maxtempC;
    double? maxtempF;
    double? mintempC;
    double? mintempF;
    double? avgtempC;
    double? avgtempF;
    double? maxwindMph;
    double? maxwindKph;
    double? totalprecipMm;
    double? totalprecipIn;
    double? avgvisKm;
    double? avgvisMiles;
    double? avghumidity;
    int? dailyWillItRain;
    int? dailyChanceOfRain;
    int? dailyWillItSnow;
    int? dailyChanceOfSnow;
    Condition? condition;
    double? uv;

    factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: json["maxtemp_c"] == null ? null : json["maxtemp_c"].toDouble(),
        maxtempF: json["maxtemp_f"] == null ? null : json["maxtemp_f"].toDouble(),
        mintempC: json["mintemp_c"] == null ? null : json["mintemp_c"].toDouble(),
        mintempF: json["mintemp_f"] == null ? null : json["mintemp_f"].toDouble(),
        avgtempC: json["avgtemp_c"] == null ? null : json["avgtemp_c"].toDouble(),
        avgtempF: json["avgtemp_f"] == null ? null : json["avgtemp_f"].toDouble(),
        maxwindMph: json["maxwind_mph"] == null ? null : json["maxwind_mph"].toDouble(),
        maxwindKph: json["maxwind_kph"] == null ? null : json["maxwind_kph"].toDouble(),
        totalprecipMm: json["totalprecip_mm"] == null ? null : json["totalprecip_mm"].toDouble(),
        totalprecipIn: json["totalprecip_in"] == null ? null : json["totalprecip_in"].toDouble(),
        avgvisKm: json["avgvis_km"] == null ? null : json["avgvis_km"],
        avgvisMiles: json["avgvis_miles"] == null ? null : json["avgvis_miles"],
        avghumidity: json["avghumidity"] == null ? null : json["avghumidity"],
        dailyWillItRain: json["daily_will_it_rain"] == null ? null : json["daily_will_it_rain"],
        dailyChanceOfRain: json["daily_chance_of_rain"] == null ? null : json["daily_chance_of_rain"],
        dailyWillItSnow: json["daily_will_it_snow"] == null ? null : json["daily_will_it_snow"],
        dailyChanceOfSnow: json["daily_chance_of_snow"] == null ? null : json["daily_chance_of_snow"],
        condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
        uv: json["uv"] == null ? null : json["uv"],
    );

    Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC == null ? null : maxtempC,
        "maxtemp_f": maxtempF == null ? null : maxtempF,
        "mintemp_c": mintempC == null ? null : mintempC,
        "mintemp_f": mintempF == null ? null : mintempF,
        "avgtemp_c": avgtempC == null ? null : avgtempC,
        "avgtemp_f": avgtempF == null ? null : avgtempF,
        "maxwind_mph": maxwindMph == null ? null : maxwindMph,
        "maxwind_kph": maxwindKph == null ? null : maxwindKph,
        "totalprecip_mm": totalprecipMm == null ? null : totalprecipMm,
        "totalprecip_in": totalprecipIn == null ? null : totalprecipIn,
        "avgvis_km": avgvisKm == null ? null : avgvisKm,
        "avgvis_miles": avgvisMiles == null ? null : avgvisMiles,
        "avghumidity": avghumidity == null ? null : avghumidity,
        "daily_will_it_rain": dailyWillItRain == null ? null : dailyWillItRain,
        "daily_chance_of_rain": dailyChanceOfRain == null ? null : dailyChanceOfRain,
        "daily_will_it_snow": dailyWillItSnow == null ? null : dailyWillItSnow,
        "daily_chance_of_snow": dailyChanceOfSnow == null ? null : dailyChanceOfSnow,
        "condition": condition == null ? null : condition!.toJson(),
        "uv": uv == null ? null : uv,
    };
}

class Hour {
    Hour({
        this.timeEpoch,
        this.time,
        this.tempC,
        this.tempF,
        this.isDay,
        this.condition,
        this.windMph,
        this.windKph,
        this.windDegree,
        this.windDir,
        this.pressureMb,
        this.pressureIn,
        this.precipMm,
        this.precipIn,
        this.humidity,
        this.cloud,
        this.feelslikeC,
        this.feelslikeF,
        this.windchillC,
        this.windchillF,
        this.heatindexC,
        this.heatindexF,
        this.dewpointC,
        this.dewpointF,
        this.willItRain,
        this.chanceOfRain,
        this.willItSnow,
        this.chanceOfSnow,
        this.visKm,
        this.visMiles,
        this.gustMph,
        this.gustKph,
        this.uv,
    });

    int? timeEpoch;
    String? time;
    double? tempC;
    double? tempF;
    int? isDay;
    Condition? condition;
    double? windMph;
    double? windKph;
    int? windDegree;
    String? windDir;
    double? pressureMb;
    double? pressureIn;
    double? precipMm;
    double? precipIn;
    int? humidity;
    int? cloud;
    double? feelslikeC;
    double? feelslikeF;
    double? windchillC;
    double? windchillF;
    double? heatindexC;
    double? heatindexF;
    double? dewpointC;
    double? dewpointF;
    int? willItRain;
    int? chanceOfRain;
    int? willItSnow;
    int? chanceOfSnow;
    double? visKm;
    double? visMiles;
    double? gustMph;
    double? gustKph;
    double? uv;

    factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        timeEpoch: json["time_epoch"] == null ? null : json["time_epoch"],
        time: json["time"] == null ? null : json["time"],
        tempC: json["temp_c"] == null ? null : json["temp_c"].toDouble(),
        tempF: json["temp_f"] == null ? null : json["temp_f"].toDouble(),
        isDay: json["is_day"] == null ? null : json["is_day"],
        condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"] == null ? null : json["wind_mph"].toDouble(),
        windKph: json["wind_kph"] == null ? null : json["wind_kph"].toDouble(),
        windDegree: json["wind_degree"] == null ? null : json["wind_degree"],
        windDir: json["wind_dir"] == null ? null : json["wind_dir"],
        pressureMb: json["pressure_mb"] == null ? null : json["pressure_mb"],
        pressureIn: json["pressure_in"] == null ? null : json["pressure_in"].toDouble(),
        precipMm: json["precip_mm"] == null ? null : json["precip_mm"].toDouble(),
        precipIn: json["precip_in"] == null ? null : json["precip_in"].toDouble(),
        humidity: json["humidity"] == null ? null : json["humidity"],
        cloud: json["cloud"] == null ? null : json["cloud"],
        feelslikeC: json["feelslike_c"] == null ? null : json["feelslike_c"].toDouble(),
        feelslikeF: json["feelslike_f"] == null ? null : json["feelslike_f"].toDouble(),
        windchillC: json["windchill_c"] == null ? null : json["windchill_c"].toDouble(),
        windchillF: json["windchill_f"] == null ? null : json["windchill_f"].toDouble(),
        heatindexC: json["heatindex_c"] == null ? null : json["heatindex_c"].toDouble(),
        heatindexF: json["heatindex_f"] == null ? null : json["heatindex_f"].toDouble(),
        dewpointC: json["dewpoint_c"] == null ? null : json["dewpoint_c"].toDouble(),
        dewpointF: json["dewpoint_f"] == null ? null : json["dewpoint_f"].toDouble(),
        willItRain: json["will_it_rain"] == null ? null : json["will_it_rain"],
        chanceOfRain: json["chance_of_rain"] == null ? null : json["chance_of_rain"],
        willItSnow: json["will_it_snow"] == null ? null : json["will_it_snow"],
        chanceOfSnow: json["chance_of_snow"] == null ? null : json["chance_of_snow"],
        visKm: json["vis_km"] == null ? null : json["vis_km"],
        visMiles: json["vis_miles"] == null ? null : json["vis_miles"],
        gustMph: json["gust_mph"] == null ? null : json["gust_mph"].toDouble(),
        gustKph: json["gust_kph"] == null ? null : json["gust_kph"].toDouble(),
        uv: json["uv"] == null ? null : json["uv"],
    );

    Map<String, dynamic> toJson() => {
        "time_epoch": timeEpoch == null ? null : timeEpoch,
        "time": time == null ? null : time,
        "temp_c": tempC == null ? null : tempC,
        "temp_f": tempF == null ? null : tempF,
        "is_day": isDay == null ? null : isDay,
        "condition": condition == null ? null : condition!.toJson(),
        "wind_mph": windMph == null ? null : windMph,
        "wind_kph": windKph == null ? null : windKph,
        "wind_degree": windDegree == null ? null : windDegree,
        "wind_dir": windDir == null ? null : windDir,
        "pressure_mb": pressureMb == null ? null : pressureMb,
        "pressure_in": pressureIn == null ? null : pressureIn,
        "precip_mm": precipMm == null ? null : precipMm,
        "precip_in": precipIn == null ? null : precipIn,
        "humidity": humidity == null ? null : humidity,
        "cloud": cloud == null ? null : cloud,
        "feelslike_c": feelslikeC == null ? null : feelslikeC,
        "feelslike_f": feelslikeF == null ? null : feelslikeF,
        "windchill_c": windchillC == null ? null : windchillC,
        "windchill_f": windchillF == null ? null : windchillF,
        "heatindex_c": heatindexC == null ? null : heatindexC,
        "heatindex_f": heatindexF == null ? null : heatindexF,
        "dewpoint_c": dewpointC == null ? null : dewpointC,
        "dewpoint_f": dewpointF == null ? null : dewpointF,
        "will_it_rain": willItRain == null ? null : willItRain,
        "chance_of_rain": chanceOfRain == null ? null : chanceOfRain,
        "will_it_snow": willItSnow == null ? null : willItSnow,
        "chance_of_snow": chanceOfSnow == null ? null : chanceOfSnow,
        "vis_km": visKm == null ? null : visKm,
        "vis_miles": visMiles == null ? null : visMiles,
        "gust_mph": gustMph == null ? null : gustMph,
        "gust_kph": gustKph == null ? null : gustKph,
        "uv": uv == null ? null : uv,
    };
}

class Location {
    Location({
        required this.name,
        this.region,
        this.country,
        this.lat,
        this.lon,
        this.tzId,
        this.localtimeEpoch,
        this.localtime,
    });

    String name;
    String? region;
    String? country;
    double? lat;
    double? lon;
    String? tzId;
    int? localtimeEpoch;
    String? localtime;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"] ?? null,
        region: json["region"] ?? null,
        country: json["country"] ?? null,
        lat: json["lat"].toDouble() ?? null,
        lon: json["lon"].toDouble() ?? null,
        tzId: json["tz_id"] ?? null,
        localtimeEpoch: json["localtime_epoch"] ?? null,
        localtime: json["localtime"] ?? null,
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "region": region == null ? null : region,
        "country": country == null ? null : country,
        "lat": lat == null ? null : lat,
        "lon": lon == null ? null : lon,
        "tz_id": tzId == null ? null : tzId,
        "localtime_epoch": localtimeEpoch == null ? null : localtimeEpoch,
        "localtime": localtime == null ? null : localtime,
    };
}
