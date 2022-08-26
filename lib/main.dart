import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/ex.dart';

import 'widgets/user.dart';
import 'widgets/users_screen.dart';
// import 'package:whatsapp/widgets/home_page_widget.dart';

void main() {
  // runApp(const ExPageWidget());
  List<Map<String, String>> listUsers = [
    {
      'image': 'https://openclipart.org/image/800px/295783', 
      'name': 'Mammy',
      'status': 'I am using WhatsApp',
      'date': '2013'
    }, {
      'image': 'https://www.pngitem.com/pimgs/m/2-23925_male-computer-user-computer-user-clipart-hd-png.png', 
      'name': 'Daddy',
      'status': 'I am using WhatsApp',
      'date': '2011'
    }, {
      'image': 'https://www.pngitem.com/pimgs/m/473-4733687_male-computer-user-user-computer-png-transparent-png.png', 
      'name': 'sister',
      'status': 'I am using WhatsApp',
      'date': '2015'
    }, {
      'image': 'https://www.nicepng.com/png/detail/67-675501_banner-library-male-computer-user-big-image-png.png', 
      'name': 'brother',
      'status': 'I am using WhatsApp',
      'date': '2017'
    }, 
    {
      'image': 'https://en.pimg.jp/047/592/288/1/47592288.jpg', 
      'name': 'Grandmother',
      'status': 'I am using WhatsApp',
      'date': '2020'
    }, 
    {
      'image': 'https://thumbs.dreamstime.com/z/image-male-office-worker-wearing-glasses-filling-documents-male-office-worker-filling-documents-119292875.jpg', 
      'name': 'Grandfather',
      'status': 'I am using WhatsApp',
      'date': '2020'
    }, 
    {
      'image': 'https://www.pinclipart.com/picdir/big/8-82614_male-user-big-image-computer-user-clipart.png', 
      'name': 'uncle',
      'status': 'I am using WhatsApp',
      'date': '2013'
    },
    {
      'image': 'https://en.pimg.jp/047/592/288/1/47592288.jpg', 
      'name': 'Grandmother',
      'status': 'I am using WhatsApp',
      'date': '2020'
    }, 
    {
      'image': 'https://thumbs.dreamstime.com/z/image-male-office-worker-wearing-glasses-filling-documents-male-office-worker-filling-documents-119292875.jpg', 
      'name': 'Grandfather',
      'status': 'I am using WhatsApp',
      'date': '2020'
    }, 
    {
      'image': 'https://www.pinclipart.com/picdir/big/8-82614_male-user-big-image-computer-user-clipart.png', 
      'name': 'uncle',
      'status': 'I am using WhatsApp',
      'date': '2013'
    }
  ];

var result = listUsers.map((e) => e.values);

  runApp(
    MaterialApp(  
      debugShowCheckedModeBanner: false,  
      theme: ThemeData(
        primarySwatch: Colors.teal,  
      ),
      title: 'Passing Data',
      home: UsersScreen(
        users: List.generate(
          result.length,
          (i) => User(
            result.elementAt(i).elementAt(1),
            'I am using WhatsApp',
            result.elementAt(i).last,
          ),
        ),
      ),
    )
  );
}

/*
  
result.any((element) => element),
 */




