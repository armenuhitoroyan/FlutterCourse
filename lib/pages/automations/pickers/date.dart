import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text('Date'),
      ),
    );
  }
}
