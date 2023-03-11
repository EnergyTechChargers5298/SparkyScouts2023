import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  int matchNum = -1;
  int teamNum = -1;

  int conesScoredAuto = 0;
  int cubesScoredAuto = 0;

  int cubesPosessedAuto = 0;
  int conesPosessedAuto = 0;

  int conesScoredTeleOp = 0;
  int cubesScoredTeleOp = 0;

  int cubesPosessedTeleOp = 0;
  int conesPosessedTeleOp = 0;

  bool chargeStationAuto = false;
  bool chargeStationTeleOp = false;

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
            ),
            const Padding(
                padding: EdgeInsets.only(right: 1000, top: 30, left: 30)),
            TextField(
              keyboardType: TextInputType.number,
              controller: teamController,
              decoration: decoration('Team Number'),
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
              value: chargeStationAuto,
              onChanged: (value) {
                setState(
                  () {
                    chargeStationAuto = value;
                  },
                );
              },
            ),
          ],
        ),
      );

  InputDecoration decoration(String title) => InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(),
      );

  Future sendAuto({required int name}) async {
    final matchNum = FirebaseFirestore.instance.collection('match').doc();

    final json = {'name': name};

    await matchNum.update(json);
  }
}
