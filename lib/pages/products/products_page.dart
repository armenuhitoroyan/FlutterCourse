import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:indigo/api/indigo_api.dart';

import 'package:indigo/models/product_model.dart';

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
    return Scaffold(
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
              child: !isClickedIcon ? Icon(Icons.list) : Icon(Icons.list_alt_sharp)
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
              
    );
  }

  Widget listView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector (
          onTap: () { 
            Navigator.push(context, MaterialPageRoute(builder: (context) => productPage(productsData![index]),));    
          },
          child: Card(
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
                            '${productsData?[index].materials?.first}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.grey
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                            // ignore: prefer_const_constructors
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                            itemSize: 15,
                          ),
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
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [  
                    Expanded(child: Image.network('${productsData?[index].imgUrl}')),
                    Text('${productsData?[index].productName}'),
                    Text('${productsData?[index].price}')
                  ],
                ),
            ),
          ),
        );
      }
    ),
  );
  }

  Widget productPage(ProductModel product) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Container(
            child: Column(
              children: [
                Image.network('${product.imgUrl}'),
                Text('${product.description}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
