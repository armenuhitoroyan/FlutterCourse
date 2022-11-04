import 'package:exam_at/pages/homepage/quiz/build_question.dart';
import 'package:exam_at/pages/homepage/quiz/questions_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../models/quiz.dart';
import '../../../styles/style_of_container.dart';
import '../../../widgets/diagonally_shaped_card.dart';
import 'bloc/quiz_bloc.dart';

class QuizWidget extends StatelessWidget {
  PageController pageController = PageController();
  List<Questions> questionsList = [];
  QuizWidget({super.key});
  int index = 0;
  bool checkAnswer = false;

  ColorsContainer colorsContainer = ColorsContainer();

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: <Widget>[
      BlocProvider(
        create: (context) => QuizBloc()..add(LoadQuestionsEvent(questionsList)),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(204, 0, 1, 0.8),
            ),
            body: BlocBuilder<QuizBloc, QuizState>(
              builder: (context, state) {
                if (state.isLoading == true) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Color.fromRGBO(204, 0, 1, 0.8),
                    ),
                  );
                } else {
                  print(state.questions.length);
                  return Container(
                    child: Center(
                      child: Text('${state.questions.length}'),
                      // Text('${state.questions.last.questionId}'),
                    ),
                  );
                }
              },
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          child: Center(
            child: Container(
                // ToDo Timer
                ),
          ),
        ),
      ),
    ]);
  }

  Widget Question(List<Questions> questions) {
    return Scrollbar(
      child: Column(
        children: <Widget>[
          Row(children: [
            SizedBox(
              width: 200,
              height: 70,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: questions.length,
                ),
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Consumer<QuestionsProvider>(
                    builder: (context, value, child) => DiagonallyShapedCard(
                        index: index + 1,
                        width: 80,
                        height: 50,
                        color: const Color.fromRGBO(249, 249, 249, 0.8)),
                  );
                },
              ),
            ),
          ]),
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: ((value) => index),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BuildQuestions(questions[index]),
                  ],
                );
              },
              itemCount: questions.length,
              scrollDirection: Axis.horizontal,
              controller: pageController,
            ),
          ),
        ],
      ),
    );
  }
}
