import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesWidget extends StatefulWidget {
  @override
  State<SharedPreferencesWidget> createState() =>
      _SharedPreferencesWidgetState();
}

class _SharedPreferencesWidgetState extends State<SharedPreferencesWidget> {
  TextEditingController commentCtrl = TextEditingController();
  int i = 1;
  var key = 'Comment';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: sharedPref(key, commentCtrl.text),
        builder: (context, snapshot) {
          var comments = snapshot.data;
          // if (snapshot.hasData) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                TextField(
                  controller: commentCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Comment',
                    border: OutlineInputBorder(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextButton(
                    onPressed: () {
                      sharedPref(key, commentCtrl.text);
                      Navigator.pop(context);
                      setState(() {
                        key = '${key} ${i + 1}';
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueGrey, // Background Color
                    ),
                    child: const Text('SEND'),
                  ),
                ),
              ],
            ),
          );
          // }
        });
  }

  Future sharedPref(var key, var comment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, comment);

    var getString = prefs.getString(key);
    print(getString);
  }
}
