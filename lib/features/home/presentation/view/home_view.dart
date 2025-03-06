import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planner/features/home/presentation/view/bottom_view/arena_view.dart';
import 'package:wedding_planner/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:wedding_planner/features/home/presentation/view/bottom_view/profile_view.dart';
import 'package:wedding_planner/features/home/presentation/view/bottom_view/schedule_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _views = [
    const DashboardView(), // Search Tab
    const ScheduleView(), // Schedule Tab
    const ArenaView(), // Arena Tab
    const ProfileView(), // Profile Tab
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _performLogout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WedPlan"),
        backgroundColor: const Color.fromARGB(255, 77, 2, 10),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _performLogout(context),
          ),
        ],
      ),
      body: _views[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
