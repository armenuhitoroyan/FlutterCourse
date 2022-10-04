import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_project/pages/profile/viewpager/photos/photos_provider.dart';

class Photos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Consumer<PhotosProvider>(
        builder: (context, value, child) =>
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: value.photos?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                height: 450,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      '${value.photos?[index].src!.medium}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
