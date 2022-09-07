import 'dart:convert';
import 'package:shop/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/user_model.dart';


class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  @override
  Widget build(BuildContext context) {
    return usersWidget();
  }

   Future<List<User>> readJsonData() async {
      final response = await rootBundle.loadString('json/users.json');
      final data = json.decode(response) as List<dynamic>;

      return data.map((e) => User.fromJson(e)).toList();
   }

  Widget usersWidget() {
    return FutureBuilder(
      future: readJsonData(),
      builder: (context, data) {
       if (data.hasError) {
         return Center(child: Text('${data.error}'));
       } else if(data.hasData) {
       var users = data.data as List<User>;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kBG,
              centerTitle: true,
              title: const Text('Users', style: kBodyTextStyle),
            ),
            body: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  color: kBG,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.supervised_user_circle_sharp),
                        // ignore: unnecessary_string_interpolations
                        title: Text('${users[index].name}'),
                        subtitle: Text(
                          '${users[index].age}',
                          style: TextStyle(color: Colors.white.withOpacity(0.6)),
                        ),  
                      ),
                      Image(image: NetworkImage(users[index].image.toString()), height: 100),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'It is made of ${users[index].hobbies!.map((e) => e)}',
                          style: TextStyle(color: Colors.white.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
          );
       } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
       }
      } ,
    );
  }
 
}
