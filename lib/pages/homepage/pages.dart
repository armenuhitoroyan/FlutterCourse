import 'package:exam_at/pages/homepage/screen/clime_prize.dart';
import 'package:exam_at/pages/homepage/screen/games.dart';
import 'package:exam_at/pages/homepage/screen/leaderboard.dart';
import 'package:exam_at/pages/homepage/screen/score.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Pages extends StatefulWidget {
  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  List<Widget> pages = const [Games(), Score(), LeaderBoard(), ClimePrize()];

  bool _isVisible = true;
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
    int i = 0;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // ignore: avoid_unnecessary_containers
        body: Container(
          margin: const EdgeInsets.symmetric(),
          child: Stack(
            children: [
              // PageView(
              //   controller: _controller,
              //   children: pages,
              // ),
              PageView.builder(
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  i = index;
                  print(i);
                  if (i == pages.length - 1) {
                    _isVisible = false; 
                  }
                  return pages[index];
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Visibility(
                  visible: _isVisible,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: pages.length,
                      effect: ExpandingDotsEffect(
                          activeDotColor: const Color.fromRGBO(204, 0, 1, 0.8),
                          dotColor: Colors.red.shade100,
                          dotWidth: 30,
                          dotHeight: 30),
                      onDotClicked: (index) {
                        i = index;
                        if (i == index) {
                          print('$i');
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
