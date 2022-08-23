import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddIconWidget extends StatelessWidget {
  final IconData icon;

  const AddIconWidget({Key? key,
    required this.icon,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print(Icons.language.runtimeType);
    return const Icon(
      Icons.language,
      size: 30,
      color: Colors.grey,
    );
  }
}