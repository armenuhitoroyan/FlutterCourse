import 'package:flutter/material.dart';
import 'package:ranger/config/colors.dart';

class Hours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 12,
      itemBuilder: (context, index) => SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: index == 1 
                ? RangerColors.rowsBlue 
                : RangerColors.white),
          child: Text('$index h'),
        ),
      ),
    );
  }
}
