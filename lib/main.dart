import 'package:flutter/material.dart';

import 'homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(color:  Color.fromRGBO(204,0,1, 0.8),),
      ),
      home: HomePage(formArray: formsState.form,),
    );
  }
}
