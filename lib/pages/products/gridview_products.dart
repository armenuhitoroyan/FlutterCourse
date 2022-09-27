
import 'package:flutter/material.dart';
import 'package:indigo/pages/products/product_page.dart';
import 'package:provider/provider.dart';

import '../../base/controllers/products_data_provider.dart';

class GridViewProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return gridview(context);
  }

  Widget gridview(BuildContext context) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: ChangeNotifierProvider(
      create: (context) => ProductsDataProvider(),
      child: Consumer<ProductsDataProvider>(
        builder: (context, value, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: value.items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => 
                      ProductPage(productModel: value.items[index],),
                  )
                ); 
              },
              child: Card(
                color: Colors.white,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [  
                        Expanded(child: Image.network(
                          '${value.items[index].imgUrl}',
                          // height: 200,
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [ Text(
                              '${value.items[index].productName}',
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),
                            ), ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 30),
                          child: Row(
                            children: [
                              Text(
                                '\$${value.items[index].price}.00',
                                style: const TextStyle(
                                  fontSize: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                ),
            );
          }
        ); }
      ),
    ),
  );
  }
}

