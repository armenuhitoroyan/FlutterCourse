import 'package:bmi_calculator/base/routes.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

import 'container_card_widget.dart';

class HomeBodyW extends StatelessWidget {
  const HomeBodyW({super.key});

  @override
  Widget build(BuildContext context) {
   return bodyHomePage(context);
  }

  Widget bodyHomePage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            
            const ContainerCardW(),

            Expanded( child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(   
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: ReusableCardW(iconData: Icons.money_rounded, text: 'It has been ordered',),
                    ),
                  ),
                ],
              ),
            ),    
            ),
            SizedBox(
              height: 50.0,
              child: ElevatedButton(
                 onPressed: () {
                  if (ReusableCardW.isTap) {
                    if (ReusableCardW.page == 'products') {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.products
                      );
                    } else if(ReusableCardW.page == 'users') {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.users
                      );
                    }
                   
                  } else {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.home
                    );
                    Navigator.pop(context);
                  }
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBottomContainerColor,
                  fixedSize: const Size(400, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                child: const Text('Click'),
              ),
            )
          ],
        ),
    ); 
  }
  
}