import 'package:flutter/material.dart';
import 'package:ranger/config/colors.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  TextEditingController address = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Enter Q Info',
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: Center(
        child: SingleChildScrollView(
         child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset('assets/qbacklabel.png'),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextField(
                      controller: address,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(8.0)),
                          label: const Text('MAC Address'),
                          helperText: 'Enter last 6 characters 4827589XXXXXX'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextField(
                      // obscureText: true,
                      controller: pinCode,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(8.0)),
                          labelText: 'PIN',
                          helperText: 'XXX-XXXX-XXX'
                          // focusColor: Colors.black
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: RangerColors.blueBtn),
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      'If you are having trouble getting set up, please '),
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
    );
  }
}
