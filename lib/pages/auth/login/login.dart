import 'package:exam_at/base/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/buttons/button.dart';
import '../../../widgets/buttons/text_button.dart';
import 'login_provider.dart';

class LoginPage extends StatelessWidget {
  // bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer<LoginProvider>(
            builder: (context, value, child) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/asset161.png',
                        height: 100,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: TextField(
                    controller: value.usernameCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Email', //at@gmail.com
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: TextField(
                    controller: value.passwordCtrl,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: true
                            ? const Icon(
                                Icons.visibility,
                              )
                            // ignore: dead_code
                            : const Icon(
                                Icons.visibility_off,
                              ),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: value.isChacked != true
                          ? Colors.white
                          : const Color.fromRGBO(255, 102, 0, 0.8),
                      value: value.isChacked,
                      onChanged: (bool? checked) {
                        value.checkCheckBox();
                        value.isChacked = checked!;
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Remember password'),
                    )
                  ],
                ),
                RadButton(
                  callback: () {
                    value.onLogin();
                    if (value.isChangePage == true) {
                      Navigator.pushNamed(context, AppRoutes.pages);
                    } else {
                      value.showDialog == true
                          ? showDialog(
                              context: context,
                              builder: (context) {
                                return _dialog(
                                  context,
                                  title: 'Error',
                                  content: value.isEmpty == false
                                      ? 'Username is invalid'
                                      : 'Some of the credentials are empty',
                                );
                              })
                          : Container();
                    }
                  },
                  context: context,
                  page: AppRoutes.pages,
                  textBtn: 'Login',
                  btnColor: const Color.fromRGBO(204, 0, 1, 0.8),
                ),
                TextBtn(
                  textBtn: 'Forget Passsword',
                ),
                TextBtn(
                  textBtn: 'Sign up',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dialog(
    context, {
    required String title,
    String? content,
  }) {
    return AlertDialog(
      title: Text(title),
      content: Text(content ?? 'Some of the credentials are empty'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'OK',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
