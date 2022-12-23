import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/str.dart';

class Save extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: ElevatedButton(
          onPressed: () => print('button'),
          style:
              ElevatedButton.styleFrom(backgroundColor: RangerColors.blueBtn),
          child: Text(RangerTexts.save),
        ),
      ),
    );
  }
}
