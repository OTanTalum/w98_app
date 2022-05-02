import 'package:w98app/models/current_weather_state.dart';

class Forecast {
  List<ForecastDay>? forecastDay;

  Forecast({this.forecastDay});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      forecastDay: json['forecastday'] != null
          ? (json['forecastday'] as List)
              .map((i) => ForecastDay.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (forecastDay != null) {
      data['forecastday'] = forecastDay!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ForecastDay {
  Astro? astro;
  String? date;
  int? dateEpoch;
  Day? day;
  List<Hour>? hour;

  ForecastDay({this.astro, this.date, this.dateEpoch, this.day, this.hour});

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      astro: json['astro'] != null ? Astro.fromJson(json['astro']) : null,
      date: json['date'],
      dateEpoch: json['date_epoch'],
      day: json['day'] != null ? Day.fromJson(json['day']) : null,
      hour: json['hour'] != null
          ? (json['hour'] as List).map((i) => Hour.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['date_epoch'] = dateEpoch;
    if (astro != null) {
      data['astro'] = astro!.toJson();
    }
    if (day != null) {
      data['day'] = day!.toJson();
    }
    if (hour != null) {
      data['hour'] = hour!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Day {
  double? avgHumidity;
  double? avgTempC;
  double? avgTempF;
  double? avgVisKm;
  double? avgVisMiles;
  Condition? condition;
  int? dailyChanceOfRain;
  int? dailyChanceOfSnow;
  int? dailyWillItRain;
  int? dailyWillItSnow;
  double? maxTempC;
  double? maxTempF;
  double? maxWindKph;
  double? maxWindMph;
  double? minTempC;
  double? minTempF;
  double? totalPreCipIn;
  double? totalPreCipMm;
  double? uv;

  Day(
      {this.avgHumidity,
      this.avgTempC,
      this.avgTempF,
      this.avgVisKm,
      this.avgVisMiles,
      this.condition,
      this.dailyChanceOfRain,
      this.dailyChanceOfSnow,
      this.dailyWillItRain,
      this.dailyWillItSnow,
      this.maxTempC,
      this.maxTempF,
      this.maxWindKph,
      this.maxWindMph,
      this.minTempC,
      this.minTempF,
      this.totalPreCipIn,
      this.totalPreCipMm,
      this.uv});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      avgHumidity: json['avghumidity'],
      avgTempC: json['avgtemp_c'],
      avgTempF: json['avgtemp_f'],
      avgVisKm: json['avgvis_km'],
      avgVisMiles: json['avgvis_miles'],
      condition: json['condition'] != null
          ? Condition.fromJson(json['condition'])
          : null,
      dailyChanceOfRain: json['daily_chance_of_rain'],
      dailyChanceOfSnow: json['daily_chance_of_snow'],
      dailyWillItRain: json['daily_will_it_rain'],
      dailyWillItSnow: json['daily_will_it_snow'],
      maxTempC: json['maxtemp_c'],
      maxTempF: json['maxtemp_f'],
      maxWindKph: json['maxwind_kph'],
      maxWindMph: json['maxwind_mph'],
      minTempC: json['mintemp_c'],
      minTempF: json['mintemp_f'],
      totalPreCipIn: json['totalprecip_in'],
      totalPreCipMm: json['totalprecip_mm'],
      uv: json['uv'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avghumidity'] = avgHumidity;
    data['avgtemp_c'] = avgTempC;
    data['avgtemp_f'] = avgTempF;
    data['avgvis_km'] = avgVisKm;
    data['avgvis_miles'] = avgVisMiles;
    data['daily_chance_of_rain'] = dailyChanceOfRain;
    data['daily_chance_of_snow'] = dailyChanceOfSnow;
    data['daily_will_it_rain'] = dailyWillItRain;
    data['daily_will_it_snow'] = dailyWillItSnow;
    data['maxtemp_c'] = maxTempC;
    data['maxtemp_f'] = maxTempF;
    data['maxwind_kph'] = maxWindKph;
    data['maxwind_mph'] = maxWindMph;
    data['mintemp_c'] = minTempC;
    data['mintemp_f'] = minTempF;
    data['totalprecip_in'] = totalPreCipIn;
    data['totalprecip_mm'] = totalPreCipMm;
    data['uv'] = uv;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    return data;
  }
}

class Hour extends CurrentWeatherState {
  int? chanceOfRain;
  int? chanceOfSnow;
  double? dewPointC;
  double? dewPointF;
  double? heatIndexC;
  double? heatIndexF;
  String? time;
  int? timeEpoch;
  int? willItRain;
  int? willItSnow;
  double? windChillC;
  double? windChillF;

  Hour({
    this.chanceOfRain,
    this.chanceOfSnow,
    this.dewPointC,
    this.dewPointF,
    this.heatIndexC,
    this.heatIndexF,
    this.time,
    this.timeEpoch,
    this.willItRain,
    this.willItSnow,
    this.windChillC,
    this.windChillF,
    int? cloud,
    Condition? condition,
    double? feelsLikeC,
    double? feelsLikeF,
    double? gustKph,
    double? gustMph,
    int? humidity,
    int? isDay,
    double? preCipIn,
    double? preCipMm,
    double? pressureIn,
    double? pressureMb,
    double? tempC,
    double? tempF,
    double? uv,
    double? visKm,
    double? visMiles,
    int? windDegree,
    String? windDir,
    double? windKph,
    double? windMph,
  }) : super(
          cloud: cloud,
          condition: condition,
          feelsLikeC: feelsLikeC,
          feelsLikeF: feelsLikeF,
          gustKph: gustKph,
          gustMph: gustMph,
          humidity: humidity,
          isDay: isDay,
          preCipIn: preCipIn,
          preCipMm: preCipMm,
          pressureIn: pressureIn,
          pressureMb: pressureMb,
          tempC: tempC,
          tempF: uv,
          visKm: visKm,
          visMiles: visMiles,
          windDegree: windDegree,
          windDir: windDir,
          windKph: windKph,
          windMph: windMph,
        );

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      chanceOfRain: json['chance_of_rain'],
      chanceOfSnow: json['chance_of_snow'],
      cloud: json['cloud'],
      condition: json['condition'] != null
          ? Condition.fromJson(json['condition'])
          : null,
      dewPointC: json['dewpoint_c'],
      dewPointF: json['dewpoint_f'],
      feelsLikeC: json['feelslike_c'],
      feelsLikeF: json['feelslike_f'],
      gustKph: json['gust_kph'],
      gustMph: json['gust_mph'],
      heatIndexC: json['heatindex_c'],
      heatIndexF: json['heatindex_f'],
      humidity: json['humidity'],
      isDay: json['is_day'],
      preCipIn: json['precip_in'],
      preCipMm: json['precip_mm'],
      pressureIn: json['pressure_in'],
      pressureMb: json['pressure_mb'],
      tempC: json['temp_c'],
      tempF: json['temp_f'],
      time: json['time'],
      timeEpoch: json['time_epoch'],
      uv: json['uv'],
      visKm: json['vis_km'],
      visMiles: json['vis_miles'],
      willItRain: json['will_it_rain'],
      willItSnow: json['will_it_snow'],
      windDegree: json['wind_degree'],
      windDir: json['wind_dir'],
      windKph: json['wind_kph'],
      windMph: json['wind_mph'],
      windChillC: json['windchill_c'],
      windChillF: json['windchill_f'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chance_of_rain'] = chanceOfRain;
    data['chance_of_snow'] = chanceOfSnow;
    data['cloud'] = cloud;
    data['dewpoint_c'] = dewPointC;
    data['dewpoint_f'] = dewPointF;
    data['feelslike_c'] = feelsLikeC;
    data['feelslike_f'] = feelsLikeF;
    data['gust_kph'] = gustKph;
    data['gust_mph'] = gustMph;
    data['heatindex_c'] = heatIndexC;
    data['heatindex_f'] = heatIndexF;
    data['humidity'] = humidity;
    data['is_day'] = isDay;
    data['precip_in'] = preCipIn;
    data['precip_mm'] = preCipMm;
    data['pressure_in'] = pressureIn;
    data['pressure_mb'] = pressureMb;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['time'] = time;
    data['time_epoch'] = timeEpoch;
    data['uv'] = uv;
    data['vis_km'] = visKm;
    data['vis_miles'] = visMiles;
    data['will_it_rain'] = willItRain;
    data['will_it_snow'] = willItSnow;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['wind_kph'] = windKph;
    data['wind_mph'] = windMph;
    data['windchill_c'] = windChillC;
    data['windchill_f'] = windChillF;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    return data;
  }
}

class Astro {
  String? moonIllumination;
  String? moonPhase;
  String? moonRise;
  String? moonSet;
  String? sunrise;
  String? sunset;

  Astro(
      {this.moonIllumination,
      this.moonPhase,
      this.moonRise,
      this.moonSet,
      this.sunrise,
      this.sunset});

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      moonIllumination: json['moon_illumination'],
      moonPhase: json['moon_phase'],
      moonRise: json['moonrise'],
      moonSet: json['moonset'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['moon_illumination'] = moonIllumination;
    data['moon_phase'] = moonPhase;
    data['moonrise'] = moonRise;
    data['moonset'] = moonSet;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}
