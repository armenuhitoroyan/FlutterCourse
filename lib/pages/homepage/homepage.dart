import 'package:exam_at/base/routes.dart';
import 'package:exam_at/widgets/menu/top_menu.dart';
import 'package:flutter/material.dart';

import '../../widgets/menu/bottom_menu.dart';
import '../../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(204,0,1, 0.8),
        ),
        automaticallyImplyLeading: false,
      ),
      endDrawer: DrawerWidget(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/asset161.png',
                height: 70,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(5),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Center(child: BottomMenuWidget()),
                      // ignore: prefer_const_constructors
                      Center(child: TopMenuWidget())
                    ],
                  ),
                )
                // ),
                ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'assets/group4438.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // );
  }
}
