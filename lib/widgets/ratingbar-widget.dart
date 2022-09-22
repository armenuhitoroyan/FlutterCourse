import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class Raitingbar  extends StatelessWidget{
  int count;
  Color color;
  IconData icon;

  Raitingbar(this.count, this.color, this.icon);

   
  
  @override
  Widget build(BuildContext context) {
    return ratingBar (count, color, icon);
  }

  Widget ratingBar (int count, Color color, IconData icon) {
    return RatingBar.builder( //
      initialRating: 0.0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: count,
      itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
      // ignore: prefer_const_constructors
      itemBuilder: (context, _) => Icon(
        icon,
        color: color,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
      itemSize: 15,
    );
  }
  
}