import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ranger/base/routes.dart';
import 'package:ranger/config/app_style.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/pages/info/bloc/info_bloc.dart';

class Information extends StatelessWidget {
  AppStyle appStyle = AppStyle();
  Information({super.key});

  TextEditingController address = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfoBloc()
        ..add(InformationEvent(address = address, pinCode = pinCode)),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Enter Q Info',
            style:
                TextStyle(color: Colors.black, backgroundColor: Colors.white),
          )),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: BlocBuilder<InfoBloc, InfoState>(
              builder: (context, state) {
                return Column(
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
                            controller: state.address,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              label: const Text('MAC Address'),
                              helperText:
                                  'Enter last 6 characters 4827589XXXXXX',
                            ),
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
                            controller: state.pinCode,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
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
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.devices);
                          },
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
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
