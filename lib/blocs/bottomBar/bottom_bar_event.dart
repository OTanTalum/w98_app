part of 'bottom_bar_bloc.dart';

abstract class BottomBarEvent extends Equatable {
  BottomBarEvent();
}

class BottomBarHomeTapEvent extends BottomBarEvent {
  @override
  List<Object?> get props => [];
}

class BottomBarSearchTapEvent extends BottomBarEvent {
  @override
  List<Object?> get props => [];
}

class BottomBarDayTapEvent extends BottomBarEvent {
  @override
  List<Object?> get props => [];
}

class BottomBarWeekTapEvent extends BottomBarEvent {
  @override
  List<Object?> get props => [];
}
