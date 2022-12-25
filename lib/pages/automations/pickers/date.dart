import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/pages/automations/pickers/timer_provider.dart';
import 'package:ranger/pages/automations/pickers/widgets/after_before.dart';
import 'package:ranger/pages/automations/pickers/widgets/hours.dart';
import 'package:ranger/pages/automations/pickers/widgets/minuts.dart';

class DatePicker extends StatelessWidget {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return ChangeNotifierProvider(
      create: (context) => TimeProvider(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<TimeProvider>(
            builder: (context, value, child) => ListView.builder(
              itemCount: value.listDAtes.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              value.onpressed();
                              value.i = index;
                              value.onVisibleTime();
                            },
                            icon: value.i == index && value.color == 'blue'
                                ? const Icon(
                                    Icons.task_alt_outlined,
                                    color: RangerColors.lightBlue,
                                  )
                                : const Icon(
                                    Icons.circle_outlined,
                                    color: RangerColors.black,
                                  )),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Icon(
                            value.listIcons[index],
                            color: value.i == index && value.color == 'blue'
                                ? RangerColors.lightBlue
                                : RangerColors.black,
                          ),
                        ),
                        Text(
                          value.listDAtes[index],
                          style: TextStyle(
                            color: value.i == index && value.color == 'blue'
                                ? RangerColors.lightBlue
                                : RangerColors.black,
                          ),
                        ),
                      ],
                    ),
                    index == 0 && value.color == 'blue'
                        ? Visibility(
                            visible: value.isVisible,
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 60,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 2.5),
                                      child: Hours(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 60,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 2.5),
                                      child: Minutes(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 60,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 2.5),
                                      child: AfterBefore(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
