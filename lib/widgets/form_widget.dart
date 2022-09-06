import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class FormWidget extends StatelessWidget {
  String labelText;
  String hintText;
   FormWidget({super.key, required this.labelText, required this.hintText});
  
  @override
  Widget build(BuildContext context) {
    return textFieldWidget(labelText,  hintText);
  }

  // ignore: non_constant_identifier_names
  Widget textFieldWidget(String labelText, String hintText) {
    return  TextField(
      decoration: InputDecoration(  
        border: const OutlineInputBorder(),  
        labelText: labelText,  
        hintText: hintText  
      ),  
    );
  }
  
}