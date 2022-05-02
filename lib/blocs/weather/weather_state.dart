part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {}

class WeatherInitialState extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherLoadingState extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState({required this.currentStatus});
  WeatherResponse currentStatus;

  List<Object?> get props => [currentStatus];
}
