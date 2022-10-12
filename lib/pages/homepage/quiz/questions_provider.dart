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
  late var answers;

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

  correctAnswerMethod(answerId) {
    checkAnswer = true;
    int lengthAnswers = questionsData[currentQuestionIndex].answers!.length;

    // if (currentQuestionIndex == questionsData.length - 1) {

    //   return onAnswerPressed();
    // }

    for (var i = 0; i < lengthAnswers; i++) {
      if (questionsData[currentQuestionIndex].answers![i].answerId ==
          answerId) {
            if (questionsData[currentQuestionIndex].answers![i].correctAnswer == true) {
              correctAnswer = true;
            } else {
              correctAnswer = false;
            }
        
      } 
    }

    // for (var i = 0, j = 0;
    //     i < questionsData.length && j < questionsData[i].answers!.length;
    //     i++, j++) {
    //   if (questionsData[i].answers![j].answerId == answerId) {
    //     print('answerId = $answerId');
    //     if (questionsData[i].answers![j].correctAnswer == true) {
    //       correctAnswer = true;
    //       print('true: $correctAnswer');
    //       notifyListeners();
    //       return;
    //     } else {
    //       correctAnswer = false;
    //       print('false: $correctAnswer');
    //       notifyListeners();
    //       return;
    //     }
    //     return;
    //   } else {
    //     print(questionsData[i].answers![j].answerId);
    //     correctAnswer = false;
    //     print('false: $correctAnswer');
    //     notifyListeners();
    //     return;
    //   }
    // }

    return correctAnswer;
  }
}
