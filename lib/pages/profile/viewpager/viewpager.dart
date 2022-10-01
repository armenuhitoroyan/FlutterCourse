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
  
  );
  // TabController _controllerTab = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 15,
          // ignore: prefer_const_constructors
          bottom: TabBar(
            indicatorColor: Colors.deepPurple,
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              const Tab(
                icon: Icon(Icons.camera_rear_outlined),
              ),
              const Tab(
                icon: Icon(Icons.video_call_outlined),
              ),
            ],
          ),
        ),
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
      ),
    );
  }
}
