import 'package:flutter/material.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/config/str.dart';
import 'package:ranger/pages/devices/widgets/appbar_textts.dart';

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

  @override
  Widget build(BuildContext context) {
    return _contentBuilder();
  }

  Widget _contentBuilder() {
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
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: RangerColors.white),
                      child: Column(
                        children: [
                          Stack(children: [
                            Container(),
                            Container()
                          ])
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
    );
  }

  void _onSelectItem(String? value) {
    setState(() {
      dropdownValue = value!;
    });
  }
}
