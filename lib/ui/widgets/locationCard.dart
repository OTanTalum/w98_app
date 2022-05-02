import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/location.dart';

class LocationCard extends StatelessWidget {
  LocationCard({required this.onTap, required this.location});

  Function() onTap;
  Location location;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: Container(
          color: Colors.transparent,
          height: 120,
          width: MediaQuery.of(context).size.width - 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                location.name,
                style: GoogleFonts.fjordOne(color: Colors.white, fontSize: 22),
              ),
              Text(
                location.region.toString(),
                style: GoogleFonts.fjordOne(color: Colors.white, fontSize: 20),
              ),
              Text(
                location.country,
                style: GoogleFonts.fjordOne(color: Colors.white, fontSize: 16),
              ),
            ],
          )),
    );
  }
}
