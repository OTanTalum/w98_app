import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/location.dart';
import '../weather/weather_bloc.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final WeatherBloc weatherBloc;
  HistoryBloc({required this.weatherBloc}) : super(HistoryData()) {
    weatherBloc.stream.listen((wState) {
      if (wState is WeatherLoadedState &&
          ((state as HistoryData).locations?.first.name !=
              wState.currentStatus.location!.name)) {
        add(HistoryAddEvent(location: wState.currentStatus.location!));
      }
    });
    on<HistoryInitEvent>((event, emit) {
      log("History Inited");
      emit(HistoryData());
    });
    on<HistoryAddEvent>((event, emit) {
      if (state is! HistoryData) {
        emit(HistoryData(locations: [event.location]));
      }
      emit(HistoryData(
          locations:
              [event.location] + ((state as HistoryData).locations ?? [])));
    });
  }
}
