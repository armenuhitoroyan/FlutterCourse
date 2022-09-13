import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return showDialog();
  }

  Widget showDialog() {
    // ignore: prefer_const_constructors
    return AlertDialog(
      icon: const Icon(Icons.comment),
      backgroundColor: Colors.indigo,
      // ignore: prefer_const_constructors
      title: Text('Դուք հավաքել եք 1 միավոր'),
      titlePadding: const EdgeInsets.all(10),
      iconColor: Colors.white,
    );
  }
}