import 'package:flutter/material.dart';
import 'package:team_project/pages/profile/viewpager/photos/photos.dart';
import 'package:team_project/pages/profile/viewpager/videos/videos.dart';

class ViewPager extends StatefulWidget {
  @override
  State<ViewPager> createState() => _ViewPagerState();
}

class _ViewPagerState extends State<ViewPager> {
  // ignore: prefer_final_fields
  PageController _controller = PageController(
    initialPage: 0,
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
      body: Container(
        margin: const EdgeInsets.symmetric(),
        child: PageView(
          controller: _controller,
          children: [Photos(), Videos()],
        ),
      ),
    );
  }
}
