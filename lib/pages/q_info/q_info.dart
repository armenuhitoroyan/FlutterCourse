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
              color: RangerColors.black, ),
        )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: BlocBuilder<QrInfoBloc, QInfoValidState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset('assets/qbacklabel.png'),
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
                                QInfoTextChangedEvent(addressController.text, pinCodeController.text));
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              label: const Text('MAC Address'),
                              helperText:
                                  'Enter last 6 characters 4827589XXXXXX',
                              errorText: 
                                   state.errorMessage,
                              errorStyle: TextStyle(
                                color: state.isValid
                                  ? RangerColors.blueBtn
                                  : RangerColors.errorColor,
                              ),
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
                                QInfoTextChangedEvent(addressController.text, pinCodeController.text));
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            labelText: 'PIN',
                            suffixIcon: const Icon(Icons.cancel_outlined),
                            helperText: 'XXX-XXXX-XXX',
                            errorText: state.errorMessage,
                            errorStyle: TextStyle(
                              color: state.isValid
                                  ? RangerColors.blueBtn
                                  : RangerColors.errorColor,
                            ),
                            focusedErrorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
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
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<QrInfoBloc>(context).add(
                              QInfoTextChangedEvent(addressController.text,
                                  pinCodeController.text));
                          state.isValid == true
                              ? Navigator.pushNamed(context, AppRoutes.device)
                              : null;

                          // BlocProvider.of<InfoBloc>(context)
                          //     .add(SubmitEvent(macController.text, pinController.text));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: state.isValid
                                ? RangerColors.blueBtn
                                : RangerColors.greyBottomBar),
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(color: RangerColors.white),
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
    );
  }
}
