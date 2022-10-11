import 'package:flutter/material.dart';

class DiagonallyShapedCard extends StatelessWidget {
  int index;
  double width, height;
  DiagonallyShapedCard(
      {super.key,
      required this.index,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return diagonallyShaped(index, width, height);
  }

  Widget diagonallyShaped(int i, double width, double height) {
    return SizedBox(
      width: width,
      height: height,
      // ignore: prefer_const_constructors
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        color: const Color.fromRGBO(249,249,249, 0.8),
        // ignore: prefer_const_constructors
        child: Center(
          child: Text(
            '$i',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15
            ),
          ),
        ),
      ),
    );
  }
}
