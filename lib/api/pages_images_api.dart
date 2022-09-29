import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/img_model.dart';

class PagesImgApi {
  final Dio appDioClient;
  final String _HEADER_AUTH = 'Authorization';
  final String YOUR_KEY = 'Bearer 563492ad6f917000010000017806ce8e64d041ef93deaf9be7e08a4b';

  PagesImgApi(
    this.appDioClient,
  );

  Future<ImgModel> getNewYearData() async {
    ImgModel newYearData;

    final result = await appDioClient.get(
      'https://api.pexels.com//v1/search?query=newyear',
      options: Options(headers: {_HEADER_AUTH: YOUR_KEY})
    );


  print(result.data);

    var res = result.data as Map<String, dynamic>;
    newYearData = ImgModel.fromJson(res);

    return newYearData;
  }

  // Future<List<Photo>> getPhotosData() async {
  //   List<Photo> images = [];

  //   final result = await appDioClient.get(
  //     'https://api.pexels.com//v1/search?query=newyear',
  //   );

  //   var res = result.data as Map<String, dynamic>;

  //   images = res['photos']
  //       .map<Photo>(
  //         (e) => Photo.fromJson(e),
  //       )
  //       .toList();
  //   return images;
  // }

  // Future<Map<String, Src>> getSrcData() async {
  //   Map<String, Src> src = {};

  //   final result = await appDioClient.get(
  //     'https://api.pexels.com//v1/search?query=newyear',
  //   );

  //   var res = result.data as Map<String, dynamic>;

  //   src = res['src']
  //       .map<Src>(
  //         (e) => Src.fromJson(e),
  //       );
  //   return src;
  // }
}
