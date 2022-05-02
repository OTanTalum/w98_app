import 'dart:convert';
import 'dart:core';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:w98app/models/search.dart';
import 'package:w98app/models/weather_response.dart';

const apiKey = "c3c15ce6086d4753b82133642222804";
const apiUrl = "api.weatherapi.com";

class Api {
  Future<WeatherResponse> getForecast(
      {String? query, required String position}) async {
    Map<String, dynamic> parameters = {};
    parameters["key"] = apiKey;
    parameters["q"] = query ?? position;
    parameters["days"] = "7";
    return await http
        .get(Uri.http(apiUrl, "/v1/forecast.json", parameters))
        .then((value) {
      log(value.request.toString());
      return WeatherResponse.fromJson(json.decode(value.body));
    });
  }

  Future<SearchResponse> searchLocation({String? query}) async {
    Map<String, dynamic> parameters = {};
    parameters["key"] = apiKey;
    parameters["q"] = query;
    return await http
        .get(Uri.http(apiUrl, "/v1/search.json", parameters))
        .then((value) {
      log(value.request.toString());
      return SearchResponse.fromJson(json.decode(value.body));
    });
  }
}
