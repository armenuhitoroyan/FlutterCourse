import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage  extends StatelessWidget{
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold();
  }

  Widget scaffold() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second page'),
      ),
      // ignore: prefer_const_constructors
      body: Center(
        child: const Text('Second Page'),
      ),
    );
  }
  
}