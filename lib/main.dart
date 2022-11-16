import 'package:flutter/material.dart';
import 'package:ranger/base/routes.dart';
import 'package:ranger/config/app_style.dart';
import 'package:ranger/pages/homepage.dart';
import 'package:ranger/pages/info/info.dart';
import 'package:ranger/pages/qr_scanner/brc_scaner.dart';

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
        backgroundColor: appStyle.white
      ),
      home: 
      // Information(),
      // BrCScaner(),
      const HomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}

