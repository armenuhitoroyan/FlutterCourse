import 'package:exam_at/base/routes.dart';
import 'package:flutter/cupertino.dart';
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
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // Expanded(
              //   child: Image.asset(
              //     'assets/Asset 16 1.png',
              //     height: 100,
              //   ),
              // ),

              ElevatedButton(
                onPressed: () {},
                child: const Text('213 x 157'),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: usernameCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
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
              RadButton(page: AppRoutes.pages, textBtn: 'Login',),
              TextBtn(textBtn: 'Forget Passsword',), 
              TextBtn(textBtn: 'Sign up',)
            ],
          ),
        ),
      ),
    );
  }
}
