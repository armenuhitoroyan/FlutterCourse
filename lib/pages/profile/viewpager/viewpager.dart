import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_project/pages/profile/viewpager/photos/photos.dart';
import 'package:team_project/pages/profile/viewpager/photos/photos_provider.dart';
import 'package:team_project/pages/profile/viewpager/videos/videos.dart';

class ViewPager extends StatefulWidget {
  @override
  State<ViewPager> createState() => _ViewPagerState();
}

class _ViewPagerState extends State<ViewPager> {
  // ignore: prefer_final_fields
  PageController _controller = PageController(
    initialPage: 0,
    // viewportFraction: 0.8
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: ChangeNotifierProvider(
        create: (context) => PhotosProvider(),
        child: Container(
          margin: const EdgeInsets.symmetric(),
          child: PageView(
            controller: _controller,
            children: [Photos(), Videos()],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.greenAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera,
            ),
            label: 'Camera',  
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_camera_front_outlined,
            ),
            label: 'Video',
          ),
        ],
      ),
    );
  }
}
