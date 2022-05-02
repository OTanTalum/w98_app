part of 'geolocation_bloc.dart';

abstract class GeolocationState extends Equatable {
  const GeolocationState();
}

class GeolocationInitialState extends GeolocationState {
  @override
  List<Object?> get props => [];
}

class GeolocationWithoutPermissionState extends GeolocationState {
  @override
  List<Object?> get props => [];
}

class GeolocationLoadedState extends GeolocationState {
  GeolocationLoadedState({required this.position});
  PositionParameters position;

  @override
  List<Object?> get props => [position];
}
