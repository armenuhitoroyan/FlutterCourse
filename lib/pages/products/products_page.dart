import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:indigo/api/indigo_api.dart';

import 'package:indigo/models/product_model.dart';

import '../../widgets/like_widget.dart';
import '../../widgets/ratingbar-widget.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
  
  void updateBody(Widget viewPager) {}
}

class _ProductsPageState extends State<ProductsPage> {
  List<ProductModel>? productsData = [];
  bool isClickedIcon = false;
 
  @override
  void initState() {
    getData().then((data) {
      setState(() {
        productsData = data;
      });

    });


    super.initState();
  }

  Future<List<ProductModel>> getData() async {
    return await IndigoAPI().products.getProductsData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo.shade100,
        appBar: AppBar(
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(right: 15),
              // ignore: prefer_const_constructors
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isClickedIcon = !isClickedIcon;
                  });
                },
                child: !isClickedIcon ? Icon(Icons.list) : Icon(Icons.drag_indicator_outlined )
              )
            )
          ],
          title: const Text('SHRINE'),
          
        ),
        body: productsData == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : !isClickedIcon
                ? listView()
                : gridview(),
                
      ),
    );
  }

  Widget listView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector (
          onTap: () { 
            Navigator.push(context, MaterialPageRoute(builder: (context) => productPage(productsData![index]),));    
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
                          '${productsData?[index].imgUrl}',
                          height: 150,
                          // fit:BoxFit.fill 
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
                                '${productsData?[index].productName}',
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                '${productsData?[index].materials?.map((e) => e)}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey
                                ),
                              ),
                              Raitingbar(5, Colors.amber, Icons.star),
                              Text(
                                '${productsData?[index].price}\$',
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
              Align(
                alignment: Alignment.topRight,
                child: LikeWidget()
              )
              
              ]
              ),
            // ignore: prefer_const_constructors
            // HeartWidget()
           
        );
      
      },
      itemCount: productsData?.length,
    );
  }

  Widget gridview() {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: productsData!.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => productPage(productsData![index]),)); 
          },
          child: Card(
            color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [  
                    Expanded(child: Image.network(
                      '${productsData?[index].imgUrl}',
                      // height: 200,
                    ),),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
                        children: [ Text(
                          '${productsData?[index].productName}',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),
                        ), ]
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 30),
                      child: Row(
                        children: [
                          Text(
                            '\$${productsData?[index].price?.toDouble()}',
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
    ),
  );
  }

  Widget productPage(ProductModel product) {
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
                            child: Image.network(
                            '${product.imgUrl}',
                                                  ),
                          ),
                        Raitingbar(4, Colors.indigo, Icons.circle),
                        
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
                Spacer(),
                Column(
                 
                  children: [
                    Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [Text('Total')]),
                            Row(children: [Text('Amount')]),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Text(  
                            '\$${product.price}.0',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                        ElevatedButton(
                          child: const Text('REMOVE CART'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
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