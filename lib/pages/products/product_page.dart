import 'package:flutter/material.dart';
import 'package:indigo/widgets/like_widget.dart';

import '../../models/product_model.dart';
import '../../widgets/ratingbar-widget.dart';


class ProductPage extends StatefulWidget {
  final ProductModel productModel;
  // ignore: prefer_const_constructors_in_immutables
  ProductPage({super.key, required this.productModel});

  @override
  State<ProductPage> createState() => _ProductPageState(product: productModel);
}

class _ProductPageState extends State<ProductPage> {
  ProductModel product;
  _ProductPageState({required this.product});
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
          child: Center(
            // ignore: avoid_unnecessary_containers
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                   Container(     
                    color: Colors.white,
                    child: Column(
                      children: [
                          Center(
                            child: Expanded(
                              child: Image.network(
                              '${product.imgUrl}',
                              ),
                            ),
                          ),
                        Raitingbar(4, Colors.indigo, Icons.circle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            LikeWidget()
                          ],
                        )
                      ],
                    ),
                   )
                  ],
                ),
                Column(
                  children:  [
                   Row( 
                    children: [ 
                      Text(
                        '${product.productName}',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ), 
                      ]
                    ),
                    Text('${product.description}'),
                  ],
                ),
                const Spacer(),
                Column(  
                  children: [
                    Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: const [Text('Total')]),
                            Row(children: const [Text('Amount')]),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(  
                            '\$${product.price}.0',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                        Expanded(
                          child: ElevatedButton(
                            child: const Text('REMOVE CART'),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo,
                            ),
                                              ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}