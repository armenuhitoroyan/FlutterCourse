import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  String title;
  ShowDialog({super.key, required this.title});


  @override
  Widget build(BuildContext context) {
    
    return _dialog(context, title: title);
  }

  Widget _dialog(
    context, {
    required String title,
    String? content,
  }) {
    return AlertDialog(
      title: Text(title),
      content: Text(content ?? 'Some of the credentials are empty'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
