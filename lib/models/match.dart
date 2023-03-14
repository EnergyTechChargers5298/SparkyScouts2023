import 'package:cloud_firestore/cloud_firestore.dart';

class MatchSurvey {
  Survey survey = Survey();

  static MatchSurvey instance = MatchSurvey();

  reset() {
    survey = Survey();
  }

  Map<String, dynamic> toJson() =>
      {"matchNumber": survey.matchNumber, "teamNumber": survey.teamNumber};

  Future sendData() async {
    await FirebaseFirestore.instance.collection('match').doc().set(toJson());
  }
}

class Survey {
  int matchNumber = -1;
  int teamNumber = -1;
}
