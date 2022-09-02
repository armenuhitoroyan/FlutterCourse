import 'dart:convert';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

String productsJson =
    r'[{"product_name":"T-Shirt","price":100,"is_available":true, "image":"https://openclipart.org/image/800px/218167", "materials":["cotton"]},{"product_name":"Jacket","price":30,"is_available":true, "image":"https://openclipart.org/image/800px/311614", "materials":["jeans"]},{"product_name":"Pants","price":120,"is_available":false, "image":"https://openclipart.org/image/800px/27639", "materials":["cotton","jeans"]},{"product_name":"Top","price":10,"is_available":true, "image":"https://openclipart.org/image/800px/3647", "materials":["cotton"]}]';

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
                  // ignore: unnecessary_string_interpolations
                  title: Text('${products[index].productName}'),
                  subtitle: Text(
                    // ignore: unnecessary_string_interpolations
                    '${products[index].price}',
                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  ),
                ), 
                Image(image: NetworkImage(products[index].image), height: 100), 
                 Padding(
                  padding: const EdgeInsets.all(16.0),
                  // Image(image: NetworkImage(products[index].image)),
                  child: Text(
                    'It is made of ${products[index].materials.map((e) => e)}',
                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  ),
                ), 
              ],
            ),
            color: kBG,
          );
        },
      ),
    );
  }
}
