import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<void> addQuizData(Map quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("quiz")
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      e.toString();
    });
  }

  Future<void> addQuestionData(Map questionData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("quiz")
        .doc(quizId)
        .collection("QNA")
        .add(questionData)
        .catchError((e) {
      print(e);
    });
  }

  getQuizzesData() async {
    return await FirebaseFirestore.instance.collection("quiz").snapshots();
  }

  getQuizData(String quizId) async {
    return await FirebaseFirestore.instance
        .collection("quiz")
        .doc(quizId)
        .collection("QNA")
        .get();
  }
}
