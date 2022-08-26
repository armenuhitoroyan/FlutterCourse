
import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/user.dart';

class UserScreen extends StatelessWidget {
 // ignore: prefer_const_constructors_in_immutables
 UserScreen({super.key, required this.user});

  final User user;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      // ignore: prefer_const_constructors
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(user.status),
            Image(image: AssetImage(user.urlImg)),
            Text(user.date)
          ],
        ),
      ),
    );
  }
  
}