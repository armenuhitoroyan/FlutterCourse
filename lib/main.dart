import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_with_cards/screens/authenticate/wrapper.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project with cards',
      theme: ThemeData(
        primarySwatch: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
      home: Wrapper(),
    );
  }
}

