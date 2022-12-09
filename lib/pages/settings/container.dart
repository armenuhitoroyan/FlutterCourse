import 'package:flutter/material.dart';

import '../../config/colors.dart';

class ContainerState extends StatelessWidget {
  Color bgColor;

  ContainerState(
      {super.key, required this.bgColor,});

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0.5, left: 0.5),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: RangerColors.blueBtn),
          color: bgColor,
        ),
      ),
    );
  }
}
