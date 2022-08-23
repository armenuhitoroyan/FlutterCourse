import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {

  bool value;
  Color activeColor;
  Color activeTrackColor;
  Color inactiveThumbColor;
  Color inactiveTrackColor;

  SwitchWidget({Key? key,
    this.value = false,
    required this.activeColor,
    required this.activeTrackColor,
    this.inactiveThumbColor = Colors.black54,
    this.inactiveTrackColor = Colors.blueGrey,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: ArgumentError.value,
      activeColor: activeColor,
      activeTrackColor: activeTrackColor,
      inactiveThumbColor: inactiveThumbColor,
      inactiveTrackColor: inactiveTrackColor,
    );
  }

}