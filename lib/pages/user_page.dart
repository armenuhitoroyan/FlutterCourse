import 'dart:convert';

import 'package:bmi_calculator/models/user_model.dart';
import 'package:flutter/material.dart';


/*  List<Map<String, dynamic>> us = [
  {
    'name': 'Peter',
    'age': 18,
    'gender': 'male',
    'hobbies': [
      'footbal', 'basketball'
    ],
    'is_work': false,
    'image': 'https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_960_720.png'
  },
]; */
String userJson =
    r'[{ "name": "Peter", "age": 18, "gender": "male","hobbies": ["footbal", "basketball" ], "is_work": false,"image": "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_960_720.png" }]';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<User> users = [];

   List<User> uss = [];

  @override
  void initState() {
    var data = jsonDecode(userJson);

    if (data is List) {
      uss = data
          .map<User>(
            (p) => User.fromJson(p),
          )
          .toList();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: uss.length,
        itemBuilder: (context, index) {
          return Text(uss[index].gender);
        },
      ),
    );
  }
}
