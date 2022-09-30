import 'package:flutter/material.dart';

class ReactWidget extends StatefulWidget {
  @override
  State<ReactWidget> createState() => _ReactWidgetState();
}

class _ReactWidgetState extends State<ReactWidget> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return toReact();
  }

  Widget toReact() {
    return IconButton(
      onPressed: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      icon: isClicked
        ? Icon(
          Icons.favorite,
          color: Colors.blueGrey[200],
        )
        : const Icon(
            Icons.favorite_border,
            color: Colors.black,
        ),
    );
  }
}
