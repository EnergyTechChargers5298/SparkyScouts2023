import 'package:cloud_firestore/cloud_firestore.dart';

class MatchDoc {
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
  bool chargeStationEndgame = false;
  static MatchDoc why = MatchDoc();

  MatchDoc();

  static MatchDoc getInstance() {
    return why;
  }

  reset() {
    why.matchNum = -1;
    why.teamNum = -1;

    why.conesScoredAuto = 0;
    why.cubesScoredAuto = 0;

    why.cubesPosessedAuto = 0;
    why.conesPosessedAuto = 0;

    why.conesScoredTeleOp = 0;
    why.cubesScoredTeleOp = 0;

    why.cubesPosessedTeleOp = 0;
    why.conesPosessedTeleOp = 0;

    why.chargeStationAuto = false;
    why.chargeStationEndgame = false;
  }

  Future sendData({required MatchDoc doc}) async {
    final matchNum = FirebaseFirestore.instance.collection('match').doc();

    final json = {
      'Match Num': why.matchNum,
      'Team Num': why.teamNum,
      'Cones Scored Auto': why.conesScoredAuto,
      // 'Cubes Scored Auto': why.cubesScoredAuto,
      // 'Cubes Posessed Auto': why.cubesPosessedAuto,
      // 'Cones Posessed Auto': why.conesPosessedAuto,
      // 'Cones Scored TeleOp': why.conesScoredTeleOp,
      // 'Cubes Scored TeleOp': why.cubesScoredTeleOp,
      // 'Cubes Posessed TeleOp': why.cubesPosessedTeleOp,
      // 'Cones Posessed TeleOp': why.conesPosessedTeleOp,
      'Charge Station Auto': why.chargeStationAuto,
      // 'Charge Station Endgame': why.chargeStationEndgame
    };

    await matchNum.set(json);

    MatchDoc.getInstance().reset();
  }
}
