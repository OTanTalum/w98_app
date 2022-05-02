import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:w98app/models/forecast.dart';

class DateStatusWidget extends StatelessWidget {
  DateStatusWidget(this.forecastDay);

  ForecastDay? forecastDay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateFormat("y\nMMM d\nEEEE").format(DateFormat(
              'yyyy-MM-dd',
            ).parse(forecastDay!.date!)),
            style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 28),
          ),
          Image.network("http:" + forecastDay!.day!.condition!.icon!,
              alignment: Alignment.center,
              fit: BoxFit.cover,
              width: 120,
              height: 120)
        ],
      ),
    );
  }
}
