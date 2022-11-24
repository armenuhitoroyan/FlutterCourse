import 'package:flutter/material.dart';
import 'package:ranger/config/str.dart';

import '../../base/routes.dart';
import '../../config/colors.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: RangerColors.blueBtn,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: RangerTexts.home),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.branding_watermark_outlined,
          ),
          label: RangerTexts.rooms,
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              _selectedIndex = _selectedIndex;
              Navigator.pushNamed(context, AppRoutes.automations);
            },
            child: const Icon(
              Icons.play_circle_outline,
            ),
          ),
          label: RangerTexts.automations,
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.more_vert,
          ),
          label: RangerTexts.settings,
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
