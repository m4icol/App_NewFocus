import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/features/home/screens/dashboard/dashboard.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashBoard(),
    const DashBoard(),
    const DashBoard(),
    const DashBoard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: const Color.fromARGB(255, 204, 185, 241),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: const Color.fromARGB(255, 204, 185, 241),
        height: 52,
        items: <Widget>[
          Icon(
            Icons.grid_view_rounded,
            size: 20,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          Icon(
            Icons.access_time,
            size: 20,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          Icon(
            Icons.bookmarks_outlined,
            size: 20,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          Icon(
            Icons.library_books_outlined,
            size: 20,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ],
        animationDuration: const Duration(milliseconds: 350),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
