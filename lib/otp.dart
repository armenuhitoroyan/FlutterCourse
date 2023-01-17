import 'package:flutter/material.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController controller = TextEditingController();
  String pin = '1';
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Colors.black12)),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    textFieldOTP(true, false, context),
                    textFieldOTP(false, false, context),
                    textFieldOTP(false, false, context),
                    textFieldOTP(false, true, context),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (pin == '1111' && index == 4) {
                        print('The peration completed successfully!');
                        pin = '1';
                        index = 1;
                        print(pin);
                      } else {
                        print('The peration failed!');
                        pin = '1';
                        index = 1;
                        print(pin);
                      }

                      Navigator.pop(context);
                    },
                    child: const Text('Verify')),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textFieldOTP(bool first, last, BuildContext context) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
          // controller: controller,
          autofocus: true,
          onChanged: (value) {
            print(value);
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
              if (value == '1') {
                pin.length < 4 ? pin += value.characters.toString() : pin;
                index++;
              } else {
                pin = pin.replaceAll(value, '');
                index--;
              }
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
              if (value == '1') {
                pin.length < 4 ? pin += value.characters.toString() : pin;
                index++;
              } else {
                pin = pin.replaceAll(value, '');
                index--;
              }
            }

            //  if (value.length == 1 && last == true) {
            //   FocusScope.of(context).previousFocus();
            //   if (value.characters.toString() == '1') {
            //     pin.length < 4 ? pin += value.characters.toString() : pin;
            //   }
            // }
            // pin += controller.text;

            print(pin);
            print(index);
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.black12),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.blue),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
