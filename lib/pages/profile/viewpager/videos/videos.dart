import 'package:flutter/material.dart';

class Videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: const Center(
        child: Icon(
          Icons.video_camera_front_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
