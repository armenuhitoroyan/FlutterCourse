import 'package:exam_at/pages/homepage/homepage.dart';
import 'package:exam_at/pages/homepage/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/auth/login/login.dart';

class AppRoutes {
  static const login = '/';
  static const homepage = '/homepage';
  static const pages = '/pages';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    PageArguments? pageArguments;
    if (settings.arguments != null) {
      pageArguments = (settings.arguments as PageArguments);
    }

    var routes = <String, WidgetBuilder>{
      AppRoutes.login: (context) => LoginPage(),
      AppRoutes.pages: (context) => Pages(),
      AppRoutes.homepage: (context) => HomePage(),
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
