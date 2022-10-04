import 'package:flutter/material.dart';
import 'package:team_project/models/img_model.dart';

import '../../api/shared_pref_api.dart';
import '../../api/teamproject_api.dart';

class HomepageProvider extends ChangeNotifier with SharedPrefAPI {
  ImgModel? imgModel;
  List<Photo>? photos;
  MapEntry<String, dynamic>? urls;
  bool isLoading = false;
  bool isVisible = false;
  String key = '';
  String comment = '';
  bool isShow = false;
  String getText = '';
  String fieldText = '';

  HomepageProvider() {
    getData();
  }

  void getData({bool initial = true}) async {
    isLoading = true;
    if (!initial) notifyListeners();

    final result = await TeamProjectAPI().imgPages.getImagesData();

    if (result.photos!.isEmpty) {
    } else {
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

  visibleTextField() {
    isVisible = !isVisible;
    notifyListeners();
    return isVisible;
  }

  get text {
    return sharedPref(key, comment);
  }

  show() {
    isShow = true;
    notifyListeners();
  }

  showText(String text) {
    fieldText = text;
    notifyListeners();
  }

  getTextData() {
    getString = super.getString;
    notifyListeners();
  }
}
