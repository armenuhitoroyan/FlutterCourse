import 'package:flutter/material.dart';
import 'package:ui_settings/widgets/add_icon_widget.dart';

import '../widgets/add_text_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                //
                  height: 115,
                  decoration: BoxDecoration(
                      border: Border(
                        bottom:  BorderSide(width: 1.0, color: Colors.grey.shade200),
                      )
                  ),
                  child:  Column(children: [
                    Column(
                      children: [
                        Row(children:  [
                          AddTextWidget(
                              text: 'Common',
                              color: Colors.deepOrange,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                          )
                        ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: AddIconWidget( icon: Icons.language )
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 50, top: 40),
                                child: Column(
                                  children: const [
                                    Text(
                                      'Language',
                                      style: TextStyle(
                                        fontSize: 15,

                                      ),
                                    ),
                                    Text(
                                      'English',
                                      style: TextStyle(
                                          color: Colors.grey
                                      ),
                                    )
                                  ],
                                )
                            )
                          ],
                        )
                      ],)
                  ],)
              ),
              Container(
                //
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border(
                        bottom:  BorderSide(width: 1.0, color: Colors.grey.shade200),
                      )
                  ),
                  child:  Column(children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: AddIconWidget( icon: Icons.cloud_outlined )
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 50, top: 30),
                                child: Column(
                                  children: const [
                                    Text(
                                      'Environment',
                                      style: TextStyle(
                                        fontSize: 15,

                                      ),
                                    ),
                                    Text(
                                      'Production',
                                      style: TextStyle(
                                          color: Colors.grey
                                      ),
                                    )
                                  ],
                                )
                            )
                          ],
                        ),
                       Container(
                         margin: const EdgeInsets.only(top: 35),
                         child:
                         Row(
                             children: [
                               AddTextWidget(
                                 text: 'Account',
                                 color: Colors.deepOrange,
                                 fontSize: 18,
                                   fontWeight: FontWeight.bold
                               )
                             ]),
                       ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(margin: const EdgeInsets.only(top: 5),
                                child: const Icon(
                                  Icons.call,
                                  size: 30,
                                  color: Colors.grey,
                                )
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 50, top: 40),
                                child: Column(
                                  children: const [
                                    Text(
                                      'Phone number',
                                      style: TextStyle(
                                        fontSize: 15,

                                      ),
                                    ),
                                  ],
                                )
                            )
                          ],
                        )
                      ],)
                  ],)
              ),
              Container(
                //
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border(
                        bottom:  BorderSide(width: 1.0, color: Colors.grey.shade200),
                      )
                  ),
                  child:  Column(children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: AddIconWidget( icon: Icons.email )
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 50, top: 30),
                                child: Column(
                                  children: const [
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                        fontSize: 15,

                                      ),
                                    ),
                                  ],
                                )
                            )
                          ],
                        ),
                      ],)
                  ],)
              ),
              Container(
                //
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border(
                        bottom:  BorderSide(width: 1.0, color: Colors.grey.shade200),
                      )
                  ),
                  child:  Column(children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: AddIconWidget( icon: Icons.assignment_return_rounded )
        ),
                            Container(
                                margin: const EdgeInsets.only(left: 50, top: 30),
                                child: Column(
                                  children: const [
                                    Text(
                                      'Sign aut',
                                      style: TextStyle(
                                        fontSize: 15,

                                      ),
                                    ),
                                  ],
                                )
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 35),
                          child:
                          Row(
                              children: [
                                AddTextWidget(
                                  text: 'Security',
                                  color: Colors.deepOrange,
                                  fontSize: 18,
                                    fontWeight: FontWeight.bold
                                )
                              ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(margin: const EdgeInsets.only(top: 5),
                                child: AddIconWidget( icon: Icons.phonelink_lock )
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 50, top: 40),
                                child: Column(
                                  children: const [
                                    Text(
                                      'Lock upp in background',
                                      style: TextStyle(
                                        fontSize: 15,

                                      ),
                                    ),
                                  ],
                                )
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 70, top: 10),
                              child: const Switch(
                                // onChanged: true,
                                value: true,
                                onChanged: ArgumentError.value,
                                activeColor: Colors.deepOrange,
                                activeTrackColor: Colors.pinkAccent,
                                inactiveThumbColor: Colors.black54,
                                inactiveTrackColor: Colors.blueGrey,
                              ),
                            )
                          ],

                        ),

                      ],)
                  ],)
              ),
            ],
          ),

        ),
      ),
    );
  }
}