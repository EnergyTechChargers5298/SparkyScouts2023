import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Screen'),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/pit');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/match');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/sync');
          }
        },
        selectedIndex: 0,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.handyman),
            label: 'Pit',
          ),
          NavigationDestination(
            icon: Icon(Icons.gamepad),
            label: 'Match',
          ),
          NavigationDestination(
            icon: Icon(Icons.sync),
            label: 'Sync',
          ),
        ],
      ),
    );
  }
}
