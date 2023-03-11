import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sparky_scouts/screens/auto.dart';
import 'package:sparky_scouts/widgets/navbar.dart';
import 'endgame.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Match Scouting'),
          backgroundColor: Colors.green,
        ),
        //bottomNavigationBar: const Navbar(index: PageIndex.match),
        body: ListView(
          padding: const EdgeInsets.only(right: 1400, top: 30, left: 30),
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: decoration('Help me'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          sendMatch(name: nameController.text);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Endgame()));
        }),
      );

  InputDecoration decoration(String title) => InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(),
      );

  Future sendMatch({required String name}) async {
    final matchNum = FirebaseFirestore.instance.collection('match').doc();

    final json = {'name': name};

    await matchNum.set(json);
  }
}
