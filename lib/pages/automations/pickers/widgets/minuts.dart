import 'package:flutter/material.dart';

import '../../../../config/colors.dart';
import '../../../../config/maps/map_time.dart';

class Minutes extends StatefulWidget {
  @override
  State<Minutes> createState() => _MinutesState();
}

class _MinutesState extends State<Minutes> {
  ScrollController _scrollController = ScrollController();
  // late List<bool> _selected;
  List<double> items = [];
  final int listLength = 60;
  double _height = 0.0;
  double h = 0.0;
  int i = 0;
  bool isSelected = false;
  late double dif;
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _height = h;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: ListView.builder(
          itemCount: 60,
          controller: _scrollController,
          itemBuilder: (context, index) {
            print(_height);

            return InkWell(
              // onHover: (value) {
              //   setState(() {
              //     _selected = value;
              //     print(_selected);
              //     i = index;
              //     print(i);
              //   });
              // },

              onTap: () {
                setState(() {
                  i = index;
                  MapTime.map['minutes'] = '$i';
                });
              },
              child: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: index == i
                          // ||
                          //         // (_height != 0.0 && index.isFinite) ||
                          //         //  (_height != 0.0 && _scrollController.position.pixels == _height)
                          //         (isSelected)
                          ? RangerColors.rowsBlue
                          : RangerColors.white),
                  child: Text('$index min'),
                ),
              ),
            );
          }),
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          if (notification.metrics.pixels ==
              _scrollController.position.pixels) {
            h = notification.metrics.pixels;

            isSelected = true;
            return isSelected;
          }
        } else {
          isSelected = false;
          h = 0.0;
        }

        return isSelected;
      },
    );
  }
}
