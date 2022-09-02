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
      body: GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.red[100],
      child: const Text("He'd have you all unravel at the"),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.red[200],
      child: const Text('Heed not the rabble'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.red[300],
      child: const Text('Sound of screams but the'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.red[400],
      child: const Text('Who scream'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.red[500],
      child: const Text('Revolution is coming...'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.red[600],
      child: const Text('Revolution, they...'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.red[700],
      child: const Text('Revolution is coming...'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.red[800],
      child: const Text('Revolution, they...'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.red[900],
      child: const Text('Revolution, they...'),
    ),
  ],
)
    );
  }
  
}