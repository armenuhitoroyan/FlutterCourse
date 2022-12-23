import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/pages/automations/pickers/timer_provider.dart';

class AfterBefore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeProvider(),
      child: Consumer<TimeProvider>(
        builder: (context, value, child) =>
        ListView.builder(
          itemCount: value.ab.length,
          itemBuilder: (context, index) => SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: index == 1 
                    ? RangerColors.rowsBlue 
                    : RangerColors.white),
              child: Text(value.ab[index]),
            ),
          ),
        ),
      ),
    );
  }
}
