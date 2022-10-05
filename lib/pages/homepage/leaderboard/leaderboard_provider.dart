import 'package:exam_at/api/project_api.dart';
import 'package:exam_at/models/leaderboard.dart';
import 'package:flutter/material.dart';

class LeaderBoarderProvider extends ChangeNotifier {
  bool isLoading = false;
  List<dynamic> list = [];

  LeaderBoarderProvider() {
    getData();
  }

  void getData({bool initial = true}) async {
    isLoading = true;
    if (!initial) notifyListeners();

    final result = await ProjectAPI().leaderbordApi.getLeaderBoardData();

    if (result.isEmpty) {
    } else {
      isLoading = false;
      list = result;

      notifyListeners();
    }

    // print(imgModel.runtimeType);
    print(list.runtimeType);
    print(list.first.runtimeType);
    print('list: ${list.first}');
  }
}
