import 'package:exam_at/api/project_api.dart';
import 'package:exam_at/models/leaderboard.dart';
import 'package:flutter/material.dart';

class LeaderBoarderProvider extends ChangeNotifier {
  bool isLoading = false;
  LeaderbordModel? leaderbordModel;

  LeaderBoarderProvider() {
    getData();
  }

  void getData({bool initial = true}) async {
    
    isLoading = true;
    if (!initial) notifyListeners();

    final result = await ProjectAPI().leaderbordApi.getLeaderBoardData();

    if (result == null) {
    } else {
      isLoading = false;
      leaderbordModel = result;

      notifyListeners();
    }

    // print(imgModel.runtimeType);
    // print(photos.runtimeType);
    // print(photos!.first.runtimeType);
  }
}
