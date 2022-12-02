import 'package:flutter/material.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/config/str.dart';
import 'package:ranger/pages/devices/widgets/appbar_textts.dart';


import '../../widgets/bottom_nav_bar/bottom_navbar.dart';


class DevicesState extends StatefulWidget {
  @override
  State<DevicesState> createState() => _DevicesStateState();
}

class _DevicesStateState extends State<DevicesState> {
  List<String> list = <String>[
    'See More 1',
    'See More 2',
    'See More 3',
    'See More 4',
    'See More 5'
  ];

  String dropdownValue = 'See More 1';
  double width = 0;
  bool isTurned = false;
  bool isTurnOn = false;
  double percent = 0;

  @override
  Widget build(BuildContext context) {
    return _contentBuilder();
  }

  Widget _contentBuilder() {
    double contWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: RangerColors.blueBtn,
                      border: Border.all(color: RangerColors.blueBtn)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: AppbarTexts(RangerTexts.grove, 30),
                      ),
                      AppbarTexts(RangerTexts.lightsOn, 18),
                      AppbarTexts(RangerTexts.running, 18),
                      AppbarTexts(RangerTexts.outlet, 18),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: DropdownButton<String>(
                          dropdownColor: RangerColors.blueBtn,
                          icon: const Icon(
                            Icons.keyboard_arrow_right,
                            color: RangerColors.white,
                          ),
                          value: dropdownValue,
                          elevation: 16,
                          style: const TextStyle(color: RangerColors.white),
                          onChanged: _onSelectItem,
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 220.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: double.infinity,
                      height: height,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: RangerColors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15.0),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Row(
                                    children: const [
                                      Text(RangerTexts.favorite)
                                    ],
                                  ),
                                ),
                                Row(
                                  children: const [Icon(Icons.edit_rounded)],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, top: 20.0),
                            child: Row(
                              children: const [
                                Text(
                                  'All Devices',
                                  style: TextStyle(
                                      fontSize: 25, color: RangerColors.black),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          Stack(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 20),
                              child: SizedBox(
                                width: width > 0 ? width : 0,
                                height: 70,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: LinearGradient(colors: [
                                        RangerColors.white,
                                        isTurned
                                            ? RangerColors.yellowBtn
                                            : RangerColors.greyBottomBar
                                      ])),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 15, right: 15),
                              child: GestureDetector(
                                onHorizontalDragStart: (details) => 0,
                                onHorizontalDragUpdate: (details) => isTurnOn
                                    ? _onDecideIllumination(
                                        contWidth, details.globalPosition.dx)
                                    : null,
                                child: Container(
                                  width: double.infinity,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: isTurned
                                            ? RangerColors.yellowBtn
                                            : RangerColors.greyBottomBar),
                                  ),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: _onTurnLight,
                                              icon: isTurned
                                                  ? const Icon(
                                                      Icons.lightbulb_sharp,
                                                      color: RangerColors
                                                          .yellowBtn,
                                                    )
                                                  : const Icon(
                                                      Icons.lightbulb_outline),
                                            ),
                                            const Text('DP motik')
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          isTurned || isTurnOn
                                              ? Text('${percent.round()}')
                                              : const Text('On'),
                                          const Icon(Icons.import_export)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ]),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 100),
                            child: Text(
                              RangerTexts.favDevs,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: RangerColors.white,
                                  border:
                                      Border.all(color: RangerColors.blueBtn)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.add,
                                    color: RangerColors.blueBtn,
                                  ),
                                  Text(
                                    RangerTexts.addFav,
                                    style:
                                        TextStyle(color: RangerColors.blueBtn),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavbar(),
    );
  }

  void _onSelectItem(String? value) {
    setState(() {
      dropdownValue = value!;
    });
  }

  bool _onTurnLight() {
    setState(() {
      isTurned = !isTurned;
      isTurnOn = true;
    });

    return isTurned;
  }

  _onDecideIllumination(double contWidth, double? slideErWidth) {
    setState(() {
      if (slideErWidth! > 0) {
        contWidth = contWidth - 30;
        width = (slideErWidth);
        percent = ((100 * slideErWidth) / contWidth - 1).clamp(0, 100);
      } else if (slideErWidth < 0) {
        width = 0;
        percent = 0;
      }
    });

    return percent;
  }
}
