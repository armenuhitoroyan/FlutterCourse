import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  bool showPassword = false;
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool isChacked = false;
  bool isChangePage = false;
  // var context, page;

  LoginProvider() {
    // onLogin();
  }

  void checkCheckBox() {
    isChacked = true;
    notifyListeners();
  }

  onLogin() {
    if (usernameCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty) {
      isChangePage = true;
      // Navigator.pushNamed(context, page);
      notifyListeners();
    } else {
      isChangePage = false;
    }

    return isChangePage;
  }
}
