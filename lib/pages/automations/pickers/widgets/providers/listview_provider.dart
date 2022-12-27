import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListProvider extends ChangeNotifier {
  bool isHover = false;
  int index = 0;
  double height = 0.0;
  double pos = 0.0;
  double position = 0.0;
  // ViewportOffset? position;
  ScrollController scrollController = ScrollController();
  List<String> items = [];
  int onHover(int val) {
    index = val;
    notifyListeners();
    return index;
  }

  bool onHoverText(bool hover) {
    if (hover) {
      isHover = hover;
    } else {
      isHover = false;
    }
    notifyListeners();
    return isHover;
  }

  double onHoverSB(double sb) {
    height = sb;
    notifyListeners();
    return height;
  }

  // ViewportOffset onHoverPosition(ViewportOffset pos) {
  //   position = pos;
  //   notifyListeners();
  //   return position!;
  // }

  double getPosition(double pos) {
    position = pos;
    notifyListeners();
    return position;
  }

  animateToIndex(int index) {
    this.index = index;

    if (index <= 5) {
      height = index * 2.0;
    } else if (index > 5 && index <= 10) {
      height = index * 2.0;
    } else if (index > 10 && index <= 15) {
      height = (index + 1) * 1.0;
    } else if (index > 15 && index <= 20) {
      height = (index - 1) * 0.5;
    }
    scrollController.jumpTo(0.0); // _scrollController.initialScrollOffset
    scrollController.animateTo(
      index * height,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );

    pos = index * height;
    notifyListeners();
    return pos;
  }

  // getList(String item) {
  //   items[0] = item;
  //   notifyListeners();
  //   // return items;
  // }

  // void scrollUp(double s) {
  //   final double start = s;
  //   scrollController.jumpTo(start);

  //   // scrollController.animateTo(
  //   //   start,
  //   //   duration: Duration(seconds: 1),
  //   //   curve: Curves.easeIn,
  //   // );
  // }

  // void scrollDown(double e) {
  //   final double end = e;

  //   scrollController.jumpTo(end);

  //   scrollController.animateTo(
  //     end,
  //     duration: Duration(seconds: 1),
  //     curve: Curves.easeIn,
  //   );
  // }

  // void listenScrolling(context) {
  //   if (scrollController.position.atEdge) {
  //     final isTop = scrollController.position.pixels == 0;

  //     if (isTop) {
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text('Reached start'),
  //       ));
  //     } else {
  //        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text('Reached end'),
  //       ));
  //     }
  //   }
  // }
}
