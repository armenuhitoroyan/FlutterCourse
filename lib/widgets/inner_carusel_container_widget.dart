import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [ 
            const Text('Ararat Bank',
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Colors.white54,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              ),
            ),
            const Text('VISA',
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
                           
        setText(
          '2 3 4 8 x x x x x x x x 6 9 2 0',
           const TextStyle(), 
           Colors.white38,
           20
        ),
        setText(
          'Թարմացվել է 01․01․2022',
           const TextStyle(), 
           Colors.white38,
           12
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [ 
            Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ignore: prefer_const_constructors
              Icon(
                Icons.remove_red_eye_rounded,
                color: Colors.white38,
              ),
              setText(
                'Username',
                const TextStyle(), 
                Colors.white38,
                20
              ),
            ]
          ), 
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              setText(
                '06.27',
                const TextStyle(), 
                Colors.white38,
                16
              ),
            ]
          ),
          ]
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