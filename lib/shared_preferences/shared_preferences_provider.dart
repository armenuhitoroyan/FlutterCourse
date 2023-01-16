import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider extends ChangeNotifier {
  late SharedPreferences prefs;
  // late SharedPreferences user;
  var usE;

  TextEditingController controller = TextEditingController();
  String email = "";
  var userEmail;
  List<String> listEmails = [];

  save() async {
    prefs = await SharedPreferences.getInstance();
    listEmails = prefs.getStringList('my_string_list_key') ?? [];
    listEmails.add(controller.text.toString());

    prefs.setStringList('my_string_list_key', listEmails);
    // check_if_already_login().then((value) => print(value));

    notifyListeners();
  }

  retrieve() async {
    prefs = await SharedPreferences.getInstance();
    listEmails = prefs.getStringList('my_string_list_key')!;
    notifyListeners();
  }

  delete() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    email = '';
    notifyListeners();
  }

  check_if_already_login() async {
    prefs = await SharedPreferences.getInstance();

    userEmail = (prefs.get('email'))!;
    usE = prefs.setString('email', controller.text.toString());
    print(usE.hashCode);
    print(userEmail.hashCode);

    if (userEmail == await usE) {
      email = '';
      print(false);
      // prefs.clear;
      notifyListeners();  // armth@gmail.com
    } else {
      // save();
      email = controller.text;
      print('email -> $email');
      print(true);
      notifyListeners();
    }
    notifyListeners();
    return userEmail;
  }
}
