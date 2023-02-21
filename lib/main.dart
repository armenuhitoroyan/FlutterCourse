import 'package:appemails/base/routes.dart';
import 'package:appemails/homepage/homepage.dart';
import 'package:appemails/otp.dart';
import 'package:appemails/shared_preferences/shared_preferences.dart';
import 'package:appemails/text_editor/text_editor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: HtmlEditorExample(title: 'HtmlEditorExample',),
      // HomePage(title: 'Range Slider',),
      // const SharedPreferencesDemo(),
      // home: const OTP(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}