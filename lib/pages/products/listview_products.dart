
import 'package:flutter/material.dart';
import 'package:indigo/pages/products/product_page.dart';
import 'package:provider/provider.dart';

import '../../base/controllers/products_data_provider.dart';
import '../../widgets/products_widgets/like_widget.dart';
import '../../widgets/products_widgets/ratingbar-widget.dart';

Widget listView() {
    return ChangeNotifierProvider(
      create: (context) => ProductsDataProvider(),
      child: Consumer<ProductsDataProvider>(
        builder: (context, value, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector (
              onTap: () { 
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => 
                      ProductPage(productModel: value.items[index]),
                  )
                );    
              },
              child: 
                  Stack(   
                    children: <Widget>[   
                    Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Image.network(
                              '${value.items[index].imgUrl}',
                              height: 150,
                            )
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [  
                                  Text(
                                    '${value.items[index].productName}',
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    '${value.items[index].materials?.map((e) => e)}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey
                                    ),
                                  ),
                                  Raitingbar(5, Colors.amber, Icons.star),
                                  Text(
                                    '${value.items[index].price}\$',
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )],
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.only(top: 120),
                    // ignore: prefer_const_constructors
                    child: Align(
                      alignment: Alignment.topRight,
                      child: const LikeWidget()
                    ),
                  )]),        
            );   
          },
          itemCount: value.items.length,
        ); }
      ),
    );
  }