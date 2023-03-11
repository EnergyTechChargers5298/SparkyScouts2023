import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sparky_scouts/utils/matchdoc.dart';
import 'package:sparky_scouts/widgets/navbar.dart';

class Endgame extends StatefulWidget {
  const Endgame({Key? key}) : super(key: key);

  @override
  State<Endgame> createState() => _EndGameState();
}

class _EndGameState extends State<Endgame> {
  MatchDoc matchDoc = MatchDoc.getInstance();
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
                decoration: decoration('Not Team Number'),
                onChanged: (value) {
                  setState(() {
                    matchDoc.conesScoredAuto = int.parse(value);
                  });
                }),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          matchDoc.sendData(doc: matchDoc);
        }),
      );

  InputDecoration decoration(String title) => InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(),
      );
}
