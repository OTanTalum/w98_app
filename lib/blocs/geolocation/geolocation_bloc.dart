import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import '../../models/location.dart';
import '../../servieces/geolocation.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  GeolocationBloc() : super(GeolocationInitialState()) {
    stream.listen((event) {
      log(state.toString());
    });
    on<GeolocationInitialization>((event, emit) async {
      emit(GeolocationInitialState());
      try {
        PositionParameters? currentPosition;
        if (event.position == null) {
          Position geoPosition = await determinePosition();
          currentPosition = PositionParameters(
              lon: geoPosition.longitude, lat: geoPosition.latitude);
        } else {
          currentPosition = event.position;
        }
        emit(GeolocationLoadedState(position: currentPosition!));
      } catch (error) {
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          emit(GeolocationWithoutPermissionState());
        }
        log(error.toString());
      }
    });
  }
}
