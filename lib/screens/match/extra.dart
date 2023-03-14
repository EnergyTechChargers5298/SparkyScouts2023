import 'package:flutter/material.dart';
import 'package:sparky_scouts/models/match.dart';

import '../../main.dart';

class MatchExtraPage extends StatefulWidget {
  const MatchExtraPage({super.key});

  @override
  State<MatchExtraPage> createState() => _MatchExtraPageState();
}

class _MatchExtraPageState extends State<MatchExtraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MatchSurvey.instance.sendData();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const RootPage()));
        },
        child: const Icon(Icons.upload),
      ),
    );
  }
}
