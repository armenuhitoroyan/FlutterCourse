import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop/base/firebase/connectbase.dart';
import 'package:shop/base/routes.dart';

import '../../../base/reg_exp.dart';
import '../../../styles/login_styles.dart';
import '../../../styles/style.dart';
import '../../../widgets/form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  {
  late TextEditingController _controller;
  bool showPassword = false;
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();


void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }


  @override
  void initState() {
    super.initState();
    initFirebase();
    
    _controller = TextEditingController();

  }

   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _buildBody(context),
      backgroundColor: LoginStyles.cLogin.withOpacity(0.5),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      // color: LoginStyles.cLogin.withOpacity(0.1),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBG,
          centerTitle: true,
          title: const Text('', style: kBodyTextStyle),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _fields(context),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                 // ignore: avoid_print
                 print('Log In');
                _onLogin(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBG
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                  ),
                ),
                
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _fields(BuildContext context) {
     return Container(
      // color: LoginStyles.cLogin.withOpacity(0.8),
      decoration: BoxDecoration(
        color: kBG,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      padding: const EdgeInsets.only(
        right: 25,
        left: 25,
        top: 40,
        bottom: 50,
      ),
      child: Column(
        children: [
          const Text(
            'Log In',
            style: TextStyle(
             
            ),
          ),
          const SizedBox(height: 25),
          FormWidget(controller: usernameCtrl, labelText: 'Enter Email',  hintText: 'Enter Your Email', ),
          const SizedBox(height: 15),
          FormWidget(controller: passwordCtrl, labelText: 'Enter Password',  hintText: 'Enter Your Password',),
        ],
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
          child: const Text('OK'),
        ),
      ],
    );
  }

    void _onLogin(context) {
    final regExp = RegExp(RegularExpressions.email);

    Navigator.of(context).pushReplacementNamed(AppRoutes.settings);

    return;
   
    if (usernameCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty) {
      if (regExp.hasMatch(usernameCtrl.text)) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.settings);
      } else {
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
        showDialog(
          context: context,
          builder: (context) {
            return _dialog(
              context,
              title: 'Error',
              content: 'Username is invalid',
            );
          },
        );
      }
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      showDialog(
        context: context,
        builder: (context) {
          return _dialog(
            context,
            title: 'Error',
            content: 'Some of the credentials are empty',
          );
        },
      );
    }
  }


}
