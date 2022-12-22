import 'package:flutter/material.dart';

class AutomationProvider extends ChangeNotifier {

  AutomationProvider() {
    
  }
  bool isShow = false;

  bool onShowButtons() {
    isShow = !isShow;

    print(isShow);
    notifyListeners();
    return isShow;
  }
}
