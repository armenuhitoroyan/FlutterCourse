import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ranger/pages/devices/bloc/device_bloc.dart';

import '../../config/colors.dart';

class Device extends StatelessWidget {
  var items = [
    'See 1 More',
    'See 2 More',
    'See 3 More',
    'See 4 More',
    'See 5 More',
  ];

  String dropdownvalue = 'See 1 More';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceBloc, DeviceState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: RangerColors.blueBtn,
                        border: Border.all(color: RangerColors.blueBtn),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              '123 Oak Grove Dr.',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Text(
                              '4 lights on',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Text(
                              '1 fan running',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Text(
                              '1 outlet on',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 15, left: 25),
                            child: DropdownButton(
                              dropdownColor: RangerColors.blueBtn,
                              value: state.dropdownvalue,
                              icon: const Icon(
                                Icons.keyboard_arrow_right,
                                color: RangerColors.white,
                              ),
                              items: 
                              items.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                        color: RangerColors.white),
                                  ),
                                  
                                );
                              }).toList(),
                              onChanged: (value) {
                                BlocProvider.of<DeviceBloc>(context)
                                  .add(SelectDropdownItemEvent(value!));
                                state.dropdownvalue = value;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 150.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: RangerColors.white,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          Icon(
                                            Icons.edit_rounded,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 100),
                                child: Text(
                                  'No favorite devices added yet',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 70, bottom: 70),
                                child: Container(
                                  width: max(200, 70),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: RangerColors.blueBtn)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: RangerColors.blueBtn,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            showUnselectedLabels: false,
            currentIndex: state.selectedIndex,
            onTap: (value) {
              BlocProvider.of<DeviceBloc>(context)
                  .add(SelectMenuItemEvent(value));
            },
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
        );
      },
    );
  }
}
