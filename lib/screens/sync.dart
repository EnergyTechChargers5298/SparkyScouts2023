import 'package:flutter/material.dart';
import 'package:sparky_scouts/widgets/navbar.dart';

class SyncPage extends StatelessWidget {
  const SyncPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync'),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: const Navbar(index: PageIndex.sync),
    );
  }
}
