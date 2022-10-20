import 'package:flutter/cupertino.dart';

import '../../../base/regexp.dart';

class LoginProvider extends ChangeNotifier {
  bool showPassword = false;
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool isChacked = false;
  bool isChangePage = false;
  bool showDialog = false;

  LoginProvider() {
    // onLogin();
  }

  void checkCheckBox() {
    isChacked = true;
    notifyListeners();
  }

  onLogin() {
    final regExp = RegExp(RegularExpressions.email);

    if (usernameCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty) {
      if (regExp.hasMatch(usernameCtrl.text)) {
        isChangePage = true;
      } else {
        showDialog = true;
      }

      notifyListeners();
    } else {
      isChangePage = false;
    }

    return isChangePage;
  }
}
