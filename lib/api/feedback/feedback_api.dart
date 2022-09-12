import 'package:dio/dio.dart';

import '../../models/feedback/feedback_model.dart';


class FeedbackApi {
  final Dio appDioClient;

  FeedbackApi(
    this.appDioClient,
  );

  Future<List<dynamic>> getFeedbackData() async {
    List<dynamic> questions = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/feedback',
    );

    var r = result.data as Map;
    if (r.values.first is List) {
      questions = r.values.firstWhere((element) => true);
    }

    return questions;
  }
}
