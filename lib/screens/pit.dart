import 'package:flutter/material.dart';

class PitPage extends StatelessWidget {
  const PitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pit Scouting'),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/match');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/sync');
          }
        },
        selectedIndex: 1,
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
