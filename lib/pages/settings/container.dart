import 'package:flutter/material.dart';

import '../../config/colors.dart';

class ContainerState extends StatelessWidget {
  Color? bgColor;
  double height;
  int? itemCount;

  ContainerState(
      {super.key, this.bgColor, required this.height, this.itemCount});

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0.5, left: 0.5),
      child: Container(
        width: 30,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: RangerColors.blueBtn),
          color: bgColor,
        ),
      ),
    );
  }
}
