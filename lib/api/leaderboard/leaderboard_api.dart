import 'package:dio/dio.dart';
import 'package:exam_at/models/leaderboard.dart';

class LeaderbordApi {
  final Dio appDioClient;

  LeaderbordApi(
    this.appDioClient,
  );

  Future<List<dynamic>> getLeaderBoardData() async {
    List<dynamic> leaderBordList = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/leaderboard',
    );

    print(result.runtimeType);

    // if (result is List) {
    //   leaderBordList = result.data
    //       .map<LeaderbordModel>(
    //         (e) => LeaderbordModel.fromJson(e),
    //       )
    //       .toList();
    // }

    leaderBordList = result.data;
    print(leaderBordList.runtimeType);
    print(  'first ${leaderBordList.first}');

    return leaderBordList;
  }
}
