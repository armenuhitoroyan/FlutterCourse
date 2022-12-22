import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranger/base/routes.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/pages/automations/automation_provider.dart';

class AutomationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        iconTheme: const IconThemeData(
          color: RangerColors.white,
        ),
        title: const Text(
          'New Automation',
        ),
        centerTitle: true,
        backgroundColor: RangerColors.blueBtn,
      ),
      body: ChangeNotifierProvider(
        create: (context) => AutomationProvider(),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer<AutomationProvider>(
              builder: (context, value, child) => 
               Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(7)),
                                child: const Text('1'),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.automation);
                                },
                              ),
                            ],
                          ),
                          Flexible(
                            flex: 1,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () => value.onShowButtons(),
                                      child: Column(
                                        children: const [
                                          Text(
                                            'When...',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            'Select a tigger',
                                            style: TextStyle(
                                              color: RangerColors.lightGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: value.isShow,
                                      child: Column(
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  maximumSize:
                                                      const Size(double.infinity, 70),
                                                  backgroundColor: RangerColors.white,
                                                  side: const BorderSide(
                                                    width: 1.5,
                                                    color: RangerColors.blueBtn,
                                                  )),
                                              onPressed: () {
                                                print('Timer');
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.lock_clock,
                                                        color: RangerColors.blueBtn,
                                                        size: 15,
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: const [
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 15.0),
                                                        child: Text(
                                                          'Timer',
                                                          style: TextStyle(
                                                            color: RangerColors
                                                                .greyBottomBar,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 15.0),
                                                        child: Text(
                                                          'Auto-off after ... 1h 3m                ',
                                                          style: TextStyle(
                                                            color: RangerColors
                                                                .lightGrey,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 7.0),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    maximumSize: const Size(
                                                        double.infinity, 70),
                                                    backgroundColor:
                                                        RangerColors.white,
                                                    side: const BorderSide(
                                                      width: 1.5,
                                                      color: RangerColors.blueBtn,
                                                    )),
                                                onPressed: () {
                                                  print('Timer');
                                                },
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      children: const [
                                                        Icon(
                                                          Icons.lock_clock,
                                                          color: RangerColors.blueBtn,
                                                          size: 15,
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: const [
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              left: 15.0),
                                                          child: Text(
                                                            'Time of Day',
                                                            style: TextStyle(
                                                              color: RangerColors
                                                                  .greyBottomBar,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              left: 15.0),
                                                          child: Text(
                                                            'e.g. sunrise, sunset, 6:45 pm       ',
                                                            style: TextStyle(
                                                              color: RangerColors
                                                                  .lightGrey,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: ElevatedButton(
                        onPressed: () => print('button'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: RangerColors.blueBtn),
                        child: const Text('Save'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
