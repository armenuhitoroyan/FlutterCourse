import 'package:bmi_calculator/widgets/body_widget.dart';
import 'package:flutter/material.dart';
import 'base/routes.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Shop',
      theme: ThemeData.dark(),
       onGenerateRoute: AppRoutes.onGenerateRoute,
      home: const HomePage(title: 'ONLINE SHOP'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _incrementCounter() {
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: kBG,
      appBar: AppBar(
        backgroundColor: kBG,
        centerTitle: true,
        title: Text(widget.title, style: kBodyTextStyle),
      ),
      body: HomeBodyW() 
    );
    
  }
}
