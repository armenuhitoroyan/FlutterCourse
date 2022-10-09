import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  bool showPassword = false;
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool isChacked = false;
  bool isChangePage = false;

  // LoginProvider() {
  //   // _onLogin();
  // }

  void checkCheckBox() {
    isChacked = true;
    notifyListeners();
  }

  void onLogin() {
    if (usernameCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty) {
      isChangePage = true;
      notifyListeners();
    } else {
      isChacked = false;
    }
  }
}
