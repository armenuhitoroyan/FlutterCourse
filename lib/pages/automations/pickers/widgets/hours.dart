import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/pages/automations/pickers/widgets/providers/listview_provider.dart';

import '../../../../config/maps/map_time.dart';

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
              controller: _scrollController,
              itemCount: 12,
              itemExtent: 15.0,
              itemBuilder: (context, index) {
                value.items.add('${_scrollController.position.pixels}');
                return InkWell(
                  // onTap: () {
                  //   value.getValue(index);
                  //   MapTime.map['hours'] = '${value.i}';
                  // },
                  onLongPress: () {
                    print('*******');
                  },
                  // onHover: (val) {
                  //   // value.onSelected();
                  //   value.isSelected = val;
                  //   print(value.isSelected);
                  // },
                  child: SizedBox(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: index == value.i || value.isSelected
                              ? RangerColors.rowsBlue
                              : RangerColors.white),
                      child: Text('$index h'),
                    ),
                  ),
                );
              }),
          onNotification: (notification) {
            if (notification is ScrollEndNotification) {
              if (notification.metrics.pixels ==
                  _scrollController.position.pixels) {
                // if (_scrollController.hasClients) {
                value.h = notification.metrics.pixels;
                value.isSelected = true;
                // _scrollController.animateTo(_scrollController.offset,
                //     duration: const Duration(seconds: 2), curve: Curves.easeIn);

                return value.isSelected;
                // }

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
