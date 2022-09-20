import 'package:flutter/material.dart';
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
        title: const Text('QUESTIONS'),
      ),
      body: productsData == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _buildContent()
              
    );
  }

  Widget _buildContent() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector (
          onTap: () { 
            Navigator.push(context, MaterialPageRoute(builder: (context) => productPage(productsData![index]),));    
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [  
                  Image.network('${productsData?[index].imgUrl}'),
                  Text('${productsData?[index].productName}'),
                  Text('${productsData?[index].price}')
                ],
              ),
            ),
          ),
        );
      
      },
      itemCount: productsData?.length,
    );
  }

  Widget productPage(ProductModel product) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
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
