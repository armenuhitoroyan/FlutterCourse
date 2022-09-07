
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class FormWidget extends StatefulWidget {
  String labelText;
  String hintText;
  TextEditingController controller;

  FormWidget({super.key, required this.labelText, required this.hintText, required this.controller});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return widget.labelText != 'Enter Password' ? textFieldWidget(widget.controller, widget.labelText,  widget.hintText) 
    : textFieldPassWidget(widget.controller, widget.labelText,  widget.hintText);
  }

  // ignore: non_constant_identifier_names
  Widget textFieldWidget(TextEditingController _controller, String labelText, String hintText) {
    return  TextField(
      controller: _controller,
      decoration: InputDecoration(  
        border: const OutlineInputBorder(),  
        labelText: labelText,  
        hintText: hintText  
      ),  
    );
  }

  Widget textFieldPassWidget(TextEditingController _controller, String labelText, String hintText) {
    return  TextField(
      controller: _controller,
      obscureText: !showPassword,
      decoration: InputDecoration(  
        border: const OutlineInputBorder(),  
        labelText: labelText,  
        hintText: hintText  
      ),  
    );
  }

   void _onShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }
}