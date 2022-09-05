import 'package:flutter/material.dart';
import 'package:shop/base/routes.dart';

import '../../styles/login_styles.dart';
import '../../styles/style.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late TextEditingController _controller;

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
        child: Column(
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
        children: const [
          Text(
            'Registration',
            style: TextStyle(
             
            ),
          ),
           SizedBox(height: 25),
          TextField(
            decoration: InputDecoration(  
              border: OutlineInputBorder(),  
              labelText: 'Enter Name',  
              hintText: 'Enter Your Name'  
            ),  
          ),
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(  
              border: OutlineInputBorder(),  
              labelText: 'Enter Lastname',  
              hintText: 'Enter Your Lastname'  
            ),  
          ),
          SizedBox(height: 15),
         TextField(
            decoration: InputDecoration(  
              border: OutlineInputBorder(),  
              labelText: 'Enter Email',  
              hintText: 'Enter Your Email'  
            ),  
          ),
          SizedBox(height: 15),
         TextField(
            decoration: InputDecoration(  
              border: OutlineInputBorder(),  
              labelText: 'Enter Password',  
              hintText: 'Enter Your Password'  
            ),  
          ),
          SizedBox(height: 15),
         TextField(
            decoration: InputDecoration(  
              border: OutlineInputBorder(),  
              labelText: 'Comfirm Password',  
              hintText: 'Enter Your Password'  
            ),  
          ),
        ],
      ),
    );
  }
}
