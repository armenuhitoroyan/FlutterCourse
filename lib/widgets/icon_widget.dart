import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  IconData icon;

  IconWidget( {Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 45,
    );
  }
}