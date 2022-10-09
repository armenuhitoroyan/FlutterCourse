import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  bool showPassword = false;
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool isChacked = false;

  LoginProvider() {
    
  }

  void checkCheckBox() {
    isChacked = true;
    notifyListeners();
  }
}
