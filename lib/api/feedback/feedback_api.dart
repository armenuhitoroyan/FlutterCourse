import 'dart:convert';

import 'package:dio/dio.dart';

import '../../models/feedback/feedback_model.dart';


class FeedbackApi {
  final Dio appDioClient;

  FeedbackApi(
    this.appDioClient,
  );

Future<List<Question>> getQuestionsData() async {
    List<Question> questions = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/feedback',
    );

    var res = result.data as Map<String, dynamic>;
    // print(res.values.first);
 
      questions = res.values.first
          .map<Question>(
            (e) => Question.fromJson(e),
          )
          .toList();
          // print(questions);

    print(questions);
    return questions;
  }
}
