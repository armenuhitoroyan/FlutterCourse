import 'dart:math';
import 'package:flutter/material.dart';

class ColorS {
 
 static List<Color> colors(){

  final Random _random = Random();
   late List<Color> color;
  
  List<List<Color>> gradientColors = [];
    List<Color> gradient1 = [
      Colors.pinkAccent,
      Colors.yellowAccent
    ];
     List<Color> gradient2 = [
      Colors.deepOrange,
      Colors.orange
    ];
    List<Color> gradient3 = [
      Colors.deepPurpleAccent,
      Colors.purpleAccent,
    ];
    List<Color> gradient4 = [
      Colors.deepPurple,
      Colors.indigoAccent
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