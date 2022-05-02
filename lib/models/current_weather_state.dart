class CurrentWeatherState {
  int? cloud;
  Condition? condition;
  double? feelsLikeC;
  double? feelsLikeF;
  double? gustKph;
  double? gustMph;
  int? humidity;
  int? isDay;
  String? lastUpdated;
  int? lastUpdatedEpoch;
  double? preCipIn;
  double? preCipMm;
  double? pressureIn;
  double? pressureMb;
  double? tempC;
  double? tempF;
  double? uv;
  double? visKm;
  double? visMiles;
  int? windDegree;
  String? windDir;
  double? windKph;
  double? windMph;

  CurrentWeatherState(
      {this.cloud,
      this.condition,
      this.feelsLikeC,
      this.feelsLikeF,
      this.gustKph,
      this.gustMph,
      this.humidity,
      this.isDay,
      this.lastUpdated,
      this.lastUpdatedEpoch,
      this.preCipIn,
      this.preCipMm,
      this.pressureIn,
      this.pressureMb,
      this.tempC,
      this.tempF,
      this.uv,
      this.visKm,
      this.visMiles,
      this.windDegree,
      this.windDir,
      this.windKph,
      this.windMph});

  factory CurrentWeatherState.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherState(
      cloud: json['cloud'],
      condition: json['condition'] != null
          ? Condition.fromJson(json['condition'])
          : null,
      feelsLikeC: json['feelslike_c'],
      feelsLikeF: json['feelslike_f'],
      gustKph: json['gust_kph'],
      gustMph: json['gust_mph'],
      humidity: json['humidity'],
      isDay: json['is_day'],
      lastUpdated: json['last_updated'],
      lastUpdatedEpoch: json['last_updated_epoch'],
      preCipIn: json['precip_in'],
      preCipMm: json['precip_mm'],
      pressureIn: json['pressure_in'],
      pressureMb: json['pressure_mb'],
      tempC: json['temp_c'],
      tempF: json['temp_f'],
      uv: json['uv'],
      visKm: json['vis_km'],
      visMiles: json['vis_miles'],
      windDegree: json['wind_degree'],
      windDir: json['wind_dir'],
      windKph: json['wind_kph'],
      windMph: json['wind_mph'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cloud'] = cloud;
    data['feelslike_c'] = feelsLikeC;
    data['feelslike_f'] = feelsLikeF;
    data['gust_kph'] = gustKph;
    data['gust_mph'] = gustMph;
    data['humidity'] = humidity;
    data['is_day'] = isDay;
    data['last_updated'] = lastUpdated;
    data['last_updated_epoch'] = lastUpdatedEpoch;
    data['precip_in'] = preCipIn;
    data['precip_mm'] = preCipMm;
    data['pressure_in'] = pressureIn;
    data['pressure_mb'] = pressureMb;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['uv'] = uv;
    data['vis_km'] = visKm;
    data['vis_miles'] = visMiles;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['wind_kph'] = windKph;
    data['wind_mph'] = windMph;
    if (condition != null) {
      data['condition'] = condition?.toJson();
    }
    return data;
  }
}

class Condition {
  int? code;
  String? icon;
  String? text;

  Condition({this.code, this.icon, this.text});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      code: json['code'],
      icon: json['icon'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['icon'] = icon;
    data['text'] = text;
    return data;
  }
}
