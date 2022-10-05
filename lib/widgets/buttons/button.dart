import 'package:flutter/material.dart';

import '../../base/routes.dart';

class RadButton extends StatelessWidget {
  String page;
  String textBtn;
  Color btnColor;
  RadButton({super.key, required this.page, required this.textBtn, required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
      ),
      child: SizedBox(
        width: 170,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, page);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: btnColor,
              foregroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              )),
          child: Text('$textBtn'),
        ),
      ),
    );
  }
}
