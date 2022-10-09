import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/auth/login/login_provider.dart';

class RadButton extends StatelessWidget {
  String page;
  String textBtn;
  Color btnColor;
  bool click;
  LoginProvider loginProvider = LoginProvider();
  BuildContext context;

  RadButton(
      {super.key,
      required this.click,
      required this.page,
      required this.textBtn,
      required this.btnColor,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
      ),
      child: SizedBox(
        width: 170,
        height: 40,
        child: ElevatedButton(
          onPressed: onLogin,
          // {
          //   // Provider.of<LoginProvider>(context).onLogin();
          //   // if (click == true) {
          //     Navigator.pushNamed(context, page);
          //   // }
          //   print(click);
          // },
          style: ElevatedButton.styleFrom(
            backgroundColor: btnColor,
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          child: Text('$textBtn'),
        ),
      ),
    );
  }

  void onLogin() {
    loginProvider.onLogin();
    // print(loginProvider.isChangePage);
    if (loginProvider.isChangePage == true) {
      // Navigator.pushNamed(context, page);
    }

    Navigator.pushNamed(context, page);
  }
}
