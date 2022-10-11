import 'package:exam_at/pages/auth/login/login.dart';
import 'package:exam_at/pages/homepage/homepage.dart';
import 'package:exam_at/pages/homepage/quiz/questions.dart';
import 'package:exam_at/pages/homepage/quiz/quiz.dart';
import 'package:exam_at/styles/style_of_appbar.dart';
import 'package:flutter/material.dart';

import 'base/routes.dart';

void main() {
  runApp( MyApp());
  print(AppRoutes.homepage.runtimeType);
}

class MyApp extends StatelessWidget {
  AppBarStyle appBarStyle = AppBarStyle();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: appBarStyle.white,
        iconTheme: const IconThemeData(color:  Color.fromRGBO(204,0,1, 0.8),),
      ),
      home: HomePage(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
