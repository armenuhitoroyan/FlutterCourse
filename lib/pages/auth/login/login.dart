import 'package:exam_at/base/routes.dart';
import 'package:flutter/material.dart';

import '../../../widgets/buttons/button.dart';
import '../../../widgets/buttons/text_button.dart';

class LoginPage extends StatelessWidget {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
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
                controller: usernameCtrl,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: true
                        ? const Icon(
                            Icons.visibility,
                          )
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
                  checkColor: Colors.white,
                  // fillColor: MaterialStateProperty.resolveWith(Colors.blue),
                  value: isChecked,
                  onChanged: (bool? value) {
                    isChecked = value!;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Remember password'),
                )
              ],
            ),
            RadButton(
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
    );
  }
}
