// ignore_for_file: unused_local_variable, prefer_for_elements_to_map_fromiterable

import 'package:flutter/material.dart';

// ignore: must_be_immutable

List<Map<String, String>> listProducts = [
    {'image': 'https://davinci.am/image/cache/catalog/Teaa/er-300x300.png', 'name': 'for_dreams', 'price': '23', 'icon' : '${Icons.shopping_bag_outlined}'},
    {'image': 'https://davinci.am/image/cache/catalog/coffee/90067207-6007-4FE0-8337-104C300B8616-300x300.jpg', 'name': 'coffe', 'price': '250Դ', 'icon' : '${Icons.shopping_bag_outlined}'},
    {'image': 'https://davinci.am/image/cache/catalog/Teaa/96514287-1700-4AFD-9C13-8C5E6D8CDF3A-300x300.jpg', 'name': 'let me hug', 'price': '280Դ', 'icon' : '${Icons.shopping_bag_outlined}'},
    {'image': 'https://davinci.am/image/cache/catalog/tea%20new/218C8B76-2494-42AC-90E9-7A120E1C7D91-228x228.jpg', 'name': 'always togethor', 'price': '240Դ', 'icon' : '${Icons.shopping_bag_outlined}'},
    {'image': 'https://davinci.am/image/cache/catalog/tea%20new/5EE6C093-0F98-43CC-83C4-CDDC89A1FAB1-228x228.jpg', 'name': 'deer', 'price': '230Դ', 'icon' : '${Icons.shopping_bag_outlined}'},
    {'image': 'https://davinci.am/image/cache/catalog/Teaa/333-228x228.png', 'name': 'for daddy', 'price': '260Դ', 'icon' : '${Icons.shopping_bag_outlined}'},
    {'image': 'https://davinci.am/image/cache/catalog/tea%20new/F67E7D38-5069-4D28-BB0B-A48C5F6F29FE-228x228.jpg', 'name': 'for mammy', 'price': '230Դ', 'icon' : '${Icons.shopping_bag_outlined}'}, 
  ];
class CardWidget extends StatelessWidget {

   // ignore: prefer_const_constructors_in_immutables
   CardWidget({Key? key,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
      print('BuyArmenian');
    
    for (var i = 0; i < listProducts.length; i++) {
      // ignore: avoid_print
      // print(listProducts[i]['image']);
    }
    return listWiewidget();
  }

  
}

// ignore: non_constant_identifier_names
Widget flexaible_c() {
  
  var result = listProducts.map((e) => e.values);
  // ignore: avoid_print
  print(result);
  for (var i = 0; i < result.length; i++) {
      // ignore: avoid_print
      // print(listProducts[i]['image']);
       return Row( 
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Card(     
                color: Colors.red,  
                elevation: 10,  
                  shape: RoundedRectangleBorder(  
                  borderRadius: BorderRadius.circular(15.0),
                ) ,
                // ignore: prefer_const_constructors
                child: SizedBox(
                  height: 200,
                  // ignore: prefer_const_constructors
                  child: i % 2 == 0 ? Text("${listProducts[i]['image']}") : Text("listProducts")
                  // i%2 == 0 ? Text(listProducts[i]['Username'])
                ), 
              ),
            ),
            Expanded(
              flex: 1,
              child: Card(     
                color: Colors.green,  
                elevation: 10,  
                  shape: RoundedRectangleBorder(  
                  borderRadius: BorderRadius.circular(15.0),
                ) ,
                child: const SizedBox(
                  // width: 100,
                  height: 200,
                  child: Center(child: Text('Filled Card')),

                  // i%2 == 0 ? Text(listProducts[i]['Username']) : new Container()
                ), 
              ),
            ),
          ],
        );
    }
 // ignore: prefer_const_constructors
 return Text('data');
}


Widget listWiewidget() {
  
    return ListView.builder(
          itemCount: listProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return flexaible_c();
          }
    );
  }