import 'package:exam_at/pages/homepage/quiz/bloc/quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/quiz.dart';

// ignore: must_be_immutable
class BuildQuestions extends StatelessWidget {
  Questions question;
  int length = 0;

  BuildQuestions(
    this.question, {
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return _buildQuestion(context, question);
  }

  Widget _buildQuestion(BuildContext context, Questions questionData) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${questionData.questionText}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          questionData.questionImageUrl != null
              ? Image.network('${questionData.questionImageUrl}')
              : Container(),
          Column(
            children: questionData.answers!
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
    Answers answerData,
  ) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                blurRadius: 20.0,
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              length++;
              // state.questions.map((e) => e.answers!.map((e) => e.answerId));

              state.pageController.animateToPage(
                state.currentQuestionIndex+1,
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOut,
              );

              // print(state.questions
              //     .map((e) => e.answers!.map((e) => e.answerId)));
            },
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              color: Colors.white,
              child: SizedBox(
                width: double.infinity,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, right: 10, left: 10),
                  child: Center(child: Text('${answerData.answerText}')),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
