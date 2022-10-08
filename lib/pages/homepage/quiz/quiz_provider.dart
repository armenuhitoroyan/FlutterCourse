import 'package:exam_at/models/quiz.dart';
import 'package:flutter/material.dart';

import '../../../api/project_api.dart';
import '../../../styles/style_of_container.dart';

class QuizProvider extends ChangeNotifier {
  QuizModel? quizModel;
  List<Questions>? questions;
  bool isLoading = false;
  int index = 5;
  bool isChangeText = false;
  List<Color> colors = [];

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
      await Future.delayed(
        const Duration(seconds: 4), () {
        index = index-1;
        notifyListeners();
      } );
    }
  }
}
