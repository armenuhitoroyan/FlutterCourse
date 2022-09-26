import 'package:indigo/base/controllers/products_data_provider.dart';
import 'package:indigo/pages/auth/login/login_page.dart';
import 'package:indigo/pages/feedback/feedback_page.dart';
import 'package:indigo/pages/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/products/product_page.dart';
import '../pages/products/products_page.dart';
import 'controllers/feedback_provider.dart';

class AppRoutes {
  static const login = '/';
  static const homepage = '/homepage';
  static const feedback = '/feedback';
  static const products = '/products';
  static const product = '/product';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    PageArguments? pageArguments;
    if (settings.arguments != null) {
      pageArguments = (settings.arguments as PageArguments);
    }

    var routes = <String, WidgetBuilder>{
      AppRoutes.login: (context) => const LoginPage(),
      // AppRoutes.homepage: (context) => const HomePageWidget(),
      AppRoutes.homepage: (context) => ChangeNotifierProvider(
            create: (context) => ProductsDataProvider(),
            child: const HomePageWidget(),
      ),
      AppRoutes.products: (context) => ChangeNotifierProvider(
            create: (context) => ProductsDataProvider(),
            child: ProductsPage(),
      ),

      AppRoutes.feedback: (context) => ChangeNotifierProvider(
            create: (context) => FeedBackProvider(),
            child: FeedBack(),
      ),

      // AppRoutes.feedback: (context) =>  FeedBack(),
      // AppRoutes.products: (context) => ProductsPage(),
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
