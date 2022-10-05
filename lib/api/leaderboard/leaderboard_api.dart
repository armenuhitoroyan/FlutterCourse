import 'package:dio/dio.dart';
import 'package:exam_at/models/leaderboard.dart';

class LeaderbordApi {
  final Dio appDioClient;

  LeaderbordApi(
    this.appDioClient,
  );

  Future<LeaderbordModel> getLeaderBoardData() async {
    LeaderbordModel quizData;

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/leaderboard',
    );

    var res = result.data as Map<String, dynamic>;
    quizData = LeaderbordModel.fromJson(res);

    print(quizData);

    return quizData;
  }
}
