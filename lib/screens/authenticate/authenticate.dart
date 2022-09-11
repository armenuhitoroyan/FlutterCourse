import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthenticateWidget extends StatefulWidget {
  const AuthenticateWidget({super.key});

  @override
  State<AuthenticateWidget> createState() => _AuthenticateWidgetState();
}

class _AuthenticateWidgetState extends State<AuthenticateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Authenticate page'),
    );
  }
}