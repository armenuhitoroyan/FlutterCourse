import 'package:flutter/material.dart';
//import 'package:flutter/lib/src/painting/box_border.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings UI',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(
        title: 'Settings UI',
      ),
    );
  }
}

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
                   Row(children: const [
                     Text(
                       'Common',
                       style: TextStyle(
                           color: Colors.deepOrange,
                           fontWeight: FontWeight.bold,
                           fontSize: 22
                       ),
                     )
                   ]),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       Container(
                         margin: const EdgeInsets.only(bottom: 10),
                         child:
                         const Icon(
                           Icons.language,
                           size: 30,
                           color: Colors.grey,
                         ),
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
                Column(children: [
                  Row(children: const [Text('1'), Text('2'), Text('3')],),
                ],
                ),
                Column(children: [
                  Row(children: const [Text('1'), Text('2'), Text('3')],)
                ],),
                Column(children: [
                  Row(children: const [Text('1'), Text('2'), Text('3')],)
                ],),
              ],
            ),

        ),
      ),
    );
  }
}