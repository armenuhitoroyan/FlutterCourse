import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/config/maps/map_time.dart';
import 'package:ranger/pages/automations/pickers/date.dart';
import 'package:ranger/pages/automations/pickers/time.dart';

import '../../../../config/str.dart';
import '../../../../widgets/save_btn.dart';
import '../../automation.dart';
import '../../automation_provider.dart';

class DialogState extends StatefulWidget {
  String title;

  DialogState(content, {required this.title});

  @override
  State<DialogState> createState() => _DialogStateState();
}

class _DialogStateState extends State<DialogState> {
  Widget? content;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _dialog(widget.title, context, content);
  }

  Widget _dialog(String title, BuildContext context, Widget? content) {
    return SizedBox(
      child: AlertDialog(
        backgroundColor: RangerColors.white,
        title: Text(title),
        content: Column(
          children: [
            Expanded(
                child: AutomationPage.dialogAlert == RangerTexts.dialogAlert
                    ? DatePicker()
                    : TimePicker()),
          ],
        ),
        actions: [
          Save(callback: () {
            Navigator.pop(context);
            print(MapTime.map);
          }),
        ],
      ),
    );
  }
}
