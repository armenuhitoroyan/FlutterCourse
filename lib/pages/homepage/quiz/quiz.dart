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
            : ListView.builder(
            itemCount: value.questions!.length,
            itemBuilder: (context, index) => 
              Container(
              child: Text('${value.questions![index].questionText}'),
            ),
          ),
        ),
      ),
    );
  }
}
