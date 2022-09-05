import 'package:shop/widgets/reusable_card_widget.dart';
import 'package:flutter/material.dart';

class ContainerCardWidget extends StatelessWidget {
  static String page = '';

  const ContainerCardWidget({super.key});
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
                child: ReusableCardWidget(iconData: Icons.supervised_user_circle_sharp, text: 'People',),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: ReusableCardWidget(iconData: Icons.production_quantity_limits, text: 'Products',),
              ),
            ),
          ],
        ),
    ),);
  } 
}