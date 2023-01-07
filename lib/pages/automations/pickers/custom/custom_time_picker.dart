import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ranger/config/colors.dart';

class CustomTimePicker extends StatefulWidget {
  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  int index = 0;
  String time = '';

  @override
  Widget build(BuildContext context) {
    return _onContentBuild();
  }

  Widget _onContentBuild() {
    return Center(
      child: SizedBox(
        height: 240,
        child: Card(
          child: widgetCupertinoPickerUI(widgetCupertinoTimePicker()),
        ),
      ),
    );
  }

  Widget widgetCupertinoPickerUI(Widget picker) {
    return Container(
      padding: const EdgeInsets.only(top: 7),
      color: CupertinoColors.white,
      height: 240,
      width: double.infinity,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 20,
        ),
        child: GestureDetector(
          child: SafeArea(
            child: picker,
          ),
          onTap: () {
            // print('$index');
          },
        ),
      ),
    );
  }

  Widget widgetCupertinoTimePicker() {
    Duration initialTimerDuration = const Duration();
    return CupertinoTimerPicker(
      minuteInterval: 1,
      secondInterval: 1,
      // backgroundColor: RangerColors.rowsBlue,
      initialTimerDuration: initialTimerDuration,
      mode: CupertinoTimerPickerMode.values.elementAt(index),
      onTimerDurationChanged: (Duration duration) {
        setState(() {
          initialTimerDuration = duration;
          time = '${duration.inHours} ${duration.inMinutes % 60}';
        });
      },
    );
  }
}
