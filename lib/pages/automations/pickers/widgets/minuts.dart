import 'package:flutter/material.dart';

import '../../../../config/colors.dart';

class Minutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 59,
      itemBuilder: (context, index) => SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: index == 1 
                ? RangerColors.rowsBlue 
                : RangerColors.white),
          child: Text('$index min'),
        ),
      ),
    );
  }
}
