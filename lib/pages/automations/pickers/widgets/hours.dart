import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/pages/automations/pickers/widgets/providers/listview_provider.dart';

class Hours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController =
        ScrollController(keepScrollOffset: true);

    return ChangeNotifierProvider(
      create: (context) => ListProvider(),
      child: Consumer<ListProvider>(
        builder: (context, value, child) => NotificationListener(
          child: ListView.builder(
              controller: value.scrollController,
              itemCount: 12,
              itemExtent: 15.0,
              itemBuilder: (context, index) {
                value.height = value.scrollController.position.pixels;
                value.i = index;
                

                print('//////////////////');
                print(value.i);
                print(value.height);

                // value.animateToIndex(value.i);

                return InkWell(
                  onTap: () {
                    print('*******');

                    print(index);
                    print('height: ${value.height}');
                    print(value.animateToIndex(index));

                    // MapTime.map['hours'] = '${value.i}';
                  },
                  child: SizedBox(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: index == 0   // || index == value.animateToIndex(value.i+1)
                              ? RangerColors.rowsBlue
                              : RangerColors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          '$index h',
                          style: TextStyle(
                              color: index == 0 ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ),
                );
              }),
          onNotification: (notification) {
            if (notification is ScrollEndNotification) {
              if (notification.metrics.pixels ==
                  value.scrollController.position.pixels) {
                value.h = notification.metrics.pixels;
                value.isSelected = true;

                return value.isSelected;
              } else {
                value.isSelected = false;
              }
            } else {
              value.isSelected = false;
              value.h = 0.0;
            }

            return value.isSelected;
          },
        ),
      ),
    );
  }
}
