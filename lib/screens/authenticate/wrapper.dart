import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_with_cards/screens/authenticate/authenticate.dart';
import 'package:project_with_cards/screens/homepage/home_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: const Text ('Project with cards')
          ),
        ],
       
      ),
      // body: Authenticate(key: key),
      body: HomePAge(key: key),
    );
  }
}