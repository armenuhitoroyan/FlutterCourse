import 'package:bmi_calculator/pages/second_page.dart';
import 'package:bmi_calculator/widgets/body_widget.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/';
  static const second = '/second';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    PageArguments? pageArguments;
    if (settings.arguments != null) {
      pageArguments = (settings.arguments as PageArguments);
    }

    var routes = <String, WidgetBuilder>{
      AppRoutes.home: (context) =>  HomeBodyW(),
      AppRoutes.second: (context) => const SecondPage(),
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
