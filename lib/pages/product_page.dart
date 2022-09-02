import 'dart:convert';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

String productsJson =
    r'[{"product_name":"","price":100,"type":"shoes","is_available":true,"materials":["cotton","jeans"]},{"product_name":"","price":100,"type":"shoes","is_available":true,"materials":["cotton","jeans"]},{"product_name":"","price":100,"type":"shoes","is_available":true,"materials":["cotton","jeans"]},{"product_name":"","price":100,"type":"shoes","is_available":true,"materials":["cotton","jeans"]}]';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<ProductModel> products = [];

  @override
  void initState() {
    var data = jsonDecode(productsJson);

    if (data is List) {
      products = data
          .map<ProductModel>(
            (p) => ProductModel.fromJson(p),
          )
          .toList();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return productW();
  }


    Widget productW() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBG,
        centerTitle: true,
        title: const Text('Products', style: kBodyTextStyle),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          // return Text(uss[index].gender);
          return Card(
            clipBehavior: Clip.antiAlias,
            // ignore: sort_child_properties_last
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.production_quantity_limits_rounded),
                  title: Text('${products[index].productName}: ${products[index].price}'),
                  subtitle: Text(
                    // ignore: unnecessary_string_interpolations
                    '${products[index].type}',
                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  ),
                ),  
                 Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'It is made of ${products[index].materials.map((e) => e)}',
                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  ),
                ),
              
                // Image.asset('assets/armath_robot.png'),
                // Image(image: NetworkImage(products[index].image), height: 100)
              ],
            ),
            color: kBG,
          );
        },
      ),
    );
  }
}
