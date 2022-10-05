

import 'package:dio/dio.dart';
import 'package:exam_at/models/purchases.dart';



class PurchasesApi {
  final Dio appDioClient;

  PurchasesApi(
    this.appDioClient,
  );

  Future<PurchasesModel> getPurchasesData() async {
    PurchasesModel purchasesData;

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/purchases',
    );

    var res = result.data as Map<String, dynamic>;
    purchasesData = PurchasesModel.fromJson(res);

    return purchasesData;
  }

  
}
