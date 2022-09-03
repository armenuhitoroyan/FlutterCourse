import 'package:bmi_calculator/pages/user_page.dart';
import 'package:bmi_calculator/widgets/homepage_widget.dart';
import 'package:flutter/material.dart';

import '../pages/product_page.dart';

class AppRoutes {
  static const home = '/';
  static const users = '/users';
  static const products = '/products';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    PageArguments? pageArguments;
    if (settings.arguments != null) {
      pageArguments = (settings.arguments as PageArguments);
    }

    var routes = <String, WidgetBuilder>{
      AppRoutes.home: (context) =>  const HomeBodyW(),
      AppRoutes.users: (context) => const UsersPage(),
      AppRoutes.products: (context) => const ProductsPage(),
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
