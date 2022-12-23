import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranger/base/routes.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/config/str.dart';
import 'package:ranger/pages/automations/automation_provider.dart';
import 'package:ranger/pages/automations/pickers/time.dart';

import '../../widgets/save_btn.dart';

class AutomationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        iconTheme: const IconThemeData(
          color: RangerColors.white,
        ),
        title: const Text(
          'New Automation',
        ),
        centerTitle: true,
        backgroundColor: RangerColors.blueBtn,
      ),
      body: ChangeNotifierProvider(
        create: (context) => AutomationProvider(),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer<AutomationProvider>(
              builder: (context, value, child) => Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(7)),
                            child: const Text('1'),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.automation);
                            },
                          ),
                        ],
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => value.onShowButtons(),
                              child: Column(
                                children: const [
                                  Text(
                                    RangerTexts.indefinitePeriodOfTime,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    RangerTexts.tigger,
                                    style: TextStyle(
                                      color: RangerColors.lightGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Visibility(
                                    visible: value.isShow,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, right: 10.0),
                                          child: InkWell(
                                            onTap: () => showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return _dialog(
                                                  context,
                                                  title:
                                                      RangerTexts.chooseTimer,
                                                );
                                              },
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: RangerColors.white,
                                                  border: Border.all(
                                                      color: RangerColors
                                                          .blueBtn)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.timer_outlined),
                                                    Column(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15.0),
                                                          child: Text(
                                                            RangerTexts.timer,
                                                            style: TextStyle(
                                                              color: RangerColors
                                                                  .greyBottomBar,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15.0),
                                                          child: Text(
                                                            RangerTexts.autoOff,
                                                            style: TextStyle(
                                                              color: RangerColors
                                                                  .lightGrey,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, right: 10.0),
                                          child: InkWell(
                                            onTap: () => Navigator.pushNamed(
                                                context, AppRoutes.datePicker),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: RangerColors.white,
                                                  border: Border.all(
                                                      color: RangerColors
                                                          .blueBtn)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.timer_outlined),
                                                    Column(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15.0),
                                                          child: Text(
                                                            RangerTexts
                                                                .timeOfDay,
                                                            style: TextStyle(
                                                              color: RangerColors
                                                                  .greyBottomBar,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15.0),
                                                          child: Text(
                                                            RangerTexts.time,
                                                            style: TextStyle(
                                                              color: RangerColors
                                                                  .lightGrey,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Save()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dialog(
    context, {
    required String title,
    Widget? content,
  }) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        children: [
          content ?? Text('Text'),   
        ],
      ),
      actions: [
        // TimePicker(),
        Save(),
      ],
    );
  }
}
