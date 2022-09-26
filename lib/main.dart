import 'package:indigo/base/controllers/products_data_provider.dart';
import 'package:indigo/base/routes.dart';
import 'package:flutter/material.dart';
import 'package:indigo/pages/homepage/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => ProductsData()),
        Provider(create: (context) => MyApp()),
      ],
      child: const MyApp(),
    ),
  );
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
