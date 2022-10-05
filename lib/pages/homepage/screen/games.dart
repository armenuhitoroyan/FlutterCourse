
import 'package:flutter/material.dart';

class Games extends StatelessWidget {
  const Games({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  const Text(
                    'Play Game',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.green
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(30),
                    child: Text('''
                    You will receive 5 free plays a day 
                    and you can purchase additional 
                    plays that never expire. 
                    Questions are progressive, 
                    increasing in difficulty and value 
                    from easy to hard and 1 to 10 
                    points.'''),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset('assets/Asset 16 1.png'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
