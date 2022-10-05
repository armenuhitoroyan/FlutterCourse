import 'package:exam_at/models/quiz.dart';
import 'package:flutter/material.dart';

import '../../../api/project_api.dart';

class QuizProvider extends ChangeNotifier {
  QuizModel? quizModel;
  List<Questions>? questions;
  bool isLoading = false;

  QuizProvider() {
    getData();
  }

  void getData({bool initial = true}) async {
    isLoading = true;
    if (!initial) notifyListeners();

    final result = await ProjectAPI().quizApi.getQuizData();

    if (result.questions!.isEmpty) {
    } else {
      isLoading = false;
      // quizModel = result;
      questions = result.questions;

      notifyListeners();
    }

    print(questions!.first.answers!.first.answerText);
    // print(questions.runtimeType);
    // print(questions!.first.runtimeType);

    notifyListeners();
  }
}
