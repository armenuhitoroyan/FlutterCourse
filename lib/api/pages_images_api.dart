import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/img_model.dart';

class PagesImgApi {
  final Dio appDioClient;

  PagesImgApi(
    this.appDioClient,
  );

  Future<ImgModel> getNewYearData() async {
    ImgModel newYearData;

    final result = await appDioClient.get(
      'https://api.pexels.com//v1/search?query=newyear',
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
