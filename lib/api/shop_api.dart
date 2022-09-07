import 'package:dio/dio.dart';
import 'package:shop/api/settings/settings_api.dart';
class ShopAPI {
  static ShopAPI? _singleton;

  late SettingsApi settings;
  
  Dio appDioClient = Dio();

  factory ShopAPI() {
    _singleton ??= ShopAPI._internal();
    return _singleton!;
  }

  ShopAPI._internal() {
    // Init subclasses

    settings = SettingsApi(appDioClient);
  }
}
