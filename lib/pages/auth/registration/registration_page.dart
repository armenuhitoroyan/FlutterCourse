import 'package:flutter/material.dart';
import 'package:shop/base/routes.dart';

import '../../../styles/login_styles.dart';
import '../../../styles/style.dart';
import '../../../widgets/form_widget.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late TextEditingController _controller;
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
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
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kBG,
            centerTitle: true,
            title: const Text('', style: kBodyTextStyle),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _fields(context),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                 // ignore: avoid_print
                 print('Finally');
                 Navigator.pushReplacementNamed(context, AppRoutes.login);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBG
                ),
                child: const Text(
                  'Registration',
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
            'Registration',
            style: TextStyle(
             
            ),
          ),
          const SizedBox(height: 25),
          FormWidget(controller: nameCtrl, labelText: 'Enter Name',  hintText: 'Enter Your Name',),
          const SizedBox(height: 15),
          FormWidget(controller: lastNameCtrl, labelText: 'Enter Lastname',  hintText: 'Enter Your Lastname',),
          const SizedBox(height: 15),
          FormWidget(controller: usernameCtrl, labelText: 'Enter Email',  hintText: 'Enter Your Email',),
          const SizedBox(height: 15),
          FormWidget(controller: passwordCtrl, labelText: 'Enter Password',  hintText: 'Enter Your Password',),
          const SizedBox(height: 15),
          FormWidget(controller: passwordCtrl, labelText: 'Comfirm Password',  hintText: 'Comfirm Your Password',),
        ],
      ),
    );
  }
}
