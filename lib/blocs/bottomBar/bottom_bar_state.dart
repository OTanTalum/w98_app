part of 'bottom_bar_bloc.dart';

abstract class BottomBarState extends Equatable {
  BottomBarState();
  int index = 0;
}

class BottomBarOnHomePage extends BottomBarState {
  BottomBarOnHomePage({required this.index});
  final int index;

  @override
  List<Object> get props => [index];
}

class BottomBarOnSearchPage extends BottomBarState {
  BottomBarOnSearchPage({required this.index});
  final int index;

  @override
  List<Object> get props => [index];
}

class BottomBarOnDayPage extends BottomBarState {
  BottomBarOnDayPage({required this.index});
  final int index;

  @override
  List<Object> get props => [index];
}

class BottomBarOnWeekPage extends BottomBarState {
  BottomBarOnWeekPage({required this.index});
  final int index;

  @override
  List<Object> get props => [index];
}
