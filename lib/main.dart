import 'package:exam_at/pages/auth/login/login.dart';
import 'package:exam_at/pages/homepage/bloc/leaderboard_bloc.dart';
import 'package:exam_at/pages/homepage/homepage.dart';
import 'package:exam_at/pages/homepage/leaderboard/leader_board.dart';
import 'package:exam_at/pages/homepage/leaderboard/leaderboard.dart';
import 'package:exam_at/styles/style_of_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/project_api.dart';
import 'base/routes.dart';

void main() {
  runApp(MyApp());
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
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(204, 0, 1, 0.8),
        ),
      ),
      home: LoginPage(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
