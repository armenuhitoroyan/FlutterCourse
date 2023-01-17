import 'package:email_auth/email_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../base/regexp.dart';

class SharedPreferencesProvider extends ChangeNotifier {
  late SharedPreferences prefs;
  // late SharedPreferences user;
  var usE;

  TextEditingController controller = TextEditingController();
  String email = "";
  String message = '';
  var userEmail;
  List<String> listEmails = [];
  List<String> listEmail = [];
  String stringValue = '';
  late SharedPreferences prefsh;

  Future<String> onValidateEmail() async {
    final regExp = RegExp(RegularExpressions.email); // at@gmail.com
    userEmail = await getStringValueSF().then((value) => value);
   
    print('userEmail: $userEmail');

    if (controller.text.isNotEmpty) {
      if (regExp.hasMatch(controller.text)) {
        email = '${controller.text}@gmail.com';
        //  email = controller.text;
        if (userEmail != email) {
          message = 'Email is valid!';
          await save(email);
        } else {
          message = 'Email already exists!'; // toroyan.armenuhi@yahoo.com
          print(message);
        }
        controller.text = '';
      } else {
        email = '';
        print(email);
        message = 'Email is not valid!';
        controller.text = '';
      }

      notifyListeners();
    } else {
      message = 'Email is not valid!';
      email = '';
      print(email);
      controller.text = '';
      notifyListeners();
    }

    return message;
  }

  // save() async {
  //   prefs = await SharedPreferences.getInstance();
  //   listEmails = prefs.getStringList('my_string_list_key') ?? [];
  //   listEmails.add(controller.text.toString());

  //   prefs.setStringList('my_string_list_key', listEmails);
  //   // check_if_already_login().then((value) => print(value));

  //   notifyListeners();
  // }

  Future<String> save(String email) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    listEmails.add(email);
    print(listEmails);
    notifyListeners();
    return email;
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

  void sendOTP() async {
    EmailAuth(sessionName: 'Test Session');
  }

  Future<String> getStringValueSF() async {
    prefsh = await SharedPreferences.getInstance();
    //Return String
    if (prefsh.getString('email') == null) {
      stringValue = '';
    } else {
      stringValue = prefsh.getString('email')!;
    }
    return stringValue;
  }

  Future<List<String>> getStringValuesSF() async {
    prefsh = await SharedPreferences.getInstance();

    // final myStringList = prefs.getStringList('my_string_list_key') ?? [];

    if (prefsh.getStringList('my_string_list_key') == null) {
      listEmail = [];
    } else {
      listEmail = prefsh.getStringList('my_string_list_key')!;
    }
    return listEmail;
  }
}
