import 'package:flutter/material.dart';
import 'package:team_project/models/img_model.dart';

import '../../../../api/teamproject_api.dart';

class PhotosProvider extends ChangeNotifier {
  ImgModel? imgModel;
  List<Photo>? photos;
  MapEntry<String, dynamic>? urls;
  bool isLoading = false;

  PhotosProvider() {
    getData();
  }

  void getData({bool initial = true}) async {
    isLoading = true;
    if (!initial) notifyListeners();

    final result = await TeamProjectAPI().cityImgApi.getCityPhotosData();

    if (result.photos!.isEmpty) {
    }
    else {
      isLoading = false;
      imgModel = result;
      photos = result.photos;

      notifyListeners();
    }
    
    notifyListeners();
  }
}
