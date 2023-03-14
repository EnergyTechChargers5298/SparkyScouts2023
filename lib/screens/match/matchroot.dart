import 'package:flutter/material.dart';
import 'package:sparky_scouts/main.dart';
import 'package:sparky_scouts/screens/match/auto.dart';
import 'package:sparky_scouts/screens/match/endgame.dart';
import 'package:sparky_scouts/screens/match/extra.dart';
import 'package:sparky_scouts/screens/match/teleop.dart';

class MatchRootPage extends StatefulWidget {
  const MatchRootPage({super.key});

  @override
  State<MatchRootPage> createState() => _MatchRootPageState();
}

class _MatchRootPageState extends State<MatchRootPage> {
  int currentPage = 0;
  List<Widget> pages = const [
    MatchAutoPage(),
    MatchTeleOpPage(),
    MatchEndGamePage(),
    MatchExtraPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Scouting'),
        automaticallyImplyLeading: false,
      ),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.arrow_back),
            label: 'Back',
          ),
          NavigationDestination(
            icon: Icon(Icons.close),
            label: 'Close',
          ),
          NavigationDestination(
            icon: Icon(Icons.arrow_forward),
            label: 'Next',
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            if (index == 0 && currentPage == 0) {
              return;
            }
            if (index == 2 && currentPage == 3) {
              return;
            }
            if (index == 0) {
              currentPage = currentPage - 1;
            }
            if (index == 2) {
              currentPage = currentPage + 1;
            }
            if (index == 1) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const RootPage()));
            }
          });
        },
        selectedIndex: 1,
      ),
    );
  }
}
