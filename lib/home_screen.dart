import 'package:UCskincare/core/utils/app_colors.dart';
import 'package:UCskincare/feature/routine/view/routine_screen.dart';
import 'package:UCskincare/feature/streaks/view/streaks_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const RoutineScreen(),
    const StreaksScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: AppColorsTheme.light().bgInput,
              ),
              label: 'Routine',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
                color: AppColorsTheme.light().bgInput,
              ),
              label: 'Streaks',
            ),
          ]),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
