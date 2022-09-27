import 'package:flutter/material.dart';
import 'package:indigo/base/routes.dart';
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
          return Consumer<FeedBackProvider>(builder: (context, value, child) {
            return Scaffold(
              backgroundColor: Colors.indigo.shade100,
              appBar: AppBar(
                title: const Text('QUESTIONS'),
              ),
              body: value.feedbackData == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _buildContent(),
            );
          });
        });
  }

  Widget _buildContent() {
    return ChangeNotifierProvider(
        create: (context) => FeedBackProvider(),
        builder: (context, child) {
          return Consumer<FeedBackProvider>(builder: (context, value, child) {
            return Column(
              children: [
                // ignore: prefer_const_constructors
                // LinearProgressIndicator(
                //   value: (currentQuestionIndex = currentQuestionIndex + 1) / (value.questionsData.length),
                //   color: Colors.red,
                // ),
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      print('value => $value');
                      currentQuestionIndex = value;
                      print('currentQuestionIndex => $currentQuestionIndex');
                      print('showData => ${fbProvider.showResult}');
                    },
                    itemBuilder: (context, index) {
                      return _buildQuestion(
                          context, value.questionsData[index]);
                    },
                    itemCount: value.questionsData.length,
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                  ),
                ),
              ],
            );
          });
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
                    context,
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
    BuildContext context,
    Answer answerData,
    Function(int) onAnswerPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          print('questionIndex = $currentQuestionIndex');
          onAnswerPressed(answerData.answerId);

          if (fbProvider.showResult) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => _resultView(context)));
          }
        },
        child: Text(answerData.answerText),
      ),
    );
  }

  Widget _resultView(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                'Thank you for your feedback',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),
              ),
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.homepage);
              },
              child: const Text('Send'),
            )
          ],
        ),
      ),
    );
  }

  void answerPressed(int answerId) {
    if (currentQuestionIndex == fbProvider.questionsData.length - 1) {
      fbProvider.showResult = true;
      // fbProvider.onChangeQuestion;
      print('index: ${currentQuestionIndex}');
      // _resultView();

      // print(fbProvider.showResult );
    }
    pageController.animateToPage(
        currentQuestionIndex = currentQuestionIndex + 1,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 700));

    print('CQI: $currentQuestionIndex');
  }
}
