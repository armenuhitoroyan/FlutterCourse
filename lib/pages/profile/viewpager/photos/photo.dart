import 'package:flutter/material.dart';

import '../../../../models/img_model.dart';

Widget photoListBuild(Photo photo) {
  return Container(
    height: 450,
    width: double.infinity,
    // ignore: prefer_const_constructors
    decoration: BoxDecoration(
      // ignore: prefer_const_constructors
      image: DecorationImage(
        // ignore: prefer_const_constructors
        image: NetworkImage(
            // '${value.photos?[index].src!.medium}',
            '${photo.src!.medium}'),
        fit: BoxFit.cover,
      ),
    ),
  );
}
