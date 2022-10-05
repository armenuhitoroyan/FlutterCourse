
import 'package:flutter/material.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      'Leaderboard',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.yellow
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('''
                      Your best score during each 24 
                      hour game period will appear 
                      on the Leaderboard. The 
                      highest eligible score each day 
                      will be the winner of the cash 
                      prize. Each day's prize pool will 
                      increase \$0.01 for each game 
                      played, but we will guarantee 
                      the first \$100.00.'''),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                       child: SizedBox(
                          height: 230,
                            child: Image.asset(
                              'assets/group4541.png',
                              fit: BoxFit.cover,
                            ),
                        ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
