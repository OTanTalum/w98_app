import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'week_scrolling_event.dart';
part 'week_scrolling_state.dart';

class WeekScrollingBloc extends Bloc<WeekScrollingEvent, WeekScrollingState> {
  WeekScrollingBloc() : super(WeekScrolled()) {
    on<WeekPageScrolling>((event, emit) {
      emit(WeekScrolling(
          scrollPosition: event.scrollPosition, fullHeight: event.fullHeight));

      emit(
        WeekScrolled(
            dayIndex: event.scrollPosition! <= 0
                ? 0
                : event.scrollPosition! < 500 + (24 * event.contextSize!)
                    ? 0
                    : (-500 + event.scrollPosition!) ~/
                        (24 * event.contextSize!),
            percentToHide: event.scrollPosition! <= 0
                ? 0
                : double.parse((event.scrollPosition! < 300
                        ? event.scrollPosition! / 300
                        : 1)
                    .toStringAsFixed(3)),
            percentToShow: event.scrollPosition! <= 0
                ? 0
                : event.scrollPosition! < 400
                    ? event.scrollPosition! / 400
                    : 1),
      );
    });
  }
}
