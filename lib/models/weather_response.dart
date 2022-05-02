import 'package:w98app/models/current_weather_state.dart';
import 'package:w98app/models/forecast.dart';
import 'package:w98app/models/location.dart';

class WeatherResponse {
  Location? location;
  CurrentWeatherState? currentWeatherState;
  Forecast? forecast;

  WeatherResponse({this.currentWeatherState, this.forecast, this.location});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      location: Location.fromJson(json['location']),
      currentWeatherState: CurrentWeatherState.fromJson(json['current']),
      forecast: Forecast.fromJson(json['forecast']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (data['location'] != null) {
      data['location'] = location!.toJson();
    }
    if (data['current'] != null) {
      data['current'] = currentWeatherState!.toJson();
    }
    if (data['forecast'] != null) {
      data['forecast'] = forecast!.toJson();
    }

    return data;
  }
}
