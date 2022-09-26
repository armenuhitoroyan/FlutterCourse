import 'package:flutter/material.dart';
import 'package:indigo/models/product_model.dart';

import '../../api/indigo_api.dart';



class ProductsDataProvider extends ChangeNotifier {
  List<ProductModel> items = [];

  ProductsDataProvider(){
    getData();
  }

  getData() async {
      
      final result = await IndigoAPI().products.getProductsData();
      items = result;
      
      notifyListeners(); 
      
  }

}
