import 'package:exam_at/pages/homepage/quiz/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => QuizProvider(),
        child: Consumer<QuizProvider>(
          builder: (context, value, child) => value.isLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              // ignore: avoid_unnecessary_containers
              : Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 102, 0, 0.8),
                    border: Border.all(
                      color: Colors.grey,
                      width: 5,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Get Ready',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
