import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentsWidget extends StatefulWidget {
  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  TextEditingController commentCtrl = TextEditingController();
  int i = 1;
  var key = 'Comment';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContext();
  }

  Widget _buildContext() {
    return FutureBuilder(
      future: sharedPref(key, commentCtrl.text),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var comments = snapshot.data;
        }  
        return Padding(
          padding: const EdgeInsets.all(30),
          child: Card(
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
                      // Navigator.pop(context);
                      setState(() {
                        key = '${key} ${i + 1}';
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: const Text('SEND'),
                  ),
                ),
                Text(commentCtrl.text),
                Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: const Text('Ok'),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future sharedPref(var key, var comment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, comment);

    var getString = prefs.getString(key);
    print(getString);
  }
}
