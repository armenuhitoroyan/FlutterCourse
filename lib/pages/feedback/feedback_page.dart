import 'package:flutter/material.dart';
import 'package:indigo/models/feedback/feedback_model.dart';
import 'package:provider/provider.dart';

import '../../base/controllers/feedback_provider.dart';

class FeedBack extends StatelessWidget {
   FeedBack({super.key});

  int currentQuestionIndex = 0;
  PageController pageController = PageController();
  FeedBackProvider fbProvider = FeedBackProvider();


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FeedBackProvider(),
      builder: (context, child) {
      return Consumer<FeedBackProvider>(
        builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.indigo.shade100,
          appBar: AppBar(
            title: const Text('QUESTIONS'),
          ),
          body: value.feedbackData == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : value.showResult
                  ? _resultView()
                  : _buildContent(),
        );}
      );}
    );
  }

  Widget _buildContent() {
    return ChangeNotifierProvider(
      create: (context) => FeedBackProvider(),
      builder: (context, child) {
      return Consumer<FeedBackProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              // ignore: prefer_const_constructors
              LinearProgressIndicator(
                value: (currentQuestionIndex) / (value.questionsData.length),
                color: Colors.red,
              ),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) {
                    currentQuestionIndex = value;

                  },
                  itemBuilder: (context, index) {
                    return _buildQuestion(context, value.questionsData[index]);
                  },
                  itemCount: value.questionsData.length,
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                ),
              ),
            ],
          );
        }
      );
    });
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
                  (a) => _answerOption(
                    a,
                    answerPressed,
                  ),
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
    Function(int) onAnswerPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          currentQuestionIndex += 1;
          print(currentQuestionIndex);
          // fbProvider.onChangeQuestion();
          onAnswerPressed(answerData.answerId);
        },
        child: Text(answerData.answerText),
      ),
    );
  }

  Widget _resultView() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
            color: Colors.indigo.shade400,
            borderRadius: BorderRadius.circular(
              15,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Thank you for your feedback'),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () {},
              child: const Text('Send'),
            )
          ],
        ),
      ),
    );
  }

  void answerPressed(int answerId) {
  
    print(fbProvider.questionsData.length);

    if (currentQuestionIndex == fbProvider.questionsData.length - 1) {
      fbProvider.onChange();
    }
    pageController.animateToPage(currentQuestionIndex,
        curve: Curves.easeInOut, duration: const Duration(milliseconds: 700));
  }

  
}
