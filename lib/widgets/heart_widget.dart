import 'package:flutter/material.dart';

class HeartWidget extends StatefulWidget{
  const HeartWidget({super.key});

  @override
  State<HeartWidget> createState() => _HeartWidgetState();
}

class _HeartWidgetState extends State<HeartWidget> {
  bool isChangedColor = false;
  @override
  Widget build(BuildContext context) {
   return heartWidget();
  }

  Widget heartWidget() {
    return 
    Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        margin: const EdgeInsets.only(top: 120.0),
        child: FloatingActionButton(
          // fit: BoxFit.cover,
          backgroundColor: Colors.white,
          foregroundColor: !isChangedColor ? Colors.black : Colors.indigo,
          onPressed: () {
            setState(() {
              isChangedColor = !isChangedColor;
            });
      
            // if (!isChangedColor) {
              
            // }
          },
          child: Icon(Icons.thumb_up),
        ),
      ),
    );
  }
}