import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base/controllers/feedback_provider.dart';
import '../../models/feedback/feedback_model.dart';

class BuildQuestions extends StatelessWidget {
  Question question;

  BuildQuestions(this.question, {super.key,});
  @override
  Widget build(BuildContext context) {
    return _buildQuestion(context, question);
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

