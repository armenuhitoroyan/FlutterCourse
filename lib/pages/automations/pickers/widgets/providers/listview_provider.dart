import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  bool isHover = false;
  int index = 0;
  int i = 0;
  double height = 0.0;
  double pos = 0.0;
  double position = 0.0;

  bool isSelected = false;
  ScrollController scrollController = ScrollController();
  List<String> items = [];
  double h = 0.0;

  ListProvider() {
    onSelected();
    getIndex();
  }

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

   int getValue(int val) {
    i = val;
    notifyListeners();
    return i;
  }

  double getPosition(double pos) {
    position = pos;
    notifyListeners();
    return position;
  }

  int getIndex() {
    i = i;
    notifyListeners();
    return i;
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

  bool onSelected() {
    isSelected = true;
    notifyListeners();
    return isSelected;
  }
}
