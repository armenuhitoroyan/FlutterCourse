import 'package:flutter/material.dart';
import 'package:ranger/config/str.dart';

import '../../base/routes.dart';
import '../../config/colors.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int i = 0;
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
        BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.device);
                i = 0;
                _selectedIndex = _selectedIndex;
              },
              child: const Icon(
                Icons.home,
              ),
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
              i = 1;
              
              Navigator.pushNamed(context, AppRoutes.automations);
              _selectedIndex = 2;
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
