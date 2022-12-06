import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ranger/base/routes.dart';
import 'package:ranger/config/app_style.dart';
import 'package:ranger/pages/automations/searching/search_words.dart';
import 'package:ranger/pages/devices/bloc/device_bloc.dart';


import 'package:ranger/pages/devices/device.dart';
import 'package:ranger/pages/devices/devices.dart';
import 'package:ranger/pages/homepage.dart';
import 'package:ranger/widgets/bottom_nav_bar/bottom_navbar.dart';

import 'pages/homepage/homepage.dart';

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
      home: BottomNavbar(),
      // DevicesState(),
      // BlocProvider(
      //   create: (context) => DeviceBloc(),
      //   child: Device(),
      // ),
      // SearchWords(),

      // HomePageState(title: 'Flutter Demo Home Page',),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}