import 'package:flutter/cupertino.dart';

class TimeProvider extends ChangeNotifier {
  int val = 1;
  int i = 0;
  int index = 0;
  bool isPressed = false;
  String message = 'success';
  String color = 'black';
  bool isVisible = false;

  List<String> list = [
    'Auto-off after...',
    'Auto-on after...',
    'Daytime auto-off '
  ];

  List<String> ab = [
    'After',
    'Before',
  ];

  TimeProvider() {
    setIndex();
    getData();
  }

  int setIndex() {
    notifyListeners();
    return i;
  }

  int setState(value) {
    val = value;
    notifyListeners();
    return val;
  }

  List<String> getData() {
    notifyListeners();
    return list;
  }

  void onpressed() {
    if (message == 'success' && isPressed == false) {
      message = 'success';
      color = 'blue';
      notifyListeners();
    } else if (message == 'success' && isPressed == false) {
      color = 'black';
      message = 'error';
      notifyListeners();
    } else if (message == 'error' && isPressed == true) {
      color = 'blue';
      message = 'success';
      notifyListeners();
    }

    isPressed = !isPressed;
    notifyListeners();
  }

  bool onVisibleTime() {
    isVisible = i == 0 && color == 'blue' ? true : false;
    notifyListeners();
    return isVisible;
  }

  List<String> afterBeforeTime() {
    notifyListeners();
    return ab;
  }
}
