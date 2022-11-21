import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ranger/pages/devices/devices.dart';
import 'package:ranger/pages/homepage.dart';
import 'package:ranger/pages/q_info/q_info.dart';
import 'package:ranger/pages/qr_scanner/brc_scanner.dart';

import '../pages/devices/bloc/device_bloc.dart';
import '../pages/devices/device.dart';
import '../pages/q_info/bloc/q_info_bloc.dart';

class AppRoutes {
  static const homepage = '/';
  static const info = '/info';
  static const mobScan = '/scan';
  static const devices = '/devices';
  static const brScan = '/scanner';
  static const device = '/device';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    if (settings.arguments != null) {}

    var routes = <String, WidgetBuilder>{
      AppRoutes.homepage: (context) => const HomePage(
            title: '',
          ),
      AppRoutes.info: (context) => BlocProvider(
            create: (context) => QrInfoBloc(),
            child: Information(),
          ),
      AppRoutes.mobScan: (context) => MobScan(),
      AppRoutes.devices: (context) => Devices(),
      
      AppRoutes.device: (context) => BlocProvider(
            create: (context) => DeviceBloc(),
            child: Device(),
          ),
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
