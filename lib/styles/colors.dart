import 'dart:math';
import 'package:flutter/material.dart';

class ColorS {
 
 static List<Color> colors(){

  final Random _random = Random();
   late List<Color> color;
  
  List<List<Color>> gradientColors = [];
    List<Color> gradient1 = const [
      Color.fromARGB(255, 252, 61, 4),
      Color.fromARGB(255, 240, 240, 5)
    ];
     List<Color> gradient2 = const [
      Color.fromARGB(255, 235, 70, 19),
      Color.fromARGB(255, 241, 147, 4)
    ];
    List<Color> gradient3 = const [
      Color.fromRGBO(124, 77, 255, 1),
      Color.fromRGBO(224, 64, 251, 1),
    ];
    List<Color> gradient4 = const [
      Color.fromRGBO(103, 58, 183, 1),
      Color.fromRGBO(83, 109, 254, 1)
    ];

    gradientColors.addAll({
      gradient1,
      gradient2,
      gradient3,
      gradient4,
    });

    color = gradientColors[
      _random.nextInt(gradientColors.length)
    ];

  return color;
    
  }
  
  
}