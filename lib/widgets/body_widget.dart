// ignore_for_file: sort_child_properties_last

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'container_card_widget.dart';

class HomeBodyW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return bodyHomePage();
  }

  Widget bodyHomePage() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ContainerCardW(),
          Expanded( child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: ReusableCardW(iconData: Icons.smoke_free, text: 'Some Text',),
                  ),
                ),
              ],
            ),
          ),    
          ),
          ContainerCardW(),
          ContainerCardW(),
          SizedBox(
            height: 50.0,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Click'),
              style: ElevatedButton.styleFrom(
                backgroundColor: kBottomContainerColor,
                fixedSize: const Size(400, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
            ),
          )
        ],
      ); 
  }
  
}