import 'package:flutter/material.dart';
import 'package:indigo/pages/feedback/result_view.dart';
import 'package:provider/provider.dart';

import '../../base/controllers/feedback_provider.dart';
import 'build_questions.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => FeedBackProvider()),
      child: Scaffold(
        backgroundColor: Colors.indigo.shade100,
        appBar: AppBar(
          title: const Text('QUESTIONS'),
        ),
        body: Consumer<FeedBackProvider>(
          builder: ((context, value, child) {
            if (value.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return value.showResult
                ? ResultViewQuestions()
                : _buildContent(value);
            }
          }),
        ),
      ),
    );
  }

  Widget _buildContent(feedbackProvider) {
    return Column(
      children: [
        LinearProgressIndicator(
          color: Colors.indigoAccent[100],
          value: (feedbackProvider.currentQuestionIndex + 1) /
              (feedbackProvider.questionsData.length),
        ),
        Expanded(
          child: PageView.builder(
            onPageChanged: ((value) => feedbackProvider.onChangeIndex(value)),
            itemBuilder: (context, index) {
              return BuildQuestions(feedbackProvider.questionsData[index]);
            },
            itemCount: feedbackProvider.questionsData.length,
            scrollDirection: Axis.horizontal,
            controller: feedbackProvider.pageController,
          ),
        ),
      ],
    );
  }
}