import 'package:flutter/material.dart';

import '../../api/indigo_api.dart';
import '../../models/feedback/feedback_model.dart';

class FeedBackProvider extends ChangeNotifier {
  FeedBackModel? feedbackData;
  List<Question> questionsData = [];
  bool showResult = false;

  FeedBackProvider (){
    getData();
  }

  getData() async {   
    final result = await IndigoAPI().feedback.getFeedbackData();
    questionsData = result.questions;    
    notifyListeners();     
  }

  void onChange() {
    showResult = !showResult;
    notifyListeners();
  }
}