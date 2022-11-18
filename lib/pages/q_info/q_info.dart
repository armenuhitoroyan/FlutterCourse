import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ranger/base/routes.dart';
import 'package:ranger/config/app_style.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/pages/q_info/bloc/q_info_bloc.dart';

class Information extends StatelessWidget {
  AppStyle appStyle = AppStyle();
  Information({super.key});

  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RangerColors.white,
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Enter Q Info',
          style: TextStyle(
              color: RangerColors.black, backgroundColor: RangerColors.white),
        )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child:
              // BlocBuilder<QrInfoBloc, QrInfoState>(
              //   builder: (context, state) {
              //     return
              Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset('assets/qbacklabel.png'),
              BlocBuilder<QrInfoBloc, QrInfoState>(
                builder: (context, state) {
                  if (state is QrInfoErrorState) {
                    return Text(
                      state.errorMessage,
                      style: const TextStyle(color: RangerColors.error),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextField(
                      controller: addressController,
                      onChanged: (value) {
                        BlocProvider.of<QrInfoBloc>(context).add(
                            QrInfoTextChangedEvent(addressController.text,
                                pinCodeController.text));
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          label: const Text('MAC Address'),
                          helperText: 'Enter last 6 characters 4827589XXXXXX',
                          // errorText: 'Field must not be empty',
                          // errorStyle: const TextStyle(
                          //   color: Colors.red
                          // ),
                          suffixIcon: const Icon(Icons.cancel_outlined)),
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
                      controller: pinCodeController,
                      onChanged: (value) {
                        BlocProvider.of<QrInfoBloc>(context).add(
                            QrInfoTextChangedEvent(addressController.text,
                                pinCodeController.text));
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'PIN',
                        suffixIcon: const Icon(Icons.cancel_outlined),
                        helperText: 'XXX-XXXX-XXX',
                        // errorText: 'Field must not be empty',
                        // errorStyle: const TextStyle(
                        //   color: Colors.red
                        // ),

                        // focusColor: RangerColors.black
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
                  child: BlocBuilder<QrInfoBloc, QrInfoState>(
                    builder: (context, state) {
                      if (state is QrInfoLoadingState) {
                        return CircularProgressIndicator();
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (state is QrInfoValidState) {
                            BlocProvider.of<QrInfoBloc>(context).add(
                                QrInfoSubmittedEvent(addressController.text,
                                    pinCodeController.text));
                            Navigator.pushNamed(context, AppRoutes.devices);
                          }

                          // BlocProvider.of<InfoBloc>(context)
                          //     .add(SubmitEvent(macController.text, pinController.text));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: (state is QrInfoValidState)
                                ? RangerColors.blueBtn
                                : RangerColors.greyBottomBar),
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(color: RangerColors.white),
                        ),
                      );
                    },
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
          ),
          //   },
          // ),
        ),
      ),
    );
  }
}
