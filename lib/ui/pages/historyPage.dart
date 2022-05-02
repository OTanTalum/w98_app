import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:w98app/blocs/HistoryBloc/history_bloc.dart';

import '../../blocs/bottomBar/bottom_bar_bloc.dart';
import '../../blocs/geolocation/geolocation_bloc.dart';
import '../../models/location.dart';
import '../widgets/locationCard.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blue,
      body: SafeArea(
        top: true,
        bottom: true,
        child: buildBody(),
      ),
    );
  }

  buildBody() {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryData) {
          return Column(
            children: [
              Center(
                child: Text(
                  "History",
                  style:
                      GoogleFonts.comfortaa(color: Colors.white, fontSize: 52),
                ),
              ),
              if (state.locations?.isNotEmpty ?? false)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                        itemCount: state.locations?.length,
                        itemBuilder: (context, index) => LocationCard(
                              location: state.locations![index],
                              onTap: () {
                                context
                                    .read<GeolocationBloc>()
                                    .add(GeolocationInitialization(
                                      position: PositionParameters(
                                          lat: state.locations![index].lat!,
                                          lon: state.locations![index].lon!,
                                          name: state.locations![index].name),
                                    ));
                                context
                                    .read<BottomBarBloc>()
                                    .add(BottomBarHomeTapEvent());
                              },
                            )),
                  ),
                )
              else
                Container()
            ],
          );
        } else
          return Container();
      },
    );
  }
}
