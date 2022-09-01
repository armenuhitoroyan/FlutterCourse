
import 'package:bmi_calculator/widgets/icon_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class ReusableCardW extends StatelessWidget {
   Color? color;
   Widget? child;
   Function? onTap ;
   IconData? iconData;
   double? sizeIconData;
   String? text;
   
    ReusableCardW({
      Key? key,
       this.color,
       this.child,
       this.onTap,
       this.iconData,
       this.sizeIconData,
       this.text
    }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // print(FontAwesomeIcons.mars.runtimeType);
    return GestureDetector(
      // ignore: avoid_print
      onTap: () => print('On Tap!'),
      child:  Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: kActivateCardColor,
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        height: 150,
          child: Column(
            children: [
              Icon(iconData),
              Text('$text', style: kBodyTextStyle,)
            ],
          ),
      ),
    );
  } 

}