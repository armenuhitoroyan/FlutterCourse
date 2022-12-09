import 'package:flutter/material.dart';
import 'package:ranger/config/colors.dart';

import '../../widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../../widgets/bottom_nav_bar/bottom_navbar.dart';
import 'container.dart';

class Settings extends StatelessWidget {
  List<Color> colors = [];
  Settings({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return _buildContent(const Color.fromARGB(255, 63, 81, 181), 4);
  }

  Widget _buildContent(Color? bgColor, int itemCount) {
    gradient(bgColor!, itemCount);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: GridView.builder(
            itemCount: itemCount,
            itemBuilder: (context, index) => ContainerState(
              bgColor: index == 0 ? Colors.black : colors[index],
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: itemCount,
                childAspectRatio: 1.5,
                crossAxisSpacing: 0.5,
                mainAxisSpacing: 0.5),
          ),
        ),
      ),
    );
  }

  gradient(
    Color bgColor,
    int itemCount,
  ) {
    int r = bgColor.red;
    int g = bgColor.green;
    int b = bgColor.blue;
    int a = 255, cR, cG, cB;
    int index = itemCount;
    cR = (r / index).round();
    cG = (g / index).round();
    cB = (b / index).round();

    // print(bgColor);

    while (index > 0) {
      r = (cR / index).round();
      g = (cG / index).round();
      b = (cB / index).round();
      cR = r + cR;
      cG = g + cG;
      cB = b + cB;

      bgColor = Color.fromARGB(
        a,
        cR,
        cG,
        cB,
      );
      print(bgColor);
      colors.add(bgColor);

      index--;
    }
  }
}
