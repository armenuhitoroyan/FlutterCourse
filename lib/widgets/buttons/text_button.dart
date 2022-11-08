import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  String textBtn;
   Function onClick;
  TextBtn({super.key, required this.onClick, required this.textBtn});
 

  @override
  Widget build(BuildContext context) {
    return btn(onClick, textBtn);
  }

  Widget btn(Function onClick, String text) {
    return TextButton(
      onPressed: onClick(),
      style: TextButton.styleFrom(
        foregroundColor: const Color.fromRGBO(204, 0, 1, 0.8),
      ),
      child: Text(text),
    );
  }
}
