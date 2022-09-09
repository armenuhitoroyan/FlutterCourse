import 'package:dio/dio.dart';

import '../../models/setting_model.dart';

class SettingsApi {
  final Dio appDioClient;

  SettingsApi(
    this.appDioClient,
  );

  Future<List<SettingModel>> getSettingsData() async {
    List<SettingModel> settings = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/settings',
    );


    if (result.data is List) {
      settings = result.data
      
          .map<SettingModel>(
            (e) => SettingModel.fromJson(e),
          )
          .toList();     
    }

    return settings;
  }
}
