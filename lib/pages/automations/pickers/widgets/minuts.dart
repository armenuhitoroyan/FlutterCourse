import 'package:flutter/material.dart';

import '../../../../config/colors.dart';

class Minutes extends StatefulWidget {
  @override
  State<Minutes> createState() => _MinutesState();
}

class _MinutesState extends State<Minutes> {
  ScrollController _scrollController = ScrollController();
  late List<bool> _selected;
  final int listLength = 60;
  double _height = 1.0;
  int? i;

  @override
  void initState() {
    super.initState();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 60,
        controller: _scrollController,
        itemBuilder: (context, index) {
          //

          return InkWell(
            onTap: () {
              print(index);

              _animateToIndex(index);

              setState(() {
                i = index;
              });

              if (index <= 5) {
                _height = index * 2.0;
              } else if (index > 5 && index <= 10) {
                _height = index * 2.0;
              } else if (index > 10 && index <= 15) {
                _height = (index + 1) * 1.0;
              } else if (index > 15 && index <= 20) {
                _height = (index - 1) * 0.5;
              } 
              // else if (index > 20 && index <= 25) {
              //   _height = (index - 1) * 0.3;
              // } else if (index > 25 && index < 30) {
              //   _height = (index - 1) * 0.2;
              // }
            },
            child: SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: index == i
                        ? RangerColors.rowsBlue
                        : RangerColors.white),
                child: Text('$index min'),
              ),
            ),
          );
        });
  }

  void _animateToIndex(int index) {
    _scrollController.jumpTo(0.0);
    _scrollController.animateTo(
      index * _height,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }
}
