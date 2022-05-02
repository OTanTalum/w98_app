import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/forecast.dart';

class OneDayWeatherWidget extends StatelessWidget {
  OneDayWeatherWidget({required this.hours, this.isToday = true});

  List<Hour> hours;
  bool isToday;

  @override
  Widget build(BuildContext context) {
    double iconWidth = (MediaQuery.of(context).size.width / 6) - 10;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: (hours.length + 1) * iconWidth,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: hours.length,
            itemBuilder: (context, int index) {
              int currentHour = DateTime.now().toUtc().hour;
              int weatherHour = int.parse(
                  hours[index].time!.split(" ").last.split(":").first);
              bool isCurrent = (currentHour == weatherHour) && isToday;
              return Container(
                height: iconWidth,
                decoration: BoxDecoration(
                  color: index % 2 == 0 ? Colors.blue[700]! : Colors.blue,
                  border: isCurrent
                      ? Border.all(
                          color: Colors.orange[200]!,
                          width: 1,
                          style: BorderStyle.solid)
                      : null,
                ),
                child: Opacity(
                  opacity: !isToday || (currentHour <= weatherHour) ? 1 : 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildText(
                          "${hours[index].time!.split(" ").last}", isCurrent),
                      buildText("${hours[index].tempC}°C", isCurrent),
                      buildText("${hours[index].cloud} %", isCurrent),
                      buildText("${hours[index].windKph} \nKph", isCurrent),
                      buildText("${hours[index].preCipMm} \nmm", isCurrent),
                      buildText("${hours[index].humidity} %", isCurrent),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Text buildText(String value, isCurrent) {
    return Text(
      value,
      textAlign: TextAlign.center,
      style: GoogleFonts.comfortaa(
          fontWeight: isCurrent ? FontWeight.bold : FontWeight.w300,
          color: isCurrent ? Colors.orange[200] : Colors.white,
          fontSize: 16),
    );
  }
}
