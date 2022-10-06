import 'package:exam_at/models/purchases.dart';
import 'package:flutter/material.dart';

import '../../../api/project_api.dart';

class PurchasesProvider extends ChangeNotifier {
  PurchasesModel? purchasesModel;
  List<PurchasesModel>? purchases;
  bool isLoading = false;

  PurchasesProvider() {
    getData();
  }

  void getData({bool initial = true}) async {
    isLoading = true;
    if (!initial) notifyListeners();

    final result = await ProjectAPI().purchasesApi.getPurchasesData();

    print(result.last.price);
    print(result.runtimeType);
    // purchases = result;

    if (result.isEmpty) {
    } else {
      isLoading = false;
      purchases = result;

      notifyListeners();
    }

    notifyListeners();
  }
}
