import 'package:flutter/cupertino.dart';

class IconsRow extends StatelessWidget {
  const IconsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconWidth = (MediaQuery.of(context).size.width / 6) - 10;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset("assets/icons/time-100.png",
            width: iconWidth, height: iconWidth),
        Image.asset("assets/icons/temperature100.png",
            width: iconWidth, height: iconWidth),
        Image.asset("assets/icons/cloud64.png",
            width: iconWidth, height: iconWidth),
        Image.asset("assets/icons/wind100.png",
            width: iconWidth, height: iconWidth),
        Image.asset("assets/icons/humidity100.png",
            width: iconWidth, height: iconWidth),
        Image.asset("assets/icons/humidifier100.png",
            width: iconWidth, height: iconWidth),
      ],
    );
  }
}
