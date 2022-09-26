import 'package:flutter/cupertino.dart';

class PagesProvider extends ChangeNotifier {
  bool isClickedIcon = false;

  PagesProvider(
    // getIcon()
  );

  getIcon() { 
    isClickedIcon = !isClickedIcon; 
    notifyListeners();     
  }

  void onChange() {
    isClickedIcon = !isClickedIcon;
    notifyListeners();
  }
  
}