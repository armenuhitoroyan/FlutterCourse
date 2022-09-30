import 'package:flutter/material.dart';
import 'package:team_project/models/img_model.dart';

import '../../api/teamproject_api.dart';

class HomepageProvider extends ChangeNotifier {
  ImgModel? imgModel;
  List<Photo>? photos;
  MapEntry<String, dynamic>? urls;
  bool isLoading = false;

  HomepageProvider() {
    getData();
  }

  void getData({bool initial = true}) async {
    isLoading = true;
    if (!initial) notifyListeners();

    final result = await TeamProjectAPI().imgPages.getNewYearData();

    if (result.photos!.isEmpty) {
    }
    else {
      isLoading = false;
      imgModel = result;
      photos = result.photos;

      notifyListeners();
    }
    
    // print(imgModel.runtimeType);
    // print(photos.runtimeType);
    // print(photos!.first.runtimeType);

    notifyListeners();
  }
}
