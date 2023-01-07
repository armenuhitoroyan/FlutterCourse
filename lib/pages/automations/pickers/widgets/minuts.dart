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

  final int listLength = 60;
  double _height = 0.0;
  double height = 0.0;
  double h = 0.0;
  int i = 0;
  int ind = 0;
  double physics = 0.0;
  bool isSelected = false;
  late double dif;
  int diff = 1;

  @override
  void initState() {
    setState(() {
      super.initState();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: ListView.builder(
          itemCount: 60,
          controller: _scrollController,
          itemBuilder: (context, index) {
            height = _scrollController.position.pixels;
            return InkWell(
              onTap: () {
                print(index);
                print(index == getIndex(index));
                print(getIndex(index) / 2);
                // height = _scrollController.position.pixels;
                print(height);
              },
              child: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: index == 0 || (index == getIndex(index))
                          ? RangerColors.rowsBlue
                          : RangerColors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      '$index min',
                      style: TextStyle(
                          color: _height == _scrollController.position.pixels
                              ? Colors.red
                              : Colors.black),
                    ),
                  ),
                ),
              ),
            );
          }),
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          // if (notification.metrics.pixels ==
          //     _scrollController.position.pixels) {
          h = notification.metrics.pixels;
          Pixels.pixel = h;
          print(h);

          setState(() {
            _height = getPixels(h);
          });

          isSelected = true;
          return isSelected;
          // } else {
          //   h = 0.0;
          //   Pixels.pixel = h;

          //   setState(() {
          //     _height = getPixels(h);
          //   });
          // }
        } else {
          isSelected = false;
          h = 0.0;
        }

        return isSelected;
      },
    );
  }

  getPixels(double pixels) {
    _height = pixels;
    return _height;
  }

  getIndex(int index) {
    
    // print(diff);
    // ind = (height / (height / index).round()).round() + 1;
    ind = height >= 30
        ? (((height / 20).round() - 1) + ((height / index).round() - 1)) - 1
        : (((height / 20).round() - 1) + ((height / index).round() - 1)) + 1;
    print('i => $ind');
    return ind;
  }
}
