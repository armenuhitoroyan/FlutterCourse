import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/pages/automations/pickers/timer_provider.dart';

class AfterBefore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeProvider(),
      child: Consumer<TimeProvider>(builder: (context, value, child) {
        print(
          'ab = ${value.ab}, ampm = ${value.ampm}, i = ${value.i}',
        );
        value.setIndex();
        return ListView.builder(
          itemCount: value.afterBefore.length,
          itemBuilder: (context, index) => SingleChildScrollView(
            child: SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: index == 0
                        ? RangerColors.rowsBlue
                        : RangerColors.white),
                child: InkWell(
                  onHover: (value) {
                    print('1');
                  },
                  child: Padding(
                    padding:   EdgeInsets.only(left: 5),
                    child: Text(
                      value.afterBefore[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
