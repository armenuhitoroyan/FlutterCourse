import 'package:flutter/material.dart';
import 'package:ranger/config/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RangerColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Let\'s get conected!',
              style: Theme.of(context).textTheme.headline4,
            ),
            Image.asset('qbacklabel.png'),
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
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            
                            backgroundColor: RangerColors.yellowBtn
                          ),
                          child: const Text(
                            'SCAN',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            const Text('or'),
            SizedBox(
              width: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
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
                  )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('If you are having trouble getting set up, please '),
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
    );
  }
}
