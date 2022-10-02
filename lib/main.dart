import 'package:flutter/material.dart';
import 'package:team_project/base/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Map<int, Color> cyanMap = {100: Colors.cyan};

  MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50:   Color(0xFFFFFFFF),
    100:  Color(0xFFFFFFFF),
    200:  Color(0xFFFFFFFF),
    300:  Color(0xFFFFFFFF),
    400:  Color(0xFFFFFFFF),
    500:  Color(0xFFFFFFFF),
    600:  Color(0xFFFFFFFF),
    700:  Color(0xFFFFFFFF),
    800:  Color(0xFFFFFFFF),
    900:  Color(0xFFFFFFFF),
  },
);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: white,
      ),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}

