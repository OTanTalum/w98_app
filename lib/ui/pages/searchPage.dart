import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:w98app/blocs/bottomBar/bottom_bar_bloc.dart';
import 'package:w98app/blocs/geolocation/geolocation_bloc.dart';
import 'package:w98app/blocs/search/search_bloc.dart';

import '../../models/location.dart';
import '../widgets/locationCard.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

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

  Widget buildBody() {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: TextField(
                onChanged: (String value) {
                  context.read<SearchBloc>().add(SearchTypeEvent(query: value));
                },
                style: GoogleFonts.comfortaa(
                    color: Colors.white,
                    backgroundColor: Colors.blue[700],
                    fontSize: 18),
                cursorRadius: Radius.circular(15),
                cursorColor: Colors.blue[300],
                decoration: InputDecoration(
                  fillColor: Colors.blue[700],
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: Colors.blue[300]),
                  prefix: const SizedBox(
                    width: 16,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                    borderSide:
                        BorderSide(color: Colors.blue.shade800, width: 3.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                    borderSide:
                        BorderSide(color: Colors.blue.shade600, width: 1.0),
                  ),
                ),
              ),
            ),
            if (state is SearchLoaded)
              Expanded(
                child: ListView.separated(
                  itemCount: state.searchResponse!.locations!.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.black,
                    thickness: 1.0,
                    height: 2,
                  ),
                  itemBuilder: (context, index) => LocationCard(
                      onTap: () {
                        context
                            .read<GeolocationBloc>()
                            .add(GeolocationInitialization(
                              position: PositionParameters(
                                  lat: state
                                      .searchResponse!.locations![index].lat!,
                                  lon: state
                                      .searchResponse!.locations![index].lon!,
                                  name: state
                                      .searchResponse!.locations![index].name),
                            ));
                        context
                            .read<BottomBarBloc>()
                            .add(BottomBarHomeTapEvent());
                      },
                      location: state.searchResponse!.locations![index]),
                ),
              )
            else if (state is SearchLoading)
              Center(
                child: CircularProgressIndicator(color: Colors.orange[800]),
              )
          ]),
        );
      },
    );
  }
}
