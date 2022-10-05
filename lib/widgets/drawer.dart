import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(60.0),
      ),
      child: Drawer(     
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: const DrawerHeader(
                child: Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
