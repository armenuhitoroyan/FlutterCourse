import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_project/widgets/comments.dart';

import '../pages/homepage/home_page.dart';
import '../pages/homepage/homepage_provider.dart';

class AppRoutes {
  static const homepage = '/';
  static const profile = '/profile';
  static const comments = '/comments';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    PageArguments? pageArguments;
    if (settings.arguments != null) {
      pageArguments = (settings.arguments as PageArguments);
    }

    var routes = <String, WidgetBuilder>{
      // AppRoutes.homepage: (context) => HomePage(),
      AppRoutes.homepage: (context) => ChangeNotifierProvider(
            create: (context) => HomepageProvider(),
            child: HomePage(),
          ),
      
      AppRoutes.comments: (context) => CommentsWidget(),
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
