import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  String textBtn;
  TextBtn({super.key, required this.textBtn});

  @override
  Widget build(BuildContext context) {
    return btn(textBtn);
  }

  Widget btn(String text) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.redAccent
      ),
      child: Text('$text'),
    );
  }
}
