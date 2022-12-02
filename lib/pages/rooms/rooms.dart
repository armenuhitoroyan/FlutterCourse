import 'package:flutter/material.dart';

import '../../widgets/bottom_nav_bar/bottom_nav_bar.dart';

import '../../../widgets/bottom_nav_bar/bottom_navbar.dart';

class Rooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Rooms'),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
