import 'package:flutter/material.dart';
import 'package:team_project/models/img_model.dart';

import '../../api/teamproject_api.dart';

class HomepageProvider extends ChangeNotifier {
  ImgModel? imgModel;
  List<Photo>? photos;
  MapEntry<String, dynamic>? urls;
  bool isLoading = true;

  HomepageProvider() {
    getData();
  }

  void getData() async {
    isLoading = true;

    final result = await TeamProjectAPI().imgPages.getNewYearData();
    isLoading = false;
    imgModel = result;
    photos = result.photos;
   
   

    // print(imgModel.runtimeType);
    // print(photos.runtimeType);
    // print(photos!.first.runtimeType);

    notifyListeners();
  }
}
