import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:w98app/blocs/geolocation/geolocation_bloc.dart';

import '../../models/weather_response.dart';
import '../../servieces/api_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  GeolocationState? geolocationState = GeolocationInitialState();
  final GeolocationBloc geolocationBloc;
  String? position;

  WeatherBloc({required this.geolocationBloc}) : super(WeatherInitialState()) {
    stream.listen((event) {
      log(state.toString());
    });
    geolocationBloc.stream.listen((gState) {
      geolocationState = gState;
      if (gState is GeolocationLoadedState) {
        position = gState.position.lat.toString() +
            "," +
            gState.position.lon.toString() +
            " ${gState.position.name}";
        emit(WeatherLoadingState());
        add(WeatherLoading());
      }
    });
    on<WeatherInitialization>((event, emit) async {
      log("Start Loading");
      emit(WeatherLoadingState());
      add(WeatherLoading());
    });
    on<WeatherLoading>((event, emit) async {
      while (geolocationState is! GeolocationLoadedState) {
        await Future.delayed(const Duration(seconds: 1));
      }

      WeatherResponse currentStatus = await Api().getForecast(
        position: position!,
      );
      emit(WeatherLoadedState(currentStatus: currentStatus));
      add(WeatherLoaded());
    });
    on<WeatherLoaded>((event, emit) async {
      log("Finish Loading");
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
