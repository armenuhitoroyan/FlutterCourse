import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class Raitingbar  extends StatelessWidget{
  const Raitingbar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ratingBar ();
  }

  Widget ratingBar () {
    return RatingBar.builder( //
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
      // ignore: prefer_const_constructors
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
      itemSize: 15,
    );
  }
  
}