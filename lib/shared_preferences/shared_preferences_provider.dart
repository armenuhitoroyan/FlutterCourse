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
  List<String> listEmail = [];
  List<String> listEmails = [];
  List<String> list = [];

  String stringValue = '';
  late SharedPreferences prefsh;

  Future<String> onValidateEmail() async {
    final regExp = RegExp(RegularExpressions.email); // at@gmail.com
    userEmail = await getStringValueSF().then((value) => value);
    //

    if (controller.text.isNotEmpty) {
      if (regExp.hasMatch(controller.text)) {
        email = controller.text;
        //
        //  email = controller.text;

        if (userEmail != email) {
          message = 'Email is valid!';
          // listEmails = await getStringValuesSF().then((value) => value);
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
        print(message);
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

  Future<List<String>> save(String email) async {
    prefs = await SharedPreferences.getInstance();
    // await prefs.setString('email', email);
    bool isSave = false;
    list.add(email);
    listEmails = await getStringValuesSF().then((value) => value);

    if (listEmails.isNotEmpty) {
      listEmails.forEach((element) async {
        print(element);
        if (element != controller.text) {
          isSave = true;
          print(isSave);
        } else {
          isSave = false;
          print(isSave);
          return;
        }
      });
    } else {
      await prefs.setStringList('emails', list);
    }

    if (isSave != false) {
      await prefs.setStringList('emails', list);
      print('Success!');
    } else {
      print('Failed');
    }

    notifyListeners();
    return listEmails;
  }

  delete() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.clear();
    listEmails = [];
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

    if (prefsh.getStringList('emails') == null) {
      listEmail = [];
    } else {
      listEmail = prefsh.getStringList('emails')!;
    }

    return listEmail;
  }
}
