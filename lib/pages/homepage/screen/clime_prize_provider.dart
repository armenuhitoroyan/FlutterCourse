import 'package:flutter/cupertino.dart';

class ClimePrizeProvider extends ChangeNotifier {
  bool isChangePage = false;
  var prov;

  onChangePage() {
    isChangePage = true;
    notifyListeners();
  }
}
