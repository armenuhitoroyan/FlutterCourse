import 'package:flutter/material.dart';
import 'package:team_project/models/img_model.dart';
import 'package:team_project/pages/profile/viewpager/viewpager.dart';

class ProfilePage extends StatefulWidget {
  final Photo photo;
  // ignore: prefer_const_constructors_in_immutables
  ProfilePage({super.key, required this.photo});

  @override
  State<ProfilePage> createState() => _ProfilePageState(photo: photo);
}

class _ProfilePageState extends State<ProfilePage> {
  Photo photo;
  _ProfilePageState({required this.photo});

  @override
  Widget build(BuildContext context) {
    print(photo.photographer);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Profile'),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
        child: Center(
            // ignore: avoid_unnecessary_containers
            child: Column(children: [
          Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 48, // Image radius
                          backgroundImage:
                            NetworkImage('${photo.src?.medium}'),
                        ),
                        // ignore: avoid_unnecessary_containers
                       Expanded(
                         child: Container(
                          height: 100,
                          child: SizedBox(
                            width: double.maxFinite,
                            child: Center(
                              child: Text(
                                '${photo.photographer}',
                              ),
                            ),
                          ),
                         ),
                       )
                      ],
                    ),
                  ),

                  // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
                  Container(
                    height: 500,
                    // ignore: prefer_const_constructors
                    child: Expanded(child: ViewPager()),
                  )
                ],
              ),
            ],
          ),
        ])),
      ),
    );
  }
}
