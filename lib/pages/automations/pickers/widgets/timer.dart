import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:ranger/config/colors.dart';

class TimerWidget extends StatefulWidget {
  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  var _dateTime;
  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(
          fontSize: 24,
          color: RangerColors.black,
          background: Paint()..color = RangerColors.white),
      highlightedTextStyle: TextStyle(
          fontSize: 24,
          color: RangerColors.white,
          background: Paint()..color = RangerColors.rowsBlue, ),
      spacing: 20,
      itemHeight: 50,
      isForce2Digits: true,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
}
