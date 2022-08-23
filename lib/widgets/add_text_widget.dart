import 'package:flutter/material.dart';

class AddTextWidget extends StatelessWidget {
  String text;
  Color color;
  double fontSize;
  FontWeight fontWeight;

  AddTextWidget({Key? key,
     required this.text,
     this.color = Colors.black,
     this.fontSize = 15,
     this.fontWeight = FontWeight.normal

   }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
        text,
      style: TextStyle(
          color: color,
        fontSize: fontSize,
        fontWeight: fontWeight
      ),
    );
  }
}