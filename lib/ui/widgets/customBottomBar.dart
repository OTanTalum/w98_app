import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bottomBar/bottom_bar_bloc.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({required this.context});
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 3,
        selectedIconTheme: IconThemeData(color: Colors.orange[200]),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        currentIndex: context.read<BottomBarBloc>().state.index,
        fixedColor: Colors.orange[200],
        backgroundColor: Colors.blue[700],
        selectedFontSize: 18,
        unselectedFontSize: 16,
        iconSize: 36,
        onTap: (int index) {
          switch (index) {
            case 0:
              context.read<BottomBarBloc>().add(BottomBarHomeTapEvent());
              break;
            case 1:
              context.read<BottomBarBloc>().add(BottomBarSearchTapEvent());
              break;
            case 2:
              context.read<BottomBarBloc>().add(BottomBarDayTapEvent());
              break;
            case 3:
              context.read<BottomBarBloc>().add(BottomBarWeekTapEvent());
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue[700],
            label: "Now",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue[700],
            label: "Search",
            icon: Icon(
              Icons.search,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue[700],
            label: "Today",
            icon: Icon(Icons.settings_system_daydream),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue[700],
            label: "Week",
            icon: Icon(Icons.view_week_outlined),
          ),
        ]);
  }
}
