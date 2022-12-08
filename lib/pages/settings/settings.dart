import 'package:flutter/material.dart';
import 'package:ranger/config/colors.dart';

import '../../widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../../widgets/bottom_nav_bar/bottom_navbar.dart';
import 'container.dart';

class Settings extends StatelessWidget {
  Settings({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return _buildContent(Colors.blueGrey, 7);
  }

  Widget _buildContent(Color? bgColor, int itemCount) {
    int i = 0;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: GridView.builder(
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) => ContainerState(
              bgColor: index < itemCount
                  ? Colors.indigo[500 + (index * 100)]
                  : Colors.black,
              height: 150,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: itemCount,
                childAspectRatio: 1.5,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0),
          ),
        ),
      ),
    );
  }
}
