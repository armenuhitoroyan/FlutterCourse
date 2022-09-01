
import 'package:bmi_calculator/widgets/icon_widget.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class ContainerCardW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return cardWidget();
  }

  Widget cardWidget() {
    return Expanded( child: Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: ReusableCardW(iconData: Icons.male, text: 'Male',),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                     padding: const EdgeInsets.only(left: 5, right: 5),
                      child: ReusableCardW(iconData: Icons.female,text: 'Female',),
                    ),
                  ),
                ],
              ),
            ),   
          );
  } 
}