import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w98app/blocs/bottomBar/bottom_bar_bloc.dart';
import 'package:w98app/blocs/geolocation/geolocation_bloc.dart';
import 'package:w98app/blocs/search/search_bloc.dart';
import 'package:w98app/blocs/weather/weather_bloc.dart';
import 'package:w98app/ui/pages/historyPage.dart';
import 'package:w98app/ui/pages/homePage.dart';
import 'package:w98app/ui/pages/searchPage.dart';
import 'package:w98app/ui/pages/weekPage.dart';
import 'package:w98app/ui/widgets/customBottomBar.dart';

import '../../blocs/HistoryBloc/history_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BottomBarBloc>(
          create: (context) => BottomBarBloc()..add(BottomBarHomeTapEvent()),
        ),
        RepositoryProvider<GeolocationBloc>(
          create: (context) =>
              GeolocationBloc()..add(GeolocationInitialization()),
        ),
        RepositoryProvider<WeatherBloc>(
            create: (context) =>
                WeatherBloc(geolocationBloc: context.read<GeolocationBloc>())),
        RepositoryProvider<SearchBloc>(
          create: (context) => SearchBloc()..add(SearchTypeEvent(query: "")),
        ),
        RepositoryProvider<HistoryBloc>(
          create: (context) =>
              HistoryBloc(weatherBloc: context.read<WeatherBloc>()),
        ),
      ],
      child: BlocBuilder<BottomBarBloc, BottomBarState>(
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.blue,
          body: getPage(state.index),
          bottomNavigationBar: CustomBottomBar(context: context),
        ),
      ),
    );
  }

  getPage(int index) {
    switch (index) {
      case 0:
        return WeatherNowPage();
      case 1:
        return SearchPage();
      case 2:
        return HistoryPage();
      case 3:
        return WeatherWeekPage();
    }
  }
}
