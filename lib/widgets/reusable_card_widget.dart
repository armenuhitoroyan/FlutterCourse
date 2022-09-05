import 'package:flutter/material.dart';
import '../styles/style.dart';

// ignore: must_be_immutable
class ReusableCardWidget extends StatelessWidget {
   Color? color;
   Widget? child;
   Function? onTap ;
   IconData? iconData;
   double? sizeIconData;
   String? text;
   
    ReusableCardWidget({
      Key? key,
       this.color,
       this.child,
       this.onTap,
       this.iconData,
       this.sizeIconData,
       this.text
    }) : super(key: key);

    static bool isTap = false;
    static String page = '';
  
  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      // ignore: avoid_print
      onTap: () => {
        isTap = true,
        text == 'Products' ? page = 'products' : page,
        text == 'People' ? page = 'users' : page,
      },
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