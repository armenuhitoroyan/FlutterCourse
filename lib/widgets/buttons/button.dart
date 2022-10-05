import 'package:flutter/material.dart';

import '../../base/routes.dart';

class RadButton extends StatelessWidget {
  String page;
  String textBtn;
  RadButton({super.key, required this.page, required this.textBtn});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, page);
        },
        child: Text('$textBtn'),
      ),
    );
  }
}
