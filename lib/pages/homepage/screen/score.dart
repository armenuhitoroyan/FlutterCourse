
import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({super.key});

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
                      'Score',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('''
                      If you answer all the questions 
                      in less than 60 seconds, then 
                      your remaining time is a 
                      multiplier against your 
                      question points. But be careful: 
                      wrong answers decrease your 
                      time multiplier.'''),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 230,
                        child: Image.asset(
                          'assets/group4540.png',
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
