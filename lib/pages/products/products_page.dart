import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../base/controllers/products_data_provider.dart';
import 'gridview_products.dart';
import 'listview_products.dart';

class ProductsPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsDataProvider(),
      child: Consumer<ProductsDataProvider>( 
        builder: (context, value, child) {
        return Scaffold(
            backgroundColor: Color.fromARGB(255, 37, 47, 116),
            appBar: AppBar(
              // ignore: prefer_const_literals_to_create_immutables
              actions: [
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  // ignore: prefer_const_constructors
                  child: 
                     GestureDetector(
                      onTap: () {
                       
                      },
                      child: !value.isClickedIcon ? Icon(Icons.list) : Icon(Icons.drag_indicator_outlined )
                  
                  )
                )
              ],
              title: const Text('SHRINE'),   
            ),
            body: value == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : !value.isClickedIcon
                    ? listView()
                    : gridview(context),        
          );
  }),
    );
  }
}