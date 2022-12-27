import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/pages/automations/pickers/widgets/providers/listview_provider.dart';

class Hours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController =
        ScrollController(keepScrollOffset: true);
    String item = '';
    List<String> list = [];

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
                value.index = index;
                // value.position = _scrollController.position.pixels;
                // value.position =
                //     value.getPosition(_scrollController.position.pixels);
                return InkWell(
                  onTap: () {
                    value.animateToIndex(index);
                  },
                  child: SizedBox(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: value.index == 0 ||
                                value.index == index
                              ? RangerColors.rowsBlue
                              : RangerColors.white),
                      child: Text('$index h'),
                    ),
                  ),
                );
              }),
          // onNotification: (notification) {
          //   if (notification is ScrollEndNotification) {
          //     if (double.tryParse(value.items[value.items.length - 1])! <=
          //         _scrollController.position.maxScrollExtent) {
          //       value.onHoverText(true);
          //       return value.isHover;
          //     } else {
          //       value.onHoverText(false);
          //     }
          //   }

          //   print(value.items);
          //   return value.isHover;
          // },
        ),
      ),
    );
  }
}
