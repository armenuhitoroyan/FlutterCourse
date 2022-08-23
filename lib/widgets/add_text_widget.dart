import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTextWidget extends StatelessWidget {
  final String text;

    const AddTextWidget({Key? key,
     required this.text,

   }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
        text,
      style: const TextStyle(
        color: Colors.deepOrange,
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    );
  }
}