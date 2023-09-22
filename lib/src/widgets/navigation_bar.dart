import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/features/home/screens/dashboard/dashboard.dart';
import 'package:newfocus_v2/src/features/sections/notes/notes_page.dart';
import 'package:newfocus_v2/src/features/sections/pomodoro/pomodoro.dart';
import 'package:newfocus_v2/src/features/sections/tasks/task_page.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  @override
  _NavigationBarWidgetState createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _screens = [
    const DashBoard(),
    TaskPage(),
    NotesPage(),
    PomodoroScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: const Color.fromARGB(255, 204, 185, 241),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: const Color.fromARGB(255, 204, 185, 241),
        height: 52,
        items: <Widget>[
          Icon(
            Icons.grid_view_outlined,
            size: 20,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          Icon(
            Icons.format_list_bulleted_outlined,
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
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 350),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
