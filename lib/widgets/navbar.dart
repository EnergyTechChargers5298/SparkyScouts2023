import 'package:flutter/material.dart';

// For better indexing
enum PageIndex { menu, pit, auto, sinc }

class Navbar extends StatelessWidget {
  const Navbar({super.key, required this.index});
  final PageIndex index;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        // Exits early if button selected is on same page
        if (index == this.index.index) {
          return;
        }

        // Routes to proper page
        if (index == 0) {
          Navigator.pushNamed(context, '/');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/pit');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/auto');
        } else if (index == 3) {
          Navigator.pushNamed(context, '/sinc');
        }
      },
      selectedIndex: index.index,
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
          label: 'Field',
        ),
        NavigationDestination(
          icon: Icon(Icons.sync),
          label: 'Sinc',
        ),
      ],
    );
  }
}
