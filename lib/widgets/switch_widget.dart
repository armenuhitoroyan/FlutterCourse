
import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
class _State extends State<SwitchWidget> {
  bool isSwitched = false;
 
  @override
  Widget build(BuildContext context) {
    return 
         Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                print(isSwitched);
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          );
  
  }
}