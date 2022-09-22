import 'package:flutter/material.dart';

class LikeWidget extends StatefulWidget{
  const LikeWidget({super.key});

  @override
  State<LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  bool isChangedColor = false;
  @override
  Widget build(BuildContext context) {
   return likeWidget();
  }

  Widget likeWidget() {
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
    
          },
          child: !isChangedColor ? Icon(Icons.thumb_up) : Icon(Icons.thumb_down),
        ),
      ),
    );
  }
}