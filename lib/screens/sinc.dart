import 'package:flutter/material.dart';
import 'package:sparky_scouts/widgets/navbar.dart';

class SincPage extends StatelessWidget {
  const SincPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sinc'),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: const Navbar(index: PageIndex.sinc),
    );
  }
}
