import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ranger/config/colors.dart';

class CustomPicker extends StatefulWidget {
  @override
  State<CustomPicker> createState() => _CustomPickerPageState();
}

class _CustomPickerPageState extends State<CustomPicker> {
  Duration initialTimerDuration = Duration();
  String time = '';
  double cupertinoPickerHeight = 225;
  int _selectedValue = 0;

  String selectedItem = '';
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Cupertino Picker Sample'),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showCupertinoModalPopup<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: SizedBox(
                                height: 240,
                                child: Card(
                                  child: widgetCupertinoPickerUI(
                                      widgetCupertinoTimePicker()),
                                ),
                              ),
                            );
                          });
                    },
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepOrangeAccent),
                          child: const Center(
                            child: Text(
                              'Cupertino Picker',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget widgetCupertinoPickerUI(Widget picker) {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(top: 7),
        color: CupertinoColors.white,
        height: 240,
        child: DefaultTextStyle(
          style: const TextStyle(
            color: CupertinoColors.black,
            fontSize: 20,
          ),
          child: GestureDetector(
            child: SafeArea(
              top: false,
              child: picker,
            ),
            onTap: () {
              // print('$index');
            },
          ),
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
