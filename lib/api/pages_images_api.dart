import 'package:dio/dio.dart';
import 'package:team_project/api/token/token_interceptor.dart';
import '../models/img_model.dart';

class PagesImgApi extends TokenInterceptor{
  final Dio appDioClient;

  PagesImgApi(
    this.appDioClient,
  );

  Future<ImgModel> getImagesData() async {
    ImgModel imgData;

    final result = await appDioClient.get(
        'https://api.pexels.com//v1/search?query=people',
        options: Options(headers: {super.getHeaderAuth: super.getKey}));

    var res = result.data as Map<String, dynamic>;
    imgData = ImgModel.fromJson(res);

    return imgData;
  }
}
