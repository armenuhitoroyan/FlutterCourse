import 'package:flutter/material.dart';
import 'package:indigo/base/routes.dart';
import 'package:indigo/pages/feedback/result_view.dart';
import 'package:provider/provider.dart';

import '../../base/controllers/feedback_provider.dart';
import '../../models/feedback/feedback_model.dart';

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
              return _buildQuestion(context, feedbackProvider.questionsData[index]);
            },
            itemCount: feedbackProvider.questionsData.length,
            scrollDirection: Axis.horizontal,
            controller: feedbackProvider.pageController,
          ),
        ),
      ],
    );
  }

  Widget _buildQuestion(BuildContext context, Question questionData) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questionData.questionText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: questionData.answers
                .map<Widget>(
                  (a) => _answerOption(a),
                )
                .toList(),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _answerOption(
    Answer answerData,
  ) {
    return Consumer<FeedBackProvider>(
      builder: (
        (context, provider, child) {
          return SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                provider.answerPressed(answerData.answerId);
              },
              child: Text(answerData.answerText),
            ),
          );
        }
      ),
    );
  }

}
