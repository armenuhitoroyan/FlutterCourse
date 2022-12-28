import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/pages/automations/pickers/timer_provider.dart';

class AmPm extends StatefulWidget {
  @override
  State<AmPm> createState() => _AmPmState();
}

class _AmPmState extends State<AmPm> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeProvider(),
      child: Consumer<TimeProvider>(builder: (context, value, child) {
        value.setIndex();
        return ListView.builder(
          itemCount: value.amPm.length,
          itemBuilder: (context, index) => SingleChildScrollView(
            child: SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: index == 0
                        ? RangerColors.rowsBlue
                        : RangerColors.white),
                child: InkWell(
                  onHover: (value) {
                    setState(() {
                      print(value);
                    });
                  },
                  child: Text(
                    value.amPm[index],
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
