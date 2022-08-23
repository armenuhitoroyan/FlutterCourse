import 'package:flutter/material.dart';

class AddIconWidget extends StatelessWidget {
  IconData icon;

  AddIconWidget( {Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 30,
      color: Colors.grey,
    );
  }
}