import 'package:exam_at/api/project_api.dart';
import 'package:flutter/material.dart';

import '../../../models/quiz.dart';

class QuestionsProvider extends ChangeNotifier {
  QuestionsProvider() {
    getData();
  }

  QuizModel? quizData;
  List<Questions> questionsData = [];
  bool isLoading = true;

  int currentQuestionIndex = 0;
  bool showResult = false;
  bool correctAnswer = false;
  bool checkAnswer = false;
  PageController pageController = PageController();
  int questionIndex = 0;
  double scale = 1.0;
  int seconds = 60;
  String text = 'Go!';

  getData() async {
    isLoading = true;
    final result = await ProjectAPI().quizApi.getQuizData();

    isLoading = false;
    quizData = result;
    questionsData = result.questions!;
    notifyListeners();
  }

  onChangeIndex(index) {
    currentQuestionIndex = index;
    notifyListeners();
  }

  onAnswerPressed() {
    showResult = true;
    notifyListeners();
  }

  answerPressed(answerId) {
    if (currentQuestionIndex == questionsData.length - 1) {
      return onAnswerPressed();
    } else {
      pageController.animateToPage(currentQuestionIndex + 1,
          curve: Curves.easeInOut, duration: const Duration(milliseconds: 700));

      notifyListeners();
    }
  }

  correctAnswerMethod(answerId) async {
    checkAnswer = true;
    int lengthAnswers = questionsData[currentQuestionIndex].answers!.length;

    for (var i = 0; i < lengthAnswers; i++) {
      if (questionsData[currentQuestionIndex].answers![i].answerId ==
          answerId) {
        questionIndex = currentQuestionIndex;
        if (questionsData[currentQuestionIndex].answers![i].correctAnswer ==
            true) {
          correctAnswer = true;
          notifyListeners();
          return;
        } else {
          correctAnswer = false;
          notifyListeners();
          return;
        }
      }
    }
    notifyListeners();
    return correctAnswer;
  }

}
