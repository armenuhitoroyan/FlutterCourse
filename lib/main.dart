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
      'image': 'https://openclipart.org/image/800px/251611', 
      'name': 'Daddy',
      'status': 'I am using WhatsApp',
      'date': '2011'
    }, {
      'image': 'https://openclipart.org/image/800px/196108', 
      'name': 'sister',
      'status': 'I am using WhatsApp',
      'date': '2015'
    }, {
      'image': 'https://openclipart.org/image/800px/279929', 
      'name': 'brother',
      'status': 'I am using WhatsApp',
      'date': '2017'
    }, 
    {
      'image': 'https://openclipart.org/image/800px/162481', 
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
      'image': 'https://openclipart.org/image/800px/4749', 
      'name': 'uncle',
      'status': 'I am using WhatsApp',
      'date': '2013'
    },
    {
      'image': 'https://openclipart.org/image/800px/162481', 
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
      'image': 'https://openclipart.org/image/800px/4749', 
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
            result.elementAt(i).elementAt(0),
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




