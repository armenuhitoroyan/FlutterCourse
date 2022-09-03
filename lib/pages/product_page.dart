import 'dart:convert';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/product_model.dart';


class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  @override
  Widget build(BuildContext context) {
    return productWidget();
  }

   Future<List<ProductModel>> readJsonData() async {
      final response = await rootBundle.loadString('json/products.json');
      final data = json.decode(response) as List<dynamic>;

      return data.map((e) => ProductModel.fromJson(e)).toList();
   }

  Widget productWidget() {
    return FutureBuilder(
      future: readJsonData(),
      builder: (context, data) {
       if (data.hasError) {
         return Center(child: Text('${data.error}'));
       } else if(data.hasData) {
       var products = data.data as List<ProductModel>;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kBG,
              centerTitle: true,
              title: const Text('Products', style: kBodyTextStyle),
            ),
            body: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  color: kBG,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.production_quantity_limits_rounded),
                        // ignore: unnecessary_string_interpolations
                        title: Text('${products[index].productName}'),
                        subtitle: Text(
                          '${products[index].price}',
                          style: TextStyle(color: Colors.white.withOpacity(0.6)),
                        ),  
                      ),
                      Image(image: NetworkImage(products[index].image.toString()), height: 100),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'It is made of ${products[index].materials.map((e) => e)}',
                          style: TextStyle(color: Colors.white.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
          );
       } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
       }
      } ,
    );
  }
 
}
