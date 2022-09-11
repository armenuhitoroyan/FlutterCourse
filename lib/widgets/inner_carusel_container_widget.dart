import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InnerCaruselContainerWidget extends StatelessWidget {
  const InnerCaruselContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InnerCarusel ();
  }

  Widget InnerCarusel () {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: prefer_const_constructors
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            
            const Text('Credit Card',
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Colors.white54,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              ),
            ),
          ],
        ),
        // ignore: prefer_const_constructors
        Image(image: AssetImage('assets/images/earth.png'),
          height: 55,
        ),
                           
        setText(
          '2 3 4 8 x x x x x x x x 6 9 2 0',
           const TextStyle(), 
           Colors.white38,
           20
        ),
        setText(
          'Name  Username',
           const TextStyle(), 
           Colors.black26,
           20
        )
      ],
    );
  }


  Widget setText(String text, TextStyle textStyle, Color color, double fontSize, ) {
    return Text(
      text,
      style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          )
    );
  }
}