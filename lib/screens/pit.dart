import 'package:flutter/material.dart';
import 'package:sparky_scouts/widgets/navbar.dart';

class PitPage extends StatelessWidget {
  const PitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pit Scouting'),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: const Navbar(index: PageIndex.pit),
    );
  }
}
