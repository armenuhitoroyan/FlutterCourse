import 'package:exam_at/pages/homepage/quiz/build_question.dart';
import 'package:exam_at/pages/homepage/quiz/questions_provider.dart';
import 'package:exam_at/pages/homepage/quiz/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../styles/style_of_container.dart';
import '../../../widgets/diagonally_shaped_card.dart';

class QuestionsWidget extends StatelessWidget {
  QuestionsWidget({super.key});
  int index = 0;
  bool checkAnswer = false;

  ColorsContainer colorsContainer = ColorsContainer();

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: <Widget>[
      Scaffold(
        appBar: AppBar(
          backgroundColor: colorsContainer.colors[3],
        ),
        body: ChangeNotifierProvider(
          create: (context) => QuestionsProvider(),
          child: Consumer<QuestionsProvider>(builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Question(value);
            }
          }),
        ),
      ),

      Consumer<QuizProvider>(
        builder: (context, value, child) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(
                    color: const Color.fromRGBO(255, 102, 0, 0.8),
                    width: 4.0,
                  ),
                ),
                child: Center(
                    child: Text(
                   '${value.second}',
                  style: const TextStyle(
                      color: Color.fromRGBO(255, 102, 0, 0.8), fontSize: 20),
                )),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget Question(questionProvider) {
    return Scrollbar(
      child: Column(
        children: <Widget>[
          Row(children: [
            SizedBox(
              width: 200,
              height: 70,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: questionProvider.questionsData.length,
                ),
                itemCount: questionProvider.questionsData.length,
                itemBuilder: (context, index) {
                  return Consumer<QuestionsProvider>(
                    builder: (context, value, child) => DiagonallyShapedCard(
                      index: index + 1,
                      width: 80,
                      height: 50,
                      color: questionProvider.checkAnswer != true
                          ? const Color.fromRGBO(249, 249, 249, 0.8)
                          : index == value.currentQuestionIndex //
                              ? value.correctAnswer == true
                                  ? const Color.fromRGBO(0, 153, 0, 0.8)
                                  : const Color.fromRGBO(204, 0, 1, 0.8)
                              : const Color.fromRGBO(249, 249, 249, 0.8),
                    ),
                  );
                },
              ),
            ),
          ]),
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: ((value) => questionProvider.onChangeIndex(value)),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BuildQuestions(questionProvider.questionsData[index]),
                  ],
                );
              },
              itemCount: questionProvider.questionsData.length,
              scrollDirection: Axis.horizontal,
              controller: questionProvider.pageController,
            ),
          ),
        ],
      ),
    );
  }
}
