import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sparky_scouts/screens/endgame.dart';
import 'package:sparky_scouts/screens/match.dart';
import 'package:sparky_scouts/utils/matchdoc.dart';
import 'package:sparky_scouts/widgets/navbar.dart';

class AutoPage extends StatefulWidget {
  const AutoPage({Key? key}) : super(key: key);

  @override
  State<AutoPage> createState() => _AutoPageState();
}

class _AutoPageState extends State<AutoPage> {
  final teamController = TextEditingController();
  final matchController = TextEditingController();

  MatchDoc matchDoc = MatchDoc.getInstance();

  //pull the matchdoc

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Autonomous'),
          backgroundColor: Colors.green,
        ),
        bottomNavigationBar: const Navbar(index: PageIndex.auto),
        body: ListView(
          padding: const EdgeInsets.only(right: 1000, top: 30, left: 30),
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              controller: matchController,
              decoration: decoration('Match Number'),
              onChanged: (value) {
                setState(() {
                  matchDoc.matchNum = int.parse(value);
                });
              },
            ),
            const Padding(
                padding: EdgeInsets.only(right: 1000, top: 30, left: 30)),
            TextField(
              keyboardType: TextInputType.number,
              controller: teamController,
              decoration: decoration('Team Number'),
              onChanged: (value) {
                setState(() {
                  matchDoc.teamNum = int.parse(value);
                });
              },
            ),
            const Padding(
                padding: EdgeInsets.only(right: 1000, top: 30, left: 30)),
            SizedBox.fromSize(
              size: const Size(50, 30),
              child: const Text(
                'Charge Station?',
                style: TextStyle(color: Color.fromARGB(255, 2, 0, 148)),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(right: 2000, top: 30, left: 30)),
            Switch(
              value: matchDoc.chargeStationAuto,
              onChanged: (value) {
                setState(
                  () {
                    matchDoc.chargeStationAuto = value;
                  },
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Endgame()));
          },
        ),
      );

  InputDecoration decoration(String title) => InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(),
      );
}
