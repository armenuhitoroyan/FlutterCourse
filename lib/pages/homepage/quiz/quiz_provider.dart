import 'package:exam_at/models/quiz.dart';
import 'package:flutter/material.dart';

import '../../../api/project_api.dart';
import '../../../styles/style_of_container.dart';

class QuizProvider extends ChangeNotifier {
  QuizModel? quizModel;
  List<Questions>? questions;
  bool isLoading = false;
  int index = 5;
  var text = 'Get Ready';
  bool isChangeText = false;
  List<Color> colors = [];
  Color answerColor = Color.fromRGBO(249, 249, 249, 0.8);
  bool correctAnswer = false;
  int currentQuestionIndex = 0;
  bool showResult = false;
  PageController pageController = PageController();

  ColorsContainer colorsContainer = ColorsContainer();

  QuizProvider() {
    getData();
    changeColors();
    changeIndex();
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

    notifyListeners();
  }

  void changeColors() {
    colors = colorsContainer.colors;
  }

  void changeIndex() async {
    for (var i = 5; i > 0; i--) {
      await Future.delayed(const Duration(seconds: 4), () {
        index = index - 1;
        text = '$index';
        if (index == 0) {
          text = 'GO';
        }
        notifyListeners();
      });
    }
  }

  void changeText() {
    isChangeText = true;
    notifyListeners();
  }

  void correctAnswerColor() {
    if (questions!.first.answers!.first.correctAnswer == true) {
      correctAnswer = true;
    }  
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
    if (currentQuestionIndex == questions!.length - 1) {
      return onAnswerPressed();
    } else {
      pageController.animateToPage(currentQuestionIndex + 1,
          curve: Curves.easeInOut, duration: const Duration(milliseconds: 700));
      notifyListeners();
    }
  }

  
}
