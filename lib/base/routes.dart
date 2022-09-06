import 'dart:js';

import 'package:shop/pages/registration/login_page.dart';
import 'package:shop/pages/user_page.dart';
import 'package:shop/widgets/homepage_widget.dart';
import 'package:shop/pages/registration/registration_page.dart';
import 'package:flutter/material.dart';

import '../pages/product_page.dart';

class AppRoutes {
  static const home = '/';
  static const users = '/users';
  static const products = '/products';
  static const registration = '/registration';
  static const login = '/login';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    PageArguments? pageArguments;
    if (settings.arguments != null) {
      pageArguments = (settings.arguments as PageArguments);
    }

    var routes = <String, WidgetBuilder>{
      AppRoutes.home: (context) =>  const HomePageWidget(),
      AppRoutes.users: (context) => const UsersPage(),
      AppRoutes.products: (context) => const ProductsPage(),
      AppRoutes.registration: (context) => const RegistrationPage(),
      AppRoutes.login: (context) => const LoginPage()
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
