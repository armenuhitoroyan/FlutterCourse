
// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:whatsapp/examples/_app_bar.dart';
import 'package:whatsapp/widgets/user_screen%20.dart';
// import 'package:flutter/widgets.dart';
import 'package:whatsapp/widgets/user.dart';

class UsersScreen extends StatelessWidget  {
   UsersScreen({super.key, required this.users});
   List<User> users;

  @override
  Widget build(BuildContext context) {
   
    return DefaultTabController(
    length: 4,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'), 
        backgroundColor: Colors.teal.shade900,   
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          // ignore: prefer_const_constructors
          Icon(Icons.search),
          // ignore: prefer_const_constructors
          Icon(Icons.more_vert),
        ], 

      bottom: const TabBar(    
        tabs: [
          Tab(icon: Icon(Icons.camera_alt_rounded)),
          Tab(text: 'CHATS'),
          Tab(text: 'STATUS'),
                Tab(text: 'CALLS'),
        ],
      ),
        
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: ((context, index) {

          return ListTile(
            title: Text(users[index].name),
            subtitle: Text(users[index].status),
            // ignore: prefer_const_constructors
            leading: CircleAvatar(
              // ignore: prefer_const_constructors
              backgroundImage: NetworkImage(
               users[index].urlImg
              ), 
            ),
            trailing: Text(users[index].date),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => UserScreen(user: users[index])
                )
              );
            },
          );
        }),
      ),
         floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.message),
      ),
    ),
    );
  }
}