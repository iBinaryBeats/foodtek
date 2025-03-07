import 'package:flutter/material.dart';
import 'package:foodtek/features/dashboard/presentation/screens/favorites_screen.dart';
import 'package:foodtek/features/dashboard/presentation/screens/history_screen.dart';
import 'package:foodtek/features/dashboard/presentation/screens/home_screen.dart';
import 'package:foodtek/features/dashboard/presentation/screens/profile_screen.dart';

class CustomNavigationBar extends StatefulWidget {
  final int intialPage;
  CustomNavigationBar({super.key, this.intialPage = 0});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late int currentPage;

  @override
  void initState() {
    super.initState();
    widget.intialPage;
  }

  final List<Widget> pages = [
    const FavoritesScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
