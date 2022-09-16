import 'package:indigo/base/routes.dart';
import 'package:flutter/material.dart';
// import 'dart:io';

void main() {
  // stdout.write('*');
  // stdout.write('*');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
