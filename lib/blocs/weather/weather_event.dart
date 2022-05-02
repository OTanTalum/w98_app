part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherInitialization extends WeatherEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherLoading extends WeatherEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherLoaded extends WeatherEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
