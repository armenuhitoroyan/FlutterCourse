import 'package:appemails/base/routes.dart';
import 'package:appemails/otp.dart';
import 'package:appemails/shared_preferences/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({Key? key}) : super(key: key);

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SharedPreferencesProvider(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('SharedPreferences Demo'),
          ),
          body: Consumer<SharedPreferencesProvider>(
            builder: (context, value, child) => Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  // value.textFieldOTP(true, false),
                  // TextField(
                  //   controller: value.controller,
                  //   decoration: const InputDecoration(
                  //     border: OutlineInputBorder(),
                  //     labelText: 'Email',
                  //     hintText: 'Enter Email',
                  //   ),
                  // ),
                  SizedBox(
                    width: 700,
                    child: TextField(
                      controller: value.controller,
                      showCursor: true,
                      decoration: const InputDecoration(
                        // border: OutlineInputBorder(),
                        border: InputBorder.none,
                        labelText: '',
                        hintText: 'Enter Email',
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.listEmails.length,
                      itemBuilder: (context, index) =>
                          Text(value.listEmails[index]),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print(value.controller.text);
                        // value.check_if_already_login();
                        value.onValidateEmail();
                        // MaterialPageRoute(builder: (context) => OTP());
                      },
                      child: const Text('Save'),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print(value.listEmails.asMap());
                        value.retrieve();
                      },
                      child: const Text('Retrieve'),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print(value.email);
                        value.delete();
                      },
                      child: const Text('Delete'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.otpState);
                        },
                        child: const Text(
                          'Verify',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black38),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
