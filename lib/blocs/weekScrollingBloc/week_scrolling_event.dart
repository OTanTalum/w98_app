part of 'week_scrolling_bloc.dart';

@immutable
abstract class WeekScrollingEvent {}

class WeekPageScrolling extends WeekScrollingEvent {
  WeekPageScrolling({this.scrollPosition, this.fullHeight, this.contextSize});

  double? contextSize;
  double? scrollPosition;
  double? fullHeight;

  @override
  List<Object?> get props => [scrollPosition, fullHeight, contextSize];
}
