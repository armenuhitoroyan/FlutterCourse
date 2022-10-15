import 'package:flutter/material.dart';
import '../../../styles/style_of_container.dart';

class QuizProvider extends ChangeNotifier {
  bool isLoading = false;
  int index = 5;
  var text = 'Get Ready';
  bool isChangeText = false;
  List<Color> colors = [];
  Color answerColor = const Color.fromRGBO(249, 249, 249, 0.8);
  bool correctAnswer = false;
  int currentQuestionIndex = 0;
  bool showResult = false;
  PageController pageController = PageController();
  int second = 60;
  List<int> timer = [];

  ColorsContainer colorsContainer = ColorsContainer();

  QuizProvider() {
    changeColors();
    changeIndex();
    changeSeconds();
  }

  void changeColors() {
    colors = colorsContainer.colors;
  }

  void changeIndex() async {
    Duration interval = const Duration(seconds: 1);
    Stream<int> stream = Stream<int>.periodic(interval, (it) => -1 * (it - 5));

    await for (int i in stream) {
      index = i;
      text = '$index';
      if (i == 0) {
        text = 'GO';
        break;
      }
      notifyListeners();
    }

    notifyListeners();
  }

  void changeText() {
    isChangeText = true;
    notifyListeners();
  }

  void correctAnswerColor() {
    correctAnswer = true;
    notifyListeners();
  }

  changeSeconds() async {
    Duration interval = const Duration(seconds: 1);
    Stream<int> stream = Stream<int>.periodic(interval, (it) => -1 * (it - 60));
    await for (int i in stream) {
      second = i;
      if (i == 0) {
        // i *= -1;
        break;
      }
      notifyListeners();
    }

    notifyListeners();
  }
}
