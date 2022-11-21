import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ranger/base/routes.dart';
import 'package:ranger/config/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _data = '';

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
      '#000000',
      'Cansel',
      true,
      ScanMode.BARCODE,
    ).then((value) => setState(
          () => _data = value,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RangerColors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Let\'s get conected!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Image.asset('assets/qbacklabel.png'),
                  SizedBox(
                    height: 20,
                    child: Text(
                      _data,
                      style: const TextStyle(color: RangerColors.blueBtn),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: RangerColors.blueBtn),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              // onPressed: () {
                
                              //   // Navigator.pushNamed(context, AppRoutes.mobScan);
                              // },
                              onPressed: () async => _scan(),
                              icon: const Icon(
                                Icons.photo_camera_rounded,
                                color: RangerColors.white,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                      '"Levven" Would Like to Access the Camera'),
                                  content: const Text('AlertDialog description'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: RangerColors.yellowBtn),
                              child: const Text(
                                'SCAN',
                                style: TextStyle(color: RangerColors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Text('or'),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.info);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: RangerColors.white,
                                border: Border.all(color: RangerColors.blueBtn)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'ENTER MANUALLY',
                                    style: TextStyle(color: RangerColors.blueBtn),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding (
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                            'If you are having trouble getting set up, please '),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('contact us at'),
                          Text(
                            ' support@levven.com',
                            style: TextStyle(color: RangerColors.blueBtn),
                          ),
                        ],
                      )
                    ],
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
