import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sparky_scouts/models/match.dart';

import 'match/matchroot.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  final teamController = TextEditingController();
  final matchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
        children: [
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            controller: matchController,
            decoration: decoration('Match Number'),
            onChanged: (value) {
              setState(() {
                if (value.isEmpty) {
                  value = "-1";
                }
                MatchSurvey.instance.survey.matchNumber = int.parse(value);
              });
            },
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            controller: teamController,
            decoration: decoration('Team Number'),
            onChanged: (value) {
              setState(() {
                if (value.isEmpty) {
                  value = "-1";
                }
                MatchSurvey.instance.survey.teamNumber = int.parse(value);
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.start_rounded),
        onPressed: () {
          if (teamController.text == "" || matchController.text == "") {
            return;
          } else {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MatchRootPage()));
          }
        },
      ),
    );
  }

  InputDecoration decoration(String title) => InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(),
      );
}
