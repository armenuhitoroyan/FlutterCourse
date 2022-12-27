import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/pages/automations/pickers/timer_provider.dart';
import 'package:ranger/pages/automations/pickers/widgets/hours.dart';
import 'package:ranger/pages/automations/pickers/widgets/minuts.dart';

class TimePicker extends StatelessWidget {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeProvider(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<TimeProvider>(
            builder: (context, value, child) => ListView.builder(
              itemCount: value.list.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                          Text(value.list[index]),
                        ],
                      ),
                      index == 0 && value.color == 'blue'
                          ? Visibility(
                              visible: value.isVisible,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 45,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 2.5),
                                        child: Hours(),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 45,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 2.5),
                                        child: Minutes(),
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
      ),
    );
  }
}
