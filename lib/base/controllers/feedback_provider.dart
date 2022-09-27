import 'package:flutter/material.dart';

import '../../api/indigo_api.dart';
import '../../models/feedback/feedback_model.dart';

class FeedBackProvider extends ChangeNotifier {
  FeedBackModel? feedbackData;
  List<Question> questionsData = [];
  bool showResult = false;
  int length = 0;

  FeedBackProvider (){
    getData();
  }

  getData() async {   
    final result = await IndigoAPI().feedback.getFeedbackData();
    feedbackData = result;
    questionsData = result.questions;   

    print(questionsData.map((e) => e.answers.map((a) => a.answerText))) ;
    notifyListeners();     
  }

  void onChange() {
    notifyListeners();
  }

  void onChangeQuestion() {

    showResult = true;

    showResult;
    notifyListeners();
  }
}