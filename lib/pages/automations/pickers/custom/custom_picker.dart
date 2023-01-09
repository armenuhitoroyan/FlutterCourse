import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ranger/config/colors.dart';

class CustomPicker extends StatefulWidget {
  @override
  State<CustomPicker> createState() => _CustomPickerPageState();
}

class _CustomPickerPageState extends State<CustomPicker> {
  late TimeOfDay initialTime;
  TransitionBuilder? builder;
  bool useRootNavigator = true;
  TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial;
  String? cancelText;
  String? confirmText;
  String? helpText;
  String? errorInvalidText;
  String? hourLabelText;
  String? minuteLabelText;
  RouteSettings? routeSettings;
  EntryModeChangeCallback? onEntryModeChanged;
  Offset? anchorPoint;

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
                      showDialog<TimeOfDay>(
                        context: context,
                        useRootNavigator: useRootNavigator,
                        builder: (BuildContext context) {
                          return builder == null
                              ? dialog
                              : builder!(context, dialog);
                        },
                        routeSettings: routeSettings,
                        anchorPoint: anchorPoint,
                      );
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

  // TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial;
  final Widget dialog = TimePickerDialog(
    initialTime: TimeOfDay.now(),
    initialEntryMode: TimePickerEntryMode.dial,
    cancelText: 'cancelText',
    confirmText: 'confirmText',
    helpText: 'helpText',
    errorInvalidText: 'errorInvalidText',
    hourLabelText: 'hourLabelText',
    minuteLabelText: 'minuteLabelText',
    onEntryModeChanged: (p0) {
      print(p0);
    },
  );
}
