part of 'week_scrolling_bloc.dart';

@immutable
abstract class WeekScrollingState {}

class WeekScrolling extends WeekScrollingState {
  WeekScrolling({this.scrollPosition = 0, this.fullHeight = 0});
  double? scrollPosition;
  double? fullHeight;

  @override
  List<Object?> get props => [scrollPosition, fullHeight];
}

class WeekScrolled extends WeekScrollingState {
  WeekScrolled(
      {this.percentToHide = 0, this.percentToShow = 0, this.dayIndex = 0});

  int? dayIndex;
  double? percentToHide;
  double? percentToShow;

  @override
  List<Object?> get props => [dayIndex, percentToHide, percentToShow];
}
