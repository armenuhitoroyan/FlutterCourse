
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(user.status),
              ],
            ),
            Row(
              children: [
                Image(image: NetworkImage(user.urlImg), height: 100)
              ],
            ),
          ],
        ),
      ),
    );
  }
  
}