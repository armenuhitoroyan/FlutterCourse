import 'package:flutter/material.dart';
import 'package:ranger/config/str.dart';

import '../../base/routes.dart';
import '../../config/colors.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  int  _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Future<void> changeIndex() async {
      _selectedIndex = await _selectedIndex > 0 ? _selectedIndex : 0;
    }

    return BottomNavigationBar(
      selectedItemColor: RangerColors.blueBtn,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.devices),
              icon: const Icon(
                Icons.home,
              ),
            ),
            label: RangerTexts.home),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.rooms),
            icon: const Icon(
              Icons.branding_watermark_outlined,
            ),
          ),
          label: RangerTexts.rooms,
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.automations),
                
            icon: const Icon(
              Icons.play_circle_outline,
            ),
          ),
          label: RangerTexts.automations,
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.settings);
              changeIndex();
            },
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
          label: RangerTexts.settings,
        ),
      ],
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    return _selectedIndex;
  }
}