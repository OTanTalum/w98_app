part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();
}

class HistoryData extends HistoryState {
  HistoryData({this.locations});
  List<Location>? locations;

  @override
  List<Object?> get props => [locations];
}
