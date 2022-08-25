import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
    // String text;

  const CardWidget({Key? key,
    //  required this.text,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text = card_w();
    return flex_container();
  }

  
}

// ignore: non_constant_identifier_names
Widget card_w() {
  // ignore: prefer_const_constructors
  return Container(
      height: 175,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.red,
    )
  );
}

// ignore: non_constant_identifier_names
Widget flex_container() {
  return Row(
      // ignore: sort_child_properties_last
    children: <Widget>[
      Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: card_w() //Container
      ), //Flexible
          // ignore: prefer_const_constructors
      SizedBox(
        width: 20,
      ), //SizedBox
      Flexible(
        flex: 1,
        fit: FlexFit.loose,
        child: card_w(), //Container
      ) //Flexible
    ], //<Widget>[]
    mainAxisAlignment: MainAxisAlignment.center,
  );
}