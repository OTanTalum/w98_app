import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_bar_event.dart';
part 'bottom_bar_state.dart';

class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  BottomBarBloc() : super(BottomBarOnHomePage(index: 0)) {
    stream.listen((state) {
      log(state.toString());
    });

    on<BottomBarHomeTapEvent>((event, emit) {
      if (state is! BottomBarOnHomePage) {
        emit(BottomBarOnHomePage(index: 0));
      }
    });

    on<BottomBarSearchTapEvent>((event, emit) {
      if (state is! BottomBarOnSearchPage) {
        emit(BottomBarOnSearchPage(index: 1));
      }
    });

    on<BottomBarDayTapEvent>((event, emit) {
      if (state is! BottomBarOnDayPage) {
        emit(BottomBarOnDayPage(index: 2));
      }
    });

    on<BottomBarWeekTapEvent>((event, emit) {
      if (state is! BottomBarOnWeekPage) {
        emit(BottomBarOnWeekPage(index: 3));
      }
    });
  }
}
