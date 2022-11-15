import 'package:flutter/material.dart';
import 'package:ranger/config/app_style.dart';
import 'package:ranger/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AppStyle appStyle = AppStyle();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: appStyle.white,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

