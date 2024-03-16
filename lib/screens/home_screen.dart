import 'package:anime_app/screens/anime_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _screens = [
    const AnimeScreen(),
    const Center(
      child: Text('Search Screen'),
    ),
    const Center(
      child: Text('Categories Screen'),
    ),
    const Center(
      child: Text('Setting Screen'),
    )
  ];

  final _destinations = const [
    NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
    NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
    NavigationDestination(icon: Icon(Icons.category), label: 'Categories'),
    NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        elevation: 12,
        selectedIndex: _selectedIndex,
        destinations: _destinations,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
