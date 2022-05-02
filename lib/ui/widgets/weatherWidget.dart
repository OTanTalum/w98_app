import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/current_weather_state.dart';

class WeatherWidget extends StatelessWidget {
  WeatherWidget({required this.data});
  CurrentWeatherState data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: Wrap(
        children: [
          buildConditionWithIcon(
              context, "${this.data.condition!.icon}", data.condition!.text,
              isAsset: false),
          buildConditionWithIcon(context, "assets/icons/cloud64.png",
              "Cloudiness \n${data.cloud} %"),
          buildConditionWithIcon(context, "assets/icons/wind100.png",
              "Wind speed \n${data.windKph} Kph"),
          buildConditionWithIcon(context, "assets/icons/humidity100.png",
              "Precipitation \n${data.preCipMm} mm"),
          buildConditionWithIcon(context, "assets/icons/humidifier100.png",
              "Humidity  \n${data.humidity} %"),
          buildConditionWithIcon(context, "assets/icons/eye-100.png",
              "Visibility  \n${data.visKm} km")
        ],
      ),
    );
  }

  buildConditionWithIcon(BuildContext context, String src, value,
      {bool isAsset = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          isAsset
              ? Image.asset(src, width: 92, height: 92)
              : Image.network(
                  "https:$src",
                  width: 92,
                  height: 92,
                ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 22),
            ),
          )
        ],
      ),
    );
  }
}
