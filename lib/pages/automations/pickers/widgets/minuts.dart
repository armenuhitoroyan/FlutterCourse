import 'package:flutter/material.dart';

class Minutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 59,
      itemBuilder: (context, index) => Text('$index min'),
    );
  }
}
