import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/location.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({required this.location});

  Location location;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        location.name,
        textAlign: TextAlign.center,
        style: GoogleFonts.fjallaOne(color: Colors.white, fontSize: 52),
      ),
      Text(location.region.toString(),
          style: GoogleFonts.fjallaOne(color: Colors.white, fontSize: 24)),
      Text(location.country,
          style: GoogleFonts.fjallaOne(color: Colors.white, fontSize: 24)),
    ]);
  }
}
