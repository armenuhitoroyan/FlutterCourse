import 'package:flutter/material.dart';

import '../otp.dart';
import '../shared_preferences/shared_preferences.dart';

class AppRoutes {
  static const homepage = '/';
  static const otpState = '/verification';

 

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    if (settings.arguments != null) {}

    var routes = <String, WidgetBuilder>{
      AppRoutes.homepage: (context) => const SharedPreferencesDemo(), 
      AppRoutes.otpState: (context) => const OTP(), 
    };

    WidgetBuilder builder = routes[settings.name] ?? routes.values.first;
    return MaterialPageRoute(builder: (ctx) => builder(ctx));
  }
}

class PageArguments {
  final String? pageTitle;
  final Map<String, dynamic>? data;

  PageArguments({
    this.pageTitle,
    this.data,
  });
}