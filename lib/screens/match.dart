import 'package:flutter/material.dart';
import 'package:sparky_scouts/widgets/navbar.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Scouting'),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: const Navbar(index: PageIndex.match),
    );
  }
}
