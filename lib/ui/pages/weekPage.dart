import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:w98app/blocs/weekScrollingBloc/week_scrolling_bloc.dart';
import 'package:w98app/ui/widgets/dateStatusWidget.dart';

import '../../blocs/geolocation/geolocation_bloc.dart';
import '../../blocs/weather/weather_bloc.dart';
import '../../models/forecast.dart';
import '../widgets/OneDayWeatherWidget.dart';
import '../widgets/customLoadingIndicator.dart';
import '../widgets/iconsRow.dart';
import '../widgets/locationWidget.dart';

class WeatherWeekPage extends StatelessWidget {
  const WeatherWeekPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = (MediaQuery.of(context).size.width / 6) - 10;
    return RepositoryProvider<WeekScrollingBloc>(
      create: (context) => WeekScrollingBloc(),
      child: SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: BlocBuilder<GeolocationBloc, GeolocationState>(
            bloc: context.read<GeolocationBloc>(),
            builder: (gContext, gState) => BlocBuilder<WeatherBloc,
                    WeatherState>(
                bloc: context.read<WeatherBloc>(),
                builder: (context, state) {
                  if (gState is GeolocationLoadedState &&
                      state is WeatherLoadedState &&
                      state.currentStatus.forecast?.forecastDay != null &&
                      (state.currentStatus.forecast?.forecastDay?.isNotEmpty ??
                          false)) {
                    List<ForecastDay> forecastDays =
                        state.currentStatus.forecast!.forecastDay!;
                    return BlocBuilder<WeekScrollingBloc, WeekScrollingState>(
                      builder: (context, weekState) {
                        if (weekState is WeekScrolled) {
                          return NotificationListener(
                            onNotification: (ScrollUpdateNotification sn) {
                              context.read<WeekScrollingBloc>().add(
                                    WeekPageScrolling(
                                        contextSize: iconSize,
                                        scrollPosition: sn.metrics.pixels,
                                        fullHeight: sn.metrics.maxScrollExtent),
                                  );
                              return true;
                            },
                            child: CustomScrollView(
                              shrinkWrap: true,
                              slivers: [
                                SliverAppBar(
                                  floating: false,
                                  pinned: true,
                                  snap: false,
                                  toolbarHeight: iconSize,
                                  expandedHeight: 600,
                                  collapsedHeight: iconSize,
                                  elevation: 0,
                                  bottom: PreferredSize(
                                    preferredSize: Size(
                                        MediaQuery.of(context).size.width,
                                        iconSize),
                                    child: Opacity(
                                      opacity: weekState.percentToShow ?? 0,
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18.0),
                                        child: IconsRow(),
                                      ),
                                    ),
                                  ),
                                  title: Opacity(
                                    opacity: weekState.percentToShow!,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          DateFormat("MMMM dd EE").format(
                                              DateFormat(
                                            'yyyy-MM-dd',
                                          ).parse(forecastDays[forecastDays
                                                              .length <=
                                                          weekState.dayIndex!
                                                      ? forecastDays.length - 1
                                                      : weekState.dayIndex!]
                                                  .date!)),
                                          style: GoogleFonts.comfortaa(
                                              color: Colors.white,
                                              fontSize: 42),
                                        ),
                                      ],
                                    ),
                                  ),
                                  flexibleSpace: Opacity(
                                    opacity: 1 - weekState.percentToHide!,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 50),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            LocationWidget(
                                                location: state
                                                    .currentStatus.location!),
                                            DateStatusWidget(forecastDays.first)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) => SizedBox(
                                      height: (25 *
                                              (forecastDays.length) *
                                              iconSize) +
                                          iconSize,
                                      child: ListView.separated(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            OneDayWeatherWidget(
                                          hours: forecastDays[index].hour!,
                                          isToday: DateFormat(
                                                'yyyy-MM-dd',
                                              )
                                                  .parse(
                                                      forecastDays[index].date!)
                                                  .day ==
                                              DateTime.now().day,
                                        ),
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18.0),
                                            child: Text(
                                              DateFormat("MMMM dd EE").format(
                                                  DateFormat(
                                                'yyyy-MM-dd',
                                              ).parse(forecastDays[index + 1]
                                                      .date!)),
                                              style: GoogleFonts.comfortaa(
                                                  color: Colors.white,
                                                  fontSize: 42),
                                            ),
                                          );
                                        },
                                        itemCount: forecastDays.length,
                                      ),
                                    ),
                                    childCount: 1,
                                  ),
                                ),
                                //  buildBody(context),
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  } else {
                    return const CustomLoadingIndicator();
                  }
                }),
          ),
        ),
      ),
    );
  }
}
