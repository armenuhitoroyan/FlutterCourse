import 'package:exam_at/pages/auth/login/login.dart';
import 'package:flutter/material.dart';

import 'base/routes.dart';

void main() {
  runApp(const MyApp());
  print(AppRoutes.homepage.runtimeType);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
