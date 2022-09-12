import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: Container(
        child: ElevatedButton(
          child: Text('Sign In Anon'),
          onPressed: () async {
            dynamic result = _auth.signInAnon();
            if (result == null) {
              print('Error signing in');
            } else {
              print('Signed in');
              return result;
            }
          } ,
        ),
      ),
    );
  }
}