import 'dart:math';

import 'package:flutter/material.dart';

import '../../config/colors.dart';

class Devices extends StatefulWidget {
  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: RangerColors.blueBtn,
                        border: Border.all(color: RangerColors.blueBtn),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '123 Oak Grove Dr.',
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            Text(
                              '4 lights on',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Text(
                              '1 fan running',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Text(
                              '1 outlet on',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 115.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Row(
                                        children: const [
                                          Text('Favorite'),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Row(
                                        children: const [
                                          Icon(Icons.edit_rounded)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20, top: 100),
                                child: Text(
                                  'No favorite devices added yet',
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 70, bottom: 70),
                                child: Container(
                                  width: max(200, 70),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border:
                                          Border.all(color: RangerColors.blueBtn)),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 10, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.add,
                                          color: RangerColors.blueBtn,
                                        ),
                                        Text(
                                          'ADD A FAVORITE',
                                          style: TextStyle(
                                              color: RangerColors.blueBtn),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // fixedColor: RangerColors.blueBtn,
          selectedItemColor: RangerColors.blueBtn,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          showUnselectedLabels: false,

          currentIndex: _selectedIndex,
          onTap: _onItemTapped,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.branding_watermark_outlined,
              ),
              label: 'Rooms',

            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle_outline,
              ),
              label: 'Automations',
            ),
            BottomNavigationBarItem(
              icon: Icon( 
                Icons.more_vert,
              ),
              label: 'More',
            ),
          ],

        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}


