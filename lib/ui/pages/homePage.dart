import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:w98app/blocs/weather/weather_bloc.dart';
import 'package:w98app/ui/widgets/customLoadingIndicator.dart';
import 'package:w98app/ui/widgets/locationWidget.dart';

import '../../blocs/geolocation/geolocation_bloc.dart';
import '../widgets/weatherWidget.dart';

class WeatherNowPage extends StatelessWidget {
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 120.0),
        child: BlocBuilder<GeolocationBloc, GeolocationState>(
          bloc: context.read<GeolocationBloc>(),
          builder: (gContext, gState) => BlocBuilder<WeatherBloc, WeatherState>(
              bloc: context.read<WeatherBloc>(),
              builder: (context, state) {
                if (gState is GeolocationLoadedState &&
                    state is WeatherLoadedState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        gState is GeolocationWithoutPermissionState
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 60.0),
                                child: Text(
                                    "For normal working of the application, please allow geolocation permission. ",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.bebasNeue(
                                        color: Colors.orange[800],
                                        fontSize: 24)),
                              )
                            : Container(),
                        LocationWidget(location: state.currentStatus.location!),
                        Padding(
                          padding: const EdgeInsets.only(top: 48.0),
                          child: Text(
                            state.currentStatus.currentWeatherState!.tempC
                                    .toString() +
                                "  °C",
                            style: GoogleFonts.fjallaOne(
                                color: Colors.white, fontSize: 62),
                          ),
                        ),
                        Text(
                          "Feels like " +
                              state
                                  .currentStatus.currentWeatherState!.feelsLikeC
                                  .toString() +
                              "  °C",
                          style: GoogleFonts.comfortaa(
                              color: Colors.white, fontSize: 22),
                        ),
                        WeatherWidget(
                            data: state.currentStatus.currentWeatherState!),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  );
                } else {
                  return const CustomLoadingIndicator();
                }
              }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.gps_fixed_outlined),
        splashColor: Colors.orange[800],
        onPressed: () {
          context.read<GeolocationBloc>().add(GeolocationInitialization());
        },
      ),
      body: buildBody(context),
    );
  }
}
