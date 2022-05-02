part of 'geolocation_bloc.dart';

abstract class GeolocationEvent extends Equatable {
  const GeolocationEvent();
}

class GeolocationInitialization extends GeolocationEvent {
  GeolocationInitialization({this.position});
  PositionParameters? position;

  @override
  // TODO: implement props
  List<Object?> get props => [position];
}
