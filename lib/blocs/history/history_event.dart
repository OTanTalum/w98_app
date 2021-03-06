part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();
}

class HistoryInitEvent extends HistoryEvent {
  HistoryInitEvent();

  @override
  List<Object?> get props => [];
}

class HistoryAddEvent extends HistoryEvent {
  HistoryAddEvent({required this.location});

  Location location;
  @override
  List<Object?> get props => [location];
}
