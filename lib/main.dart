import 'package:flutter/material.dart';
import 'package:ranger/base/routes.dart';
import 'package:ranger/config/app_style.dart';
import 'package:ranger/pages/homepage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData( 
        primarySwatch: Colors.blue,
      ),
      home: 
      // Information(),
      // BrCScaner(),
      // ScannerState(),
      const HomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}

