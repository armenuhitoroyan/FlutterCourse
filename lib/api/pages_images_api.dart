import 'package:dio/dio.dart';
import '../models/img_model.dart';

class PagesImgApi {
  final Dio appDioClient;
  final String _HEADER_AUTH = 'Authorization';
  final String _YOUR_KEY = 'Bearer 563492ad6f917000010000017806ce8e64d041ef93deaf9be7e08a4b';

  PagesImgApi(
    this.appDioClient,
  );

  Future<ImgModel> getNewYearData() async {
    ImgModel newYearData;

    final result = await appDioClient.get(
      'https://api.pexels.com//v1/search?query=newyear',
      options: Options(headers: {_HEADER_AUTH: _YOUR_KEY})
    );

    var res = result.data as Map<String, dynamic>;
    newYearData = ImgModel.fromJson(res);

    return newYearData;
  }

}
