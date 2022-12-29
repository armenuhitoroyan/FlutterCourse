import 'package:flutter/material.dart';

import '../../../../config/colors.dart';
import '../../../../config/maps/map_time.dart';
import '../../../../config/pixels.dart';

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
          // onHover:(value) => print(value),
          // onTap: () {
          //   setState(() {
          //     i = index;
          //   });
          //   MapTime.map['minutes'] = '$i';
          // },

          itemCount: 60,
          controller: _scrollController,
          itemBuilder: (context, index) {
            print(_height);

            return InkWell(
              onTap: () {},

              // onTap: () {
              //   setState(() {
              //     i = index;
              //   });
              //   MapTime.map['minutes'] = '$i';
              // },
              // onLongPress: () => print('******'),
              onHover: (value) {
                setState(() {
                  i = index;
                  return ;
                });
                
                // i = value ? index : 0;

                MapTime.map['minutes'] = '$i';
                print(i);

                print("On Hover");
              },
              // onTapUp: (details) => print(details.localPosition),
              // onFocusChange: (value) => print('#################'),
              child: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: index == 0 && index == i
                          // || Pixels.pixel > 0.0
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
            Pixels.pixel = h;
            print(Pixels.pixel);

            isSelected = true;
            return isSelected;
          } else {
            h = 0.0;
            Pixels.pixel = h;
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
