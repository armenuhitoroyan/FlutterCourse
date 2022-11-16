import 'package:flutter/material.dart';
import 'package:ranger/pages/homepage.dart';
import 'package:ranger/pages/info/info.dart';
import 'package:ranger/pages/qr_scanner/brc_scanner.dart';
import 'package:ranger/pages/qr_scanner/qr_scanner.dart';

class AppRoutes {
  static const homepage = '/';
  static const info = '/info';
  static const qrScan = '/scaner';
  // static const brScan = '/scan';
  static const mobScan = '/scan';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    PageArguments? pageArguments;
    if (settings.arguments != null) {
      pageArguments = (settings.arguments as PageArguments);
    }

    var routes = <String, WidgetBuilder>{
      AppRoutes.homepage: (context) => const HomePage(
            title: '',
          ),
      AppRoutes.info: (context) => Information(),
      // AppRoutes.qrScan: (context) => QrScanner(),
      // AppRoutes.brScan: (context) => BrCScanner()
      AppRoutes.mobScan:(context) => MobScan()
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
