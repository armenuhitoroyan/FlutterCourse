import 'dart:convert';

import 'package:bmi_calculator/constants.dart';
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
    r'[{ "name": "Peter", "age": 18, "gender": "male","hobbies": ["footbal", "basketball" ], "is_work": false,"image": "https://openclipart.org/image/800px/4749" }, { "name": "David", "age": 13, "gender": "male","hobbies": ["footbal" ], "is_work": false,"image": "https://openclipart.org/image/800px/279929" }, { "name": "Maria", "age": 29, "gender": "female","hobbies": ["dance" ], "is_work": true,"image": "https://openclipart.org/image/800px/295783" }]';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<User> users = [];

   List<User> user = [];

  @override
  void initState() {
    var data = jsonDecode(userJson);

    if (data is List) {
      user = data
          .map<User>(
            (p) => User.fromJson(p),
          )
          .toList();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return userW();
  }

  Widget userW() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBG,
        centerTitle: true,
        title: const Text('Users', style: kBodyTextStyle),
      ),
      body: ListView.builder(
        itemCount: user.length,
        itemBuilder: (context, index) {
          // return Text(uss[index].gender);
          return Card(
            clipBehavior: Clip.antiAlias,
            // ignore: sort_child_properties_last
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.supervised_user_circle),
                  title: Text(user[index].name),
                  subtitle: Text(
                    user[index].gender,
                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  ),
                ),  
                 Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'I have many preferences․ Those are ${user[index].hobbies.map((e) => e,)}',
                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  ),
                ),
              
                // Image.asset('assets/armath_robot.png'),
                Image(image: NetworkImage(user[index].image), height: 100)
              ],
            ),
            color: kBG,
          );
        },
      ),
    );
  }
}
