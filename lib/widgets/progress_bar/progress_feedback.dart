import 'package:flutter/material.dart';

import '../../models/feedback/feedback_model.dart';

class FeedbackProgress  extends StatefulWidget{
  const FeedbackProgress({super.key});

  @override
  State<FeedbackProgress> createState() => _FeedbackProgressState();
}

class _FeedbackProgressState extends State<FeedbackProgress> {

  int currentQuestionIndex = 0;
  List<Question> questionsData = [];
  int length = 0;

  @override
  Widget build(BuildContext context) {
    return progress(currentQuestionIndex, length);
  }

  Widget progress(int currentIndex, int length) {

    currentQuestionIndex = currentIndex;
    questionsData.length = length;
    return  LinearProgressIndicator(
      value: (currentQuestionIndex = currentQuestionIndex+1) / (questionsData.length),
      color: Colors.red   
    );
  }
}